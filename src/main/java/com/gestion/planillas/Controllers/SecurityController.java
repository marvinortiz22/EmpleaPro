package com.gestion.planillas.Controllers;

import jakarta.servlet.http.HttpServletRequest;
import org.apache.catalina.Authenticator;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@RequestMapping("/")
@Controller
public class SecurityController {

    @GetMapping("login")
    public String login(){
        return "login";
    }
    @PostMapping("login")
    public String login2(){
        return "redirect:/usuario/listar";
    }

    @GetMapping("/logout")
    public String logout(){
        logout();
        return "redirect:/personas";
    }
    @GetMapping("/error")
    @ResponseBody
    public String errorUrl() {
        return "error de acceso";
    }
}
