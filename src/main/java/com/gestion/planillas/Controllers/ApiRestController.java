package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.demograficoDAO;
import com.gestion.planillas.DTO.DepartamentoDTO;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiRestController {

    private final String SECRET_KEY = "wY2d7-wG#x%5";

    @Autowired
    private demograficoDAO demograficoDAO;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private com.gestion.planillas.DAO.usuarioDAO usuarioDAO;

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

        return "Login exitoso";
    }

    @GetMapping("/departamentos")
    public ResponseEntity<List<DepartamentoDTO>> getDepartamentosConCantidad() {
        List<Object> departamentosRaw = demograficoDAO.countEmpleadosPorDep();

        List<DepartamentoDTO> departamentos = new ArrayList<>();

        for (Object obj : departamentosRaw) {
            Map<String, Object> map = (Map<String, Object>) obj;
            String nombre = (String) map.get("nombreDepartamento");
            Long cantidad = ((Number) map.get("cantidad_empleados")).longValue();
            departamentos.add(new DepartamentoDTO(nombre, cantidad));
        }

        return ResponseEntity.ok(departamentos);
    }
}
