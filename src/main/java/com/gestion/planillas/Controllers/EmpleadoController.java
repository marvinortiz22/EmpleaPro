package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.ProfOfc_Empleado;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

        //List<ProfOfc_Empleado> profOfcEmpleados = empleadoDAO.getEmpleados();
        //model.addAttribute("profOfcEmpleados", profOfcEmpleados);

        return "empleado/empleado-detalle";
    }

}
