package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.auditoriaDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/auditoria")
public class AuditoriaController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private auditoriaDAO auditoriaDAO;
    @GetMapping("/empleados")
    @AccessControl(roles="ROLE_Ver_auditoria_de_empleados")
    public String listAudEmpleados(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Auditoria_Empleado> auditEmp = auditoriaDAO.getAuditoriaEmps();
        model.addAttribute("empleado",auditEmp);
        return "auditoria/empleados";
    }

    @GetMapping("/detalles")
    @AccessControl(roles="ROLE_Ver_auditoria_de_empleados")
    public String detalles(Model model, @RequestParam("id") int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Auditoria_Empleado auditoriaEmpleado = auditoriaDAO.getAuditoriaEmp(id);
        model.addAttribute("empleado", auditoriaEmpleado);
        return "auditoria/empleados-detalle";
    }
    @GetMapping("/deduccionBeneficiosGlobal")
    @AccessControl(roles="ROLE_Ver_deducciones_y_beneficios_globales")
    public String listAudDecBenGlo(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Auditoria_DeduccionBeneficioGlobal> listaDecBenGlo = auditoriaDAO.getAuditoriaDecBenGlo();
        model.addAttribute("listaDecBenGlo",listaDecBenGlo);
        return "auditoria/DeduccionBeneficioGlobal";
    }
    @GetMapping("/deduccionBeneficiosEmpleado")
    @AccessControl(roles="ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados")
    public String listAudDecBenEmp(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Auditoria_DeduccionBeneficioEmpleado> listaDecBen = auditoriaDAO.getAuditoriaDecBenEmp();
        model.addAttribute("listaDecBen",listaDecBen);
        return "auditoria/DeduccionBeneficioEmpleado";
    }

}
