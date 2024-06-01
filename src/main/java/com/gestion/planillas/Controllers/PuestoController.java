package com.gestion.planillas.Controllers;

import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Puesto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.gestion.planillas.modelos.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/puesto")
public class PuestoController {
    @Autowired
    private com.gestion.planillas.DAO.usuarioDAO usuarioDAO;
    @Autowired
    private  com.gestion.planillas.DAO.puestoDAO puestoDAO;

    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Administrador")
    public String listar(Model model) {
        model.addAttribute("usuarioPermisos", usuarioDAO.getUsuarioActual());

        List<Puesto> puestos = puestoDAO.getPuestos();
        model.addAttribute("puestos", puestos);

        return "puesto/puesto-listar";
    }

    @GetMapping("/detalles")
    @AccessControl(roles="ROLE_Administrador")
    public String detalles(Model model, @RequestParam("id") int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Puesto puesto = puestoDAO.getPuesto(id);
        model.addAttribute("puesto", puesto);

        return "puesto/puesto-detalle";
    }
}
