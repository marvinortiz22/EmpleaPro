package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.Otros.EmailService;
import com.gestion.planillas.Modelos.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

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
    public String login(Model model,@RequestParam(value = "user",required = false)String username){
        String errorMessage=null;
        if(username!=null){
            Usuario usuario=usuarioDAO.getUsuarioPorUsername(username);
            if(usuario!=null){
                int intentosRestantes=3-usuario.getIntentosLogin();
                errorMessage="Contraseña incorrecta, le quedan "+intentosRestantes+" intentos";
            }else{
                errorMessage="Usuario no encontrado";
            }
        }
        model.addAttribute("errorMessage",errorMessage);
        return "login";
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

            /*List<String> emails=usuarioDAO.getAdminsEmails();
            String subject = "Asunto del correo";
            for(String email:emails){
                String text = "nuevo usuario\n\nhttp://localhost:8080/usuario/editar?id="+usuario.getIdUsuario();
                emailService.sendEmail(email, subject, text);
            }*/

            return "redirect:/usuarioEjemplo/listar";
        }
    }

    @GetMapping("logout")
    public String logout(){
        return "redirect:/usuario/listar";
    }
    @GetMapping("error")
    public String errorUrl() {
        return "error";
    }
}
