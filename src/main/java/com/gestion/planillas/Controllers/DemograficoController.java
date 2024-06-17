package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.demograficoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/demografia")
public class DemograficoController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private demograficoDAO demograficoDAO;

    @GetMapping("/departamentos")
    @AccessControl(roles="ROLE_Ver_demografía")
    public String departamentos(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Object> departamentos=demograficoDAO.countEmpleadosPorDep();
        long nDeEmpleados=demograficoDAO.getNumEmpleados();
        model.addAttribute("nDeEmpleados",nDeEmpleados);
        model.addAttribute("departamentos",departamentos);

        List<String> nombresDepartamentos = new ArrayList<>();
        List<Long> cantidadEmpleados = new ArrayList<>();


        for (Object obj : departamentos) {
            Map<String, Object> map = (Map<String, Object>) obj;
            nombresDepartamentos.add((String) map.get("nombreDepartamento"));
            cantidadEmpleados.add((Long) map.get("cantidad_empleados"));
        }
        model.addAttribute("nombresDepartamentos", nombresDepartamentos);
        model.addAttribute("cantidadEmpleados", cantidadEmpleados);

        return "demografico/demografico-departamentos";
    }
    @GetMapping("/municipios")
    @AccessControl(roles="ROLE_Ver_demografía")
    public String municipios(Model model,@RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Object> municipios=demograficoDAO.countEmpleadosPorMun(id);
        String nombreDepartamento=demograficoDAO.depSeleccionado(id);
        List<Usuario> usuario=usuarioDAO.getUsuarios();
        model.addAttribute("municipios",municipios);
        model.addAttribute("nombreDepartamento",nombreDepartamento);
        return "demografico/demografico-municipios";
    }

    @GetMapping("/estadosCiviles")
    @AccessControl(roles="ROLE_Ver_estados_civiles")
    public String estadosCiviles(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        long nDeEmpleados=demograficoDAO.getNumEmpleados();
        model.addAttribute("nDeEmpleados",nDeEmpleados);

        List<Object[]> estadoCivilEst = demograficoDAO.countEmpleadosPorEstadoCivil();
        model.addAttribute("estadoCivilEst", estadoCivilEst);

        return "demografico/demografico-estado-civil";
    }

}
