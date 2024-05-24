package com.gestion.planillas.Controllers;

import com.gestion.planillas.modelos.Otros.Alert;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Rol;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.permisoDAO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/rol")
public class RolController {

    @Autowired
    private rolDAO rolDAO;

    @Autowired
    private usuarioDAO usuarioDAO;

    @Autowired
    private permisoDAO permisoDAO;

    @GetMapping("/listar")
    public String listar(Model model){
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        return "rol/rol-listar";
    }

    @GetMapping("/agregar")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Rol rol=new Rol();
        model.addAttribute("rol",rol);

        //para los select de las llaves foraneas
        List<Permiso> permisos=permisoDAO.getPermisos();
        for(Permiso permiso:permisos){
            permiso.setNombrePermiso(permiso.getNombrePermiso().replace("ROLE",""));
            permiso.setNombrePermiso(permiso.getNombrePermiso().replace("_"," "));
        }
        model.addAttribute("permisos",permisos);
        return "rol/rol-agregar";
    }
    @PostMapping("/agregar")
    public String agregarPost(@ModelAttribute("rol")Rol rol, RedirectAttributes redirectAttributes) {
        rolDAO.guardarRol(rol);
        Alert alert=new Alert("success","Se ha editado el rol exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/rol/listar";
    }
    @PostMapping("/editar")
    public String editarPost(@ModelAttribute("rol")Rol rol, RedirectAttributes redirectAttributes) {
        rolDAO.guardarRol(rol);
        Alert alert=new Alert("success","Se ha editado el rol exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/rol/listar";
    }
    @GetMapping("/editar")
    public String editar(Model model,@RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Rol rol=rolDAO.getRol(id);
        model.addAttribute("rol",rol);

        //para los select de las llaves foraneas
        List<Permiso> permisos=permisoDAO.getPermisos();
        for(Permiso permiso:permisos){
            permiso.setNombrePermiso(permiso.getNombrePermiso().replace("ROLE",""));
            permiso.setNombrePermiso(permiso.getNombrePermiso().replace("_"," "));
        }
        model.addAttribute("permisos",permisos);
        return "rol/rol-editar";
    }
    @GetMapping("/detalles")
    public String detalles(Model model,@RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Rol rol=rolDAO.getRol(id);
        model.addAttribute("rol",rol);

        //para los select de las llaves foraneas
        List<Permiso> permisos=rol.getPermisos();
        for(Permiso permiso:permisos){
            permiso.setNombrePermiso(permiso.getNombrePermiso().replace("ROLE",""));
            permiso.setNombrePermiso(permiso.getNombrePermiso().replace("_"," "));
        }
        rol.setPermisos(permisos);
        return "rol/rol-detalles";
    }
}
