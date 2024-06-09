package com.gestion.planillas.Controllers;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.vacacionesDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Otros.Alert;
import com.gestion.planillas.modelos.Vacacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@RequestMapping("/vacaciones")
@Controller
public class VacacionesController {
    @Autowired
    private vacacionesDAO vacacionesDAO;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private empleadoDAO empleadoDAO;

    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Ver_vacaciones")
    public String listar(Model model,@RequestParam(name = "all",required = false)boolean all){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Vacacion> vacacionList;
        if(all)
            vacacionList=vacacionesDAO.getVacaciones();
        else
            vacacionList=vacacionesDAO.getVacacionesAñoActual();
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        model.addAttribute("vacacionesList",vacacionList);
        return "vacaciones/listar";
    }
    @GetMapping("/editar")
    @AccessControl(roles="ROLE_Editar_vacaciones")
    public String editar(Model model,@RequestParam(name="id",required = false)Integer id,@RequestParam(name="empleado",required = false)Integer idEmpleado){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Vacacion vacacion;
        if(id==null){
            vacacion=new Vacacion();
            vacacion.setEmpleado(empleadoDAO.getEmpleado(idEmpleado));
        }
        else
            vacacion=vacacionesDAO.getVacacion(id);
        model.addAttribute("vacacion",vacacion);
        return "vacaciones/editar";
    }
    @PostMapping("/editar")
    public String editar(@ModelAttribute("vacacion") Vacacion vacacion, RedirectAttributes redirectAttributes){
        vacacionesDAO.guardar(vacacion);
        Alert alert=new Alert("success","Se ha editado el registro exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/vacaciones/listar";
    }
}
