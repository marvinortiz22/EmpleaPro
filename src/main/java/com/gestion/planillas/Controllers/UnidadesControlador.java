package com.gestion.planillas.Controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.DAO.unidadesDAO;

@Controller
@RequestMapping("/unidad")
public class UnidadesControlador {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private unidadesDAO unidadesDAO;

    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Ver_unidades")
    public String listar(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        String unidades = unidadesDAO.getUnidades();
        model.addAttribute("unidades", unidades);
        boolean permisoEditar = usuarioDAO.tienePermiso("ROLE_Editar_unidades");
        boolean permisoCrear = usuarioDAO.tienePermiso("ROLE_Agregar_unidades");
        boolean cambiarEstado = usuarioDAO.tienePermiso("ROLE_Cambiar_estado_unidades");
        model.addAttribute("permisoEditar", permisoEditar); model.addAttribute("permisoCrear", permisoCrear);
        model.addAttribute("cambiarEstado", cambiarEstado);
        return "unidades/unidades";
    }
}
