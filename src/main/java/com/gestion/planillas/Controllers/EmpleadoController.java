package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Otros.Alert;
import com.gestion.planillas.modelos.ProfOfc_Empleado;
import com.gestion.planillas.modelos.ProfesionOficio;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/empleado")
public class EmpleadoController {
    @Autowired
    private com.gestion.planillas.DAO.usuarioDAO usuarioDAO;
    @Autowired
    private  com.gestion.planillas.DAO.empleadoDAO empleadoDAO;

    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Administrador")
    public String listar(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<Empleado> empleados = empleadoDAO.getEmpleados();
        model.addAttribute("empleados", empleados);

        return "empleado/empleados-listar";
    }

    @GetMapping("/detalles")
    @AccessControl(roles="ROLE_Administrador")
    public String detalles(Model model, @RequestParam("id") int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Empleado empleado = empleadoDAO.getEmpleado(id);
        model.addAttribute("empleado", empleado);

        List<ProfesionOficio> profesionOficios = empleadoDAO.getProfesionesOficios(id);
        model.addAttribute("profesionesOficios", profesionOficios);

        return "empleado/empleado-detalle";
    }

    @GetMapping("/agregar")
    public String agregar(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        model.addAttribute("empleado", new Empleado());
        return "empleado/empleado-agregar";
    }

    @PostMapping("/guardar")
    public String guardar(@ModelAttribute("empleado") Empleado empleado) {
        //empleadoService.addEmpleado(empleado);
        return "redirect:/empleado/detalles";
    }

}
