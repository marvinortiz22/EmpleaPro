package com.gestion.planillas.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.demograficoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import java.text.DateFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;
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

    Long ACCES_TOKEN_VALIDITY_SECONDS = 2_592_000L;
    String ACCES_TOKEN_SECRET = "7WK5T79u5mIzjIXXi2oI9Fglmgivv7RAJ7izyj9tUyQ";

    @PostMapping("/login")
    public String login(@RequestBody Map<String, String> body) {
        String username = body.get("username");
        String password = body.get("password");

        if (username == null || password == null) {
            return "Faltan datos de login";
        }

        Usuario usuario = usuarioDAO.getUsuarioPorCampo("username", username);
        if (usuario == null) {
            return "El usuario no existe";
        }

        if (!passwordEncoder.matches(password, usuario.getPassword())) {
            return "Contraseña incorrecta";
        }

        long expirationTime= ACCES_TOKEN_VALIDITY_SECONDS *1_000;
        Date expirationDate=new Date(System.currentTimeMillis()+expirationTime);

        List<Permiso> permisos = usuarioDAO.getPermisosDeUsuario(username);
        List<String> nombres = permisos.stream()
                .map(Permiso::getNombrePermiso)
                .collect(Collectors.toList());

        Map<String,Object> extra=new HashMap<>();
        extra.put("permisos", nombres);

        return Jwts.builder()
                .setSubject(username)
                .setExpiration(expirationDate)
                .addClaims(extra)
                .signWith(Keys.hmacShaKeyFor(ACCES_TOKEN_SECRET.getBytes()))
                .compact();
    }

    @PostMapping("/planilla")
    public ResponseEntity<?> planillaPost(@RequestBody(required = false) Map<String, String> body){
        if (body == null || body.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of(
                    "Error", "El cuerpo de la solicitud no puede estar vacío"
            ));
        }

        String fecha_inicio = body.get("fecha_inicio");
        String fecha_fin = body.get("fecha_fin");
        int empleado_id;

        if(fecha_inicio==null||fecha_fin==null){
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Se debe enviar una fecha de inicio y una fecha de fin"));
        }

        try {
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            formatter.setLenient(false);
            Date fecha_inicio_date=formatter.parse(fecha_inicio);
            Date fecha_fin_date=formatter.parse(fecha_fin);
            if (fecha_fin_date.before(fecha_inicio_date)){
                return ResponseEntity
                        .badRequest()
                        .body(Map.of("Error", "La fecha de inicio debe ser menor que la fecha de fin"));
            }
        } catch (Exception e) {
            return ResponseEntity
                    .badRequest()
                    .body(Map.of("Error", "Las fechas no son válidas"));
        }

        List<Object[]> planillaList= new ArrayList<>();

        if (body.get("empleado_id")!=null){
            try{
                empleado_id = Integer.parseInt(body.get("empleado_id"));
            } catch (Exception e){
                return ResponseEntity
                        .badRequest()
                        .body(Map.of("Error", "El id del empleado debe ser un número o una cadena"));
            }
            Object[] boleta= contaduriaDAO.planillaEmpleado(fecha_inicio,fecha_fin,empleado_id);
            if(boleta == null){
                return ResponseEntity
                        .status(HttpStatus.NOT_FOUND)
                        .body(Map.of("Error", "No se encontró el empleado especificado"));
            }
            planillaList.add(boleta);
        }else{
            planillaList= contaduriaDAO.planilla(fecha_inicio,fecha_fin);
            if(planillaList.isEmpty()){
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
            resultado.put("Salario base",currencyFormatter.format(planilla[5]));
            resultado.put("Vacaciones", currencyFormatter.format(planilla[6]));
            resultado.put("Horas extra",currencyFormatter.format(planilla[7]));
            resultado.put("Permisos remunerables",currencyFormatter.format(planilla[8]));
            resultado.put("Otros beneficios", currencyFormatter.format(planilla[9]));
            resultado.put("Salario + beneficios", currencyFormatter.format(planilla[10]));
            resultado.put("ISSS", currencyFormatter.format(planilla[11]));
            resultado.put("AFP",currencyFormatter.format(planilla[12]));
            resultado.put("ISR",currencyFormatter.format(planilla[13]));
            resultado.put("Otras deducciones", currencyFormatter.format(planilla[14]));
            resultado.put("Total deducciones",currencyFormatter.format(planilla[15]));
            resultado.put("Salario neto",currencyFormatter.format(planilla[16]));
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
}
