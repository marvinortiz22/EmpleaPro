package com.gestion.planillas.Controllers;


import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.ProfesionOficio;
import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.DAO.oficioDAO;
import java.util.List;

@Controller
@RequestMapping("/oficios")
public class OficioController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private oficioDAO oficioDAO;
    @GetMapping("/listar")
    public String listarOficios(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<ProfesionOficio> profyOficios = oficioDAO.getProfyOficios();
        model.addAttribute("profyOficios",profyOficios);
        return "oficios";
    }

    @GetMapping("/agregar")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        ProfesionOficio oficio = new ProfesionOficio();
        model.addAttribute("oficio", oficio);
        return "oficios-agregar";
    }
    @PostMapping("/agregar")
    public String addProfOf(@ModelAttribute("oficio")ProfesionOficio proyOf){
        oficioDAO.guardarOficio(proyOf);
        return "redirect:/oficios/listar";
    }
    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        ProfesionOficio oficio = oficioDAO.getOficio(id);
        model.addAttribute("oficio", oficio);
        return "oficios-editar";
    }
    @PostMapping("/editar")
    public String editarPost(HttpServletRequest request){
        ProfesionOficio oficio = oficioDAO.getOficio(Integer.parseInt(request.getParameter("idProfOfc")));
        oficio.setNombreProfOfc(request.getParameter("nombreProfOfc"));
        oficioDAO.guardarOficio(oficio);
        return "redirect:/oficios/listar";
    }

}