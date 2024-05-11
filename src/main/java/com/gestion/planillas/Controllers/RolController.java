package com.gestion.planillas.Controllers;

import com.gestion.planillas.Modelos.Permiso;
import com.gestion.planillas.Modelos.Rol;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.permisoDAO;
import org.springframework.web.bind.annotation.RequestParam;

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
        return "rol-listar";
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
        return "rol-form";
    }
    @PostMapping("/guardar")
    public String guardar(HttpServletRequest request, @RequestParam("permisos") List<Integer> ids, HttpSession session) {
        Rol rol = new Rol();
        List<Permiso> permisos = new ArrayList<>();
        for (int id : ids) {
            permisos.add(permisoDAO.getPermiso(id));
        }
        rol.setIdRol(Integer.parseInt(request.getParameter("idRol")));
        rol.setNombreRol(request.getParameter("nombreRol"));
        rol.setPermisos(permisos);
        rolDAO.guardarRol(rol);
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
        return "rol-form";
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
        return "rol-detalles";
    }
}
