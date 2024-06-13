package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.Otros.EmailService;
import com.gestion.planillas.modelos.Usuario;
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
        return "redirect:/home";
    }

    @GetMapping("login")
    public String login(Model model,@RequestParam(value = "user",required = false)String username){
        String errorMessage=null;
        if(username!=null){
            Usuario usuario=usuarioDAO.getUsuarioPorUsername(username);
            if(usuario!=null){
                if(!usuario.isEstado())
                    return "redirect:/error/estado?user="+usuario.getUsername();
                int intentosRestantes=3-usuario.getIntentosLogin();
                if(intentosRestantes==1)
                    errorMessage="Contraseña incorrecta, le queda 1 intento";
                else
                    errorMessage="Contraseña incorrecta, le quedan "+intentosRestantes+" intentos";
            }else{
                errorMessage="Usuario no encontrado";
            }
        }
        model.addAttribute("errorMessage",errorMessage);
        return "login/login";
    }
    @GetMapping("registro")
    public String registro(Model model){
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);
        return "login/registro";
    }
    @PostMapping("registro")
    public String registroPost(@Valid @ModelAttribute("usuario")Usuario usuario, BindingResult result){
        if(usuarioDAO.getUsuarioPorCampo("username",usuario.getUsername())!=null)
            result.rejectValue("username","error.username","Ya existe un usuario con este nombre de usuario");
        if(usuarioDAO.getUsuarioPorCampo("email",usuario.getEmail())!=null)
            result.rejectValue("email","error.email","Ya existe un usuario con este correo electrónico");
        if(!usuario.getPassword().equals(usuario.getPassword2()))
            result.rejectValue("password2","password2.error","Las contraseñas no coinciden");
        if (result.hasErrors())
            return "login/registro";
        else{
            usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
            usuarioDAO.guardarUsuario(usuario);

            /*List<String> emails=usuarioDAO.getAdminsEmails();
            String subject = "Nuevo usuario";
            for(String email:emails){
                try{
                    String text = "nuevo usuario\n\nhttp://localhost:8080/usuario/editar?id="+usuario.getIdUsuario();
                    emailService.sendEmail(email, subject, text);
                }catch (Exception e){

                }
            }*/

            return "redirect:/login";
        }
    }

    /*@GetMapping("logout")
    public String logout(){
        return "redirect:/usuario/listar";
    }
    /*@GetMapping("error")
    public String errorUrl() {
        return "error";
    }*/
    @GetMapping("error/permisos")
    public String errorPermisos() {
        return "error/errorPermisos";
    }
    @GetMapping("error/estado")
    public String errorEstado(@RequestParam(value="user",required = false)String username,Model model) {
        Usuario usuario=usuarioDAO.getUsuarioPorUsername(username);
        model.addAttribute("usuario",usuario);
        return "error/errorEstado";
    }
    @GetMapping("error/rol")
    public String errorRol() {
        return "error/errorRol";
    }
    @GetMapping("solicitarDesbloqueo")
    public String solicitarDesbloqueo(@RequestParam(value="id",required = false) int id){
        Usuario usuario=usuarioDAO.getUsuario(id);
        usuario.setSolicitoDesbloqueo(true);
        usuarioDAO.guardarUsuario(usuario);

        /*List<String> emails=usuarioDAO.getAdminsEmails();
            String subject = "Solicitud de desbloqueo";
            for(String email:emails){
                try{
                    String text = "El usuario '"+usuario.getUsername()+"' ha realizado una solicitud de desbloqueo, si desea desbloquearlo haga click en el siguiente enlace:\n\nhttp://localhost:8080/usuario/cambiarEstado?id="+usuario.getIdUsuario();
                    emailService.sendEmail(email, subject, text);
                }catch (Exception e){

                }
            }*/

        return "error/errorEstado";
    }
}
