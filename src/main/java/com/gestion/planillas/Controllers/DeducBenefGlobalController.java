package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.deduccionBeneficioDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;
import com.gestion.planillas.modelos.Otros.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/deduccionesBeneficiosGlobales")
public class DeducBenefGlobalController {
    @Autowired
    private deduccionBeneficioDAO deduccionBeneficioDAO;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private empleadoDAO empleadoDAO;
    @GetMapping("/listar")
    @AccessControl(roles = "ROLE_Ver_deducciones_y_beneficios_globales")
    public String listar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<DeduccionBeneficioGlobal> deduccionesBeneficios= deduccionBeneficioDAO.getDeduccionesGlobales();
        model.addAttribute("deduccionesBeneficios",deduccionesBeneficios);
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        return "deduccionBeneficioGlobal/listar";
    }
    @GetMapping("/agregar")
    @AccessControl(roles = "ROLE_Agregar_deducciones_y_beneficios_globales")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DeduccionBeneficioGlobal deduccionBeneficio=new DeduccionBeneficioGlobal();
        model.addAttribute("deduccionBeneficio",deduccionBeneficio);
        return "deduccionBeneficioGlobal/agregar";
    }
    @PostMapping("/agregar")
    public String agregar(@ModelAttribute("deduccionBeneficio")DeduccionBeneficioGlobal deduccionBeneficioGlobal, RedirectAttributes redirectAttributes){
        deduccionBeneficioDAO.guardar(deduccionBeneficioGlobal.getDeduccionBeneficio());
        deduccionBeneficioDAO.guardarGlobal(deduccionBeneficioGlobal);
        Alert alert;
        if(deduccionBeneficioGlobal.getDeduccionBeneficio().getTipo().equals("D"))
            alert=new Alert("success","La deducción se ha añadido exitosamente");
        else
            alert=new Alert("success","El beneficio se ha añadido exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/deduccionesBeneficiosGlobales/listar";
    }
    @GetMapping("/editar")
    @AccessControl(roles = "ROLE_Editar_deducciones_y_beneficios_globales")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DeduccionBeneficioGlobal deduccionBeneficio= deduccionBeneficioDAO.getDeduccionBeneficioGlobal(id);
        model.addAttribute("deduccionBeneficio",deduccionBeneficio);
        return "deduccionBeneficioGlobal/editar";
    }
    @PostMapping("/editar")
    public String editar(@ModelAttribute("deduccionBeneficio")DeduccionBeneficioGlobal deduccionBeneficioGlobal,RedirectAttributes redirectAttributes){
        deduccionBeneficioDAO.guardar(deduccionBeneficioGlobal.getDeduccionBeneficio());
        deduccionBeneficioDAO.guardarGlobal(deduccionBeneficioGlobal);
        Alert alert;
        if(deduccionBeneficioGlobal.getDeduccionBeneficio().getTipo().equals("D"))
            alert=new Alert("success","La deducción se ha editado exitosamente");
        else
            alert=new Alert("success","El beneficio se ha editado exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/deduccionesBeneficiosGlobales/listar";
    }
    @GetMapping("/cambiarEstado")
    public String cambiarEstado(@RequestParam("id")int id,RedirectAttributes redirectAttributes){
        DeduccionBeneficioGlobal deduccionBeneficioGlobal=deduccionBeneficioDAO.getDeduccionBeneficioGlobal(id);
        String objetoAlerta="";
        if(deduccionBeneficioGlobal.getDeduccionBeneficio().getTipo().equals("D"))
            objetoAlerta="La deducción";
        else
            objetoAlerta="El beneficio";
        Alert alert;
        if(deduccionBeneficioGlobal.isEstado())
            alert=new Alert("danger",objetoAlerta+" se ha deshabilitado correctamente");
        else
            alert=new Alert("success",objetoAlerta+" se ha habilitado correctamente");
        redirectAttributes.addFlashAttribute("alert",alert);

        deduccionBeneficioGlobal.setEstado(!deduccionBeneficioGlobal.isEstado());
        deduccionBeneficioDAO.guardarGlobal(deduccionBeneficioGlobal);
        return "redirect:/deduccionesBeneficiosGlobales/listar";
    }


}
