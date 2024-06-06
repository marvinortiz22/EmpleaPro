package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.deduccionBeneficioDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Otros.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/deduccionesBeneficiosEmpleados")
public class DeducBenefEmpController {
    @Autowired
    private deduccionBeneficioDAO deduccionBeneficioDAO;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private empleadoDAO empleadoDAO;

    @GetMapping("/listarEmpleados")
    @AccessControl(roles = "ROLE_Ver_deducciones_y_beneficios_de_empleados")
    public String listarEmpleados(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Empleado> empleados = empleadoDAO.getEmpleados();
        model.addAttribute("empleados", empleados);
        return "deduccionBeneficioEmp/empleados-listar";
    }
    @GetMapping("/listar")
    @AccessControl(roles = "ROLE_Ver_deducciones_y_beneficios_de_empleados")
    public String deducBenefEmp(Model model,@RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<DeduccionBeneficio_Empleado> deduccionBeneficioEmpleados= deduccionBeneficioDAO.getDeduccionesBeneficiosEmp(id);
        model.addAttribute("deduccionesBeneficios",deduccionBeneficioEmpleados);
        Empleado empleado=empleadoDAO.getEmpleado(id);
        model.addAttribute("empleado",empleado);
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        return "deduccionBeneficioEmp/listar";
    }
    @GetMapping("/agregar")
    @AccessControl(roles = "ROLE_Agregar_deducciones_y_beneficios_de_empleados")
    public String agregar(Model model,@RequestParam("empleado")int id){
        Empleado empleado=empleadoDAO.getEmpleado(id);
        model.addAttribute("empleado",empleado);
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DeduccionBeneficio_Empleado deduccionBeneficioEmpleado=new DeduccionBeneficio_Empleado();
        model.addAttribute("deducBenefEmp",deduccionBeneficioEmpleado);
        List<DeduccionBeneficio> deduccionesBeneficiosBase=deduccionBeneficioDAO.getDeduccionesBeneficios();
        model.addAttribute("deduccionesBeneficiosBase",deduccionesBeneficiosBase);
        return "deduccionBeneficioEmp/agregar";
    }
    @PostMapping("/agregar")
    public String agregar(@ModelAttribute("deduccionBeneficio")DeduccionBeneficio_Empleado deduccionBeneficioEmpleado,RedirectAttributes redirectAttributes){
        deduccionBeneficioDAO.guardarEmp(deduccionBeneficioEmpleado);
        Alert alert;
        DeduccionBeneficio deduccionBeneficio=deduccionBeneficioDAO.getDeduccionBeneficioBase(deduccionBeneficioEmpleado.getDeduccionBeneficio().getIdDeducBenef());
        if(deduccionBeneficio.getTipo().equals("D"))
            alert=new Alert("success","La deducción se ha añadido exitosamente");
        else
            alert=new Alert("success","El beneficio se ha añadido exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/deduccionesBeneficiosEmpleados/listar?id="+deduccionBeneficioEmpleado.getEmpleado().getIdEmpleado();
    }
    @GetMapping("/editar")
    @AccessControl(roles = "ROLE_Editar_deducciones_y_beneficios_de_empleados")
    public String editar(Model model,@RequestParam("id") int id,@RequestParam("empleado")int idEmpleado){
        Empleado empleado=empleadoDAO.getEmpleado(idEmpleado);
        model.addAttribute("empleado",empleado);
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DeduccionBeneficio_Empleado deduccionBeneficioEmpleado=deduccionBeneficioDAO.getDeduccionBeneficioEmp(id);
        model.addAttribute("deducBenefEmp",deduccionBeneficioEmpleado);
        List<DeduccionBeneficio> deduccionesBeneficiosBase=deduccionBeneficioDAO.getDeduccionesBeneficios();
        model.addAttribute("deduccionesBeneficiosBase",deduccionesBeneficiosBase);
        return "deduccionBeneficioEmp/editar";
    }
    @PostMapping("/editar")
    public String edita(@ModelAttribute("deduccionBeneficio")DeduccionBeneficio_Empleado deduccionBeneficioEmpleado, RedirectAttributes redirectAttributes){
        deduccionBeneficioDAO.guardarEmp(deduccionBeneficioEmpleado);
        Alert alert;
        DeduccionBeneficio deduccionBeneficio=deduccionBeneficioDAO.getDeduccionBeneficioBase(deduccionBeneficioEmpleado.getDeduccionBeneficio().getIdDeducBenef());
        if(deduccionBeneficio.getTipo().equals("D"))
            alert=new Alert("success","La deducción se ha editado exitosamente");
        else
            alert=new Alert("success","El beneficio se ha editado exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/deduccionesBeneficiosEmpleados/listar?id="+deduccionBeneficioEmpleado.getEmpleado().getIdEmpleado();
    }
}
