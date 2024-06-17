package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Otros.Alert;
import com.gestion.planillas.modelos.ProfesionOficio;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.DAO.oficioDAO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/oficios")
public class OficioController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private oficioDAO oficioDAO;
    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Ver_profesiones_y_oficios")
    public String listarOficios(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Object[]> profyOficios = oficioDAO.getProfConJoin();
        model.addAttribute("profyOficios",profyOficios);
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        return "oficios/oficios";
    }
    @AccessControl(roles = "ROLE_Agregar_oficios")
    @GetMapping("/agregar")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        ProfesionOficio oficio = new ProfesionOficio();
        model.addAttribute("oficio", oficio);
        return "oficios/oficios-agregar";
    }
    @PostMapping("/agregar")
    public String addProfOf(@ModelAttribute("oficio")ProfesionOficio proyOf, RedirectAttributes redirectAttributes){
        oficioDAO.guardarOficio(proyOf);
        Alert alert=new Alert("success","Se ha agregado el registro exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/oficios/listar";
    }
    @AccessControl(roles="ROLE_Editar_oficios")
    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        ProfesionOficio oficio = oficioDAO.getOficio(id);
        model.addAttribute("oficio", oficio);
        return "oficios/oficios-editar";
    }
    @PostMapping("/editar")
    public String editarPost(HttpServletRequest request,RedirectAttributes redirectAttributes){
        ProfesionOficio oficio = oficioDAO.getOficio(Integer.parseInt(request.getParameter("idProfOfc")));
        oficio.setNombreProfOfc(request.getParameter("nombreProfOfc"));
        oficioDAO.guardarOficio(oficio);
        Alert alert=new Alert("success","Se ha editado el registro exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/oficios/listar";
    }

}
