package com.gestion.planillas.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("/")
@Controller
public class SecurityController {
    @GetMapping("login")
    public String login(){
        return "login";
    }
    @PostMapping("login")
    public String login2(){
        return "redirect:/personas";
    }

    @GetMapping("/logout")
    public String logout(){
        logout();
        return "redirect:/personas";
    }
    @GetMapping("/error")
    public String errorUrl() {
        return "error de acceso";
    }
}
