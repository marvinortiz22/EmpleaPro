package com.gestion.planillas.Controllers;

import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.Usuario;
import com.gestion.planillas.otros.EmailService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.apache.catalina.Authenticator;
import org.apache.coyote.Request;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import com.gestion.planillas.DAO.usuarioDAO;

@RequestMapping("/")
@Controller
public class SecurityController {
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private EmailService emailService;

    @GetMapping("")
    public String principal(){
        return "redirect:/usuarioEjemplo/listar";
    }

    @GetMapping("login")
    public String login(){
        return "login";
    }
    @PostMapping("login")
    public String login2(){
        return "redirect:/usuarioEjemplo/listar";
    }
    @GetMapping("registro")
    public String registro(Model model){
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);
        return "registro";
    }
    @PostMapping("registro")
    public String registroPost(@Valid @ModelAttribute("usuario")Usuario usuario, BindingResult result){
        if(usuarioDAO.getUsuarioPorCampo("username",usuario.getUsername())!=null)
            result.rejectValue("username","error.username","Ya existe un usuario con este nombre de usuario");
        if(usuarioDAO.getUsuarioPorCampo("email",usuario.getEmail())!=null)
            result.rejectValue("email","error.email","Ya existe un usuario con este correo electrónico");
        if (result.hasErrors())
            return "registro";
        else{
            usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
            usuarioDAO.guardarUsuario(usuario);

            /*List<Object> emails=new ArrayList<>();
            String subject = "Asunto del correo";
            for(Object email:emails){
                String to = email.toString();
                String text = "nuevo usuario\n\nlocalhost:8000/usuario/editar?id="+usuario.getIdUsuario();
                emailService.sendEmail(to, subject, text);
            }*/


            return "redirect:/usuarioEjemplo/listar";
        }
    }

    @GetMapping("logout")
    public String logout(){
        logout();
        return "redirect:/usuario/listar";
    }
    @GetMapping("error")
    @ResponseBody
    public String errorUrl() {
        return "error de acceso";
    }
}
