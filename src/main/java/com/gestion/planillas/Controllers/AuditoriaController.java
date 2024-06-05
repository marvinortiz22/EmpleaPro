package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.auditoriaDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Auditoria_DeduccionBeneficioEmpleado;
import com.gestion.planillas.modelos.Auditoria_Empleado;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.ProfesionOficio;
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
    private auditoriaDAO auditoria;
    @GetMapping("/empleados")
    @AccessControl(roles="ROLE_Ver_auditoria_de_empleados")
    public String listAudEmpleados(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Auditoria_Empleado> auditEmp = auditoria.getAuditoriaEmps();
        model.addAttribute("empleado",auditEmp);
        return "auditoria/empleados";
    }

    @GetMapping("/detalles")
    @AccessControl(roles="ROLE_Ver_auditoria_de_empleados")
    public String detalles(Model model, @RequestParam("id") int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Auditoria_Empleado auditoriaEmpleado = auditoria.getAuditoriaEmp(id);
        model.addAttribute("empleado", auditoriaEmpleado);
        return "auditoria/empleados-detalle";
    }
    @GetMapping("/deduccionBeneficios")
    @AccessControl(roles="ROLE_Ver_auditoria_de_deducciones_y_beneficios_de_empleados")
    public String listAudDecBenEmp(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Auditoria_DeduccionBeneficioEmpleado> listaDecBen = auditoria.getAuditoriaDecBenEmp();
        model.addAttribute("listaDecBen",listaDecBen);
        return "auditoria/DeduccionBeneficioEmpleado";
    }

}
