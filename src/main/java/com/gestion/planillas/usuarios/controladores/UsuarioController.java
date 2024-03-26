package com.gestion.planillas.usuarios.controladores;

import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.usuarios.DAO.usuarioDAO;

import java.util.List;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private usuarioDAO usuarioDAO;
    @GetMapping("/listar")
    public String jsp(Model model){
        List<Usuario> puestos= usuarioDAO.getUsuarios();
        model.addAttribute("puestos",puestos);
        return "usuarios-listar";
    }
}
