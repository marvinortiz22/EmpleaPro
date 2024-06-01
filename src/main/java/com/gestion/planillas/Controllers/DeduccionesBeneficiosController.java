package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.deduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/deduccionesBeneficios")
public class DeduccionesBeneficiosController {
    @Autowired
    private deduccionBeneficio deduccionGlobalDAO;
    @GetMapping("/d")
    public String insertarDeduccion(Model model){
        DeduccionBeneficioGlobal deduccionBeneficio=deduccionGlobalDAO.getDeduccionBeneficio(1);
        model.addAttribute("deduccionBeneficio",deduccionBeneficio);
        return "deduccionBeneficio/deduccionBeneficio-editar";
    }
    @GetMapping("/d2")
    public String insertarDeduccion2(Model model){
        deduccionGlobalDAO.getDeduccionesGlobales();
        return "deduccionBeneficio/deduccionBeneficio-editar";
    }
    //
    @PostMapping("/guardarDeduc")
    public String insertarDeduccion22(@ModelAttribute("deduccionBeneficio")DeduccionBeneficio deduccionBeneficio){
        deduccionGlobalDAO.guardar(deduccionBeneficio);
        return "redirect:/usuarioEjemplo/listar";
    }
    @GetMapping("/agregar")
    public String agregar(Model model){
        //DeduccionBeneficioGlobal deduccionBeneficio=new DeduccionBeneficioGlobal();
        DeduccionBeneficioGlobal deduccionBeneficio=deduccionGlobalDAO.getDeduccionBeneficio(1);
        model.addAttribute("deduccionBeneficio",deduccionBeneficio);
        return "deduccionBeneficio/deduccionBeneficio-editar";
    }
    @PostMapping("/agregar")
    public String agregar(@ModelAttribute("deduccionBeneficio")DeduccionBeneficioGlobal deduccionBeneficioGlobal){
        deduccionGlobalDAO.guardar(deduccionBeneficioGlobal.getDeduccionBeneficio());
        deduccionGlobalDAO.guardar(deduccionBeneficioGlobal);
        return "redirect:/";
    }
}
