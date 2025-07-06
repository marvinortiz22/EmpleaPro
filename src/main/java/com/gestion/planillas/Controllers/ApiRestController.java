package com.gestion.planillas.Controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.demograficoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.Usuario;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api")
public class ApiRestController {

    @Autowired
    private demograficoDAO demograficoDAO;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private usuarioDAO usuarioDAO;

    @Autowired
    private contaduriaDAO contaduriaDAO;

    @Autowired
    private rolDAO rolDAO;

    Long ACCES_TOKEN_VALIDITY_SECONDS = 21_600L;
    String ACCES_TOKEN_SECRET = "7WK5T79u5mIzjIXXi2oI9Fglmgivv7RAJ7izyj9tUyQ";

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> body) {
        String username = body.get("username");
        String password = body.get("password");

        if (username == null || password == null) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error","Debe proporcionar un nombre de usuario y una contraseña"));
        }

        Usuario usuario = usuarioDAO.getUsuarioPorCampo("username", username);
        if (usuario == null) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error","El usuario no existe"));
        }

        if (!passwordEncoder.matches(password, usuario.getPassword())) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error","Contraseña incorrecta"));
        }

        long expirationTime = ACCES_TOKEN_VALIDITY_SECONDS * 1_000;
        Date expirationDate = new Date(System.currentTimeMillis() + expirationTime);

        List<Permiso> permisos = usuarioDAO.getPermisosDeUsuario(username);
        List<String> nombres = permisos.stream()
                .map(Permiso::getNombrePermiso)
                .collect(Collectors.toList());

        Map<String, Object> extra = new HashMap<>();
        extra.put("permisos", nombres);

        String token= Jwts.builder()
                .setSubject(username)
                .setExpiration(expirationDate)
                .addClaims(extra)
                .signWith(Keys.hmacShaKeyFor(ACCES_TOKEN_SECRET.getBytes()))
                .compact();
        return ResponseEntity
                .ok(Map.of("Token",token));
    }

    @PostMapping("/planilla")
    public ResponseEntity<?> planillaPost(@RequestBody(required = false) Map<String, String> body,
                                          @RequestHeader(value = "Authorization", required = false) String authHeader) {

        ResponseEntity<?> errores=hayErrores(body,authHeader,"ROLE_Ver_planilla");
        if (errores!=null){
            return errores;
        }

        String fecha_inicio = body.get("fecha_inicio");
        String fecha_fin = body.get("fecha_fin");
        String numerodoc;

        if (fecha_inicio == null || fecha_fin == null) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Se debe enviar una fecha de inicio y una fecha de fin"));
        }

        try {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setLenient(false);
            Date fecha_inicio_date = formatter.parse(fecha_inicio);
            Date fecha_fin_date = formatter.parse(fecha_fin);
            if (fecha_fin_date.before(fecha_inicio_date)) {
                return ResponseEntity
                        .badRequest()
                        .body(Map.of("Error", "La fecha de inicio debe ser menor que la fecha de fin"));
            }
        } catch (Exception e) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Las fechas no son válidas"));
        }

        List<Object[]> planillaList = new ArrayList<>();

        if (body.get("numerodoc") != null) {
            numerodoc = body.get("numerodoc");
            Object[] boleta = contaduriaDAO.planillaEmpleado2(fecha_inicio, fecha_fin, numerodoc);
            if (boleta == null) {
                return ResponseEntity
                        .status(HttpStatus.NOT_FOUND)
                        .body(Map.of("Error", "No se encontró el empleado especificado"));
            }
            planillaList.add(boleta);
        } else {
            planillaList = contaduriaDAO.planilla(fecha_inicio, fecha_fin);
            if (planillaList.isEmpty()) {
                return ResponseEntity
                        .status(HttpStatus.NOT_FOUND)
                        .body(Map.of("Error", "No se encontraron empleados en planilla para las fechas dadas"));
            }
        }

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (Object[] planilla : planillaList) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("Número de documento", planilla[0]);
            resultado.put("Nombre", planilla[1]);
            resultado.put("Cargo", planilla[2]);
            resultado.put("Salario / hora", currencyFormatter.format(planilla[3]));
            resultado.put("Horas normales", currencyFormatter.format(planilla[4]));
            resultado.put("Salario base", currencyFormatter.format(planilla[5]));
            resultado.put("Vacaciones", currencyFormatter.format(planilla[6]));
            resultado.put("Horas extra", currencyFormatter.format(planilla[7]));
            resultado.put("Permisos remunerables", currencyFormatter.format(planilla[8]));
            resultado.put("Otros beneficios", currencyFormatter.format(planilla[9]));
            resultado.put("Salario + beneficios", currencyFormatter.format(planilla[10]));
            resultado.put("ISSS", currencyFormatter.format(planilla[11]));
            resultado.put("AFP", currencyFormatter.format(planilla[12]));
            resultado.put("ISR", currencyFormatter.format(planilla[13]));
            resultado.put("Otras deducciones", currencyFormatter.format(planilla[14]));
            resultado.put("Total deducciones", currencyFormatter.format(planilla[15]));
            resultado.put("Salario neto", currencyFormatter.format(planilla[16]));
            resultados.add(resultado);
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = "";
        try {
            jsonString = mapper.writeValueAsString(resultados);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ResponseEntity.ok(jsonString);
    }

    @PostMapping("registro")
    public ResponseEntity<?> registroPost(@RequestBody(required = false) Map<String, String> body,
                                          @RequestHeader(value = "Authorization", required = false) String authHeader) {

        ResponseEntity<?> errores=hayErrores(body,authHeader,"ROLE_Crear_usuarios");
        if (errores!=null){
            return errores;
        }

        String username = body.get("username");
        String password = body.get("password");

        if(username==null||password==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Debe proveer un usuario y una contraseña"));
        }

        if (usuarioDAO.getUsuarioPorCampo("username", username) != null)
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Ya existe un usuario con este nombre de usuario"));

        ResponseEntity<?> contrasenaErrores=contrasenaInvalida(password);
        if(contrasenaErrores!=null){
            return contrasenaErrores;
        }

        Usuario usuario = new Usuario();
        usuario.setUsername(username);
        usuario.setPassword(passwordEncoder.encode(password));

        usuarioDAO.guardarUsuario(usuario);

        return ResponseEntity.ok().body(Map.of("Message", "Usuario creado exitosamente"));
    }

    @PostMapping("cambiar_rol")
    public ResponseEntity<?> cambiarRol(@RequestBody(required = false) Map<String, String> body, @RequestHeader(value = "Authorization", required = false) String authHeader) throws JsonProcessingException {
        ResponseEntity<?> errores=hayErrores(body,authHeader,"ROLE_Cambiar_rol");
        if (errores!=null){
            return errores;
        }
        String idRolStr=body.get("idrol");
        String username=body.get("username");

        if(username==null||idRolStr==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Se debe proveer un nombre de usuario y un rol válido"));
        }

        int idRol;
        try {
            idRol = Integer.parseInt(idRolStr);
        } catch (NumberFormatException e) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "el idrol debe ser un número"));
        }

        String token = authHeader.substring(7); // quitar "Bearer "
        Claims claims = Jwts.parserBuilder()
                .setSigningKey(Keys.hmacShaKeyFor(ACCES_TOKEN_SECRET.getBytes()))
                .build()
                .parseClaimsJws(token)
                .getBody();

        String usernameToken = claims.get("sub").toString();

        if(usernameToken.equals(username)){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Un usuario no puede cambiarse su propio rol"));
        }

        Rol rolObject = rolDAO.getRol(idRol);

        if(rolObject==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "No existe el rol ingresado"));
        }

        Usuario usuario = usuarioDAO.getUsuarioPorCampo("username",username);

        if(usuario==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "No existe un usuario con el username ingresado"));
        }

        usuario.setRol(rolObject);
        usuarioDAO.guardarUsuario(usuario);

        return ResponseEntity
                .ok(Map.of("Message", "El rol se cambió exitosamente"));
    }

    @PostMapping("cambiar_contrasena")
    public ResponseEntity<?> cambiarContrasena(@RequestBody(required = false) Map<String, String> body){
        String username=body.get("username");
        String password=body.get("password");
        String newPassword=body.get("newPassword");

        if(username==null||password==null||newPassword==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error","Debe proveer el nombre de usuario, su contraseña y la nueva contraseñá"));
        }

        Usuario usuario = usuarioDAO.getUsuarioPorCampo("username",username);

        if(usuario==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "No existe un usuario con el username ingresado"));
        }

        if (!passwordEncoder.matches(password, usuario.getPassword())) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error","Contraseña incorrecta"));
        }

        if(password.equals(newPassword)){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "La contraseña nueva no puede ser igual a la anterior"));
        }

        ResponseEntity<?> contrasenaErrores=contrasenaInvalida(password);
        if(contrasenaErrores!=null){
            return contrasenaErrores;
        }

        usuario.setPassword(passwordEncoder.encode(newPassword));
        usuarioDAO.guardarUsuario(usuario);

        return ResponseEntity
                .ok(Map.of("Message","La contraseña se modificó exitosamente"));
    }

    public ResponseEntity<?> hayErrores(@RequestBody(required = false) Map<String, String> body,
                                        @RequestHeader(value = "Authorization", required = false) String authHeader,
                                        String permiso){
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of(
                    "error", "No se proporcionó el token"
            ));
        }

        String token = authHeader.substring(7); // quitar "Bearer "
        Claims claims;

        try {
            claims = Jwts.parserBuilder()
                    .setSigningKey(Keys.hmacShaKeyFor(ACCES_TOKEN_SECRET.getBytes()))
                    .build()
                    .parseClaimsJws(token)
                    .getBody();
        }
        catch (ExpiredJwtException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of(
                    "Error", "El token está expirado"
            ));
        }
        catch (JwtException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of(
                    "Error", "El token proporcionado no es válido"
            ));
        }

        List<String> permisosList = (List<String>) claims.get("permisos");
        String[] permisos = permisosList.toArray(new String[0]);
        if (!Arrays.asList(permisos).contains(permiso)){
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of(
                    "Error", "No tiene el permiso necesario para realizar dicha acción"
            ));
        }

        if (body == null || body.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "Error", "El cuerpo de la solicitud no puede estar vacío"
            ));
        }

        return null;
    }

    public ResponseEntity<?> contrasenaInvalida(String password){
        Pattern pattern = Pattern.compile("(?=.*[0-9]).+");//al menos un numero
        Matcher matcher = pattern.matcher(password);

        List<String> Errores = new ArrayList<>();
        if (!matcher.matches())
            Errores.add("La contraseña debe tener al menos un número");

        pattern = Pattern.compile("(?=.*[a-zA-Z]).+");//al menos una letra
        matcher = pattern.matcher(password);
        if (!matcher.matches())
            Errores.add("La contraseña debe tener al menos una letra");

        pattern = Pattern.compile("(?=.*[@#$%^&+=*_/]).+");//al menos un simbolo
        matcher = pattern.matcher(password);
        if (!matcher.matches())
            Errores.add("La contraseña debe tener al menos un símbolo especial");

        if (password.length() < 8)
            Errores.add("La contraseña debe tener al menos 8 caracteres");

        if (!Errores.isEmpty())
            return ResponseEntity.badRequest().body(Map.of("Errores", Errores));

        return null;
    }
}
