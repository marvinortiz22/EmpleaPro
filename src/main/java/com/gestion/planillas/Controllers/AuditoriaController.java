package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.auditoriaDAO;
import com.gestion.planillas.modelos.Auditoria_Empleado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/auditoria")
public class AuditoriaController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private auditoriaDAO auditoria_empleado;
    @GetMapping("/empleados")
    public String listAudEmpleados(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Auditoria_Empleado> auditEmp = auditoria_empleado.getAuditoriaEmp();
        model.addAttribute("empleado",auditEmp);
        return "auditoria/empleados";
    }

}
