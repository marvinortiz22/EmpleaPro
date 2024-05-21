package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.permisoDAO;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.DAO.tipoDocumentoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.Otros.Alert;
import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

//No usen este de ejemplo, usen el otro
@Controller
@RequestMapping("/usuario")
public class UsuarioControllerFinal {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private tipoDocumentoDAO tipoDocumentoDAO;
    @Autowired
    private permisoDAO permisoDAO;
    @Autowired
    private rolDAO rolDAO;
    @GetMapping("/listar")
    public String listar(Model model) {

        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }

        List<Usuario> usuarios = usuarioDAO.getUsuarios();
        model.addAttribute("usuarios", usuarios);
        return "usuario/usuarios-listar";
    }

    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Usuario usuario= usuarioDAO.getUsuario(id);
        model.addAttribute("usuario",usuario);

        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuario/usuarios-editar";
    }
    @PostMapping("/editar")
    public String editarPost(@ModelAttribute("usuario")Usuario usuario, BindingResult result,Model model,RedirectAttributes redirectAttributes){
        String username,email;
        username=usuario.getUsername();
        email=usuario.getEmail();
        int id=usuario.getIdUsuario();

        if(usuarioDAO.getUsuarioPorCampoAjeno("username",username,id)!=null)
            result.rejectValue("username","error.username","Ya existe un usuario con este nombre de usuario");
        if(usuarioDAO.getUsuarioPorCampoAjeno("email",email,id)!=null)
            result.rejectValue("email","error.email","Ya existe un usuario con este correo electrónico");
        if(result.hasErrors()){
            model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
            model.addAttribute("usuario",usuario);
            List<Rol> roles=rolDAO.getRolesValidos();
            model.addAttribute("roles",roles);
            return "usuario/usuarios-editar";
        }else{
            /*Usuario usuarioOriginal=usuarioDAO.getUsuario(usuario.getIdUsuario());
            usuario.setPassword(usuarioOriginal.getPassword());*/
            model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
            usuarioDAO.guardarUsuario(usuario);
            Alert alert=new Alert("success","Se ha editado el usuario exitosamente");
            redirectAttributes.addFlashAttribute("alert",alert);
            return "redirect:/usuario/listar";
        }
    }
    @GetMapping("/cambiarEstado")
    public String cambiarEstado(@RequestParam("id")int id, RedirectAttributes redirectAttributes){
        Usuario usuario=usuarioDAO.getUsuario(id);
        Alert alert;
        if(usuario.isEstado())
            alert=new Alert("danger","Se ha bloqueado el usuario "+usuario.getUsername());
        else
            alert=new Alert("success","Se ha desbloqueado el usuario "+usuario.getUsername());
        redirectAttributes.addFlashAttribute("alert",alert);
        usuario.setEstado(!usuario.isEstado());
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuario/listar";
    }

}
