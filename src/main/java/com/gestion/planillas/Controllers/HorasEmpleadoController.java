package com.gestion.planillas.Controllers;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.horasEmpleadoDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.HorasEmpleado;
import com.gestion.planillas.modelos.Otros.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/horasEmpleado")
public class HorasEmpleadoController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private horasEmpleadoDAO horasEmpleadoDAO;
    @Autowired empleadoDAO empleadoDAO;
    @GetMapping("/listar")
    @AccessControl(roles = "ROLE_Ver_horas_trabajadas")
    public String listar(Model model,@RequestParam(name = "all",required = false)boolean all){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<HorasEmpleado> horasEmpleadoList;
        if(all)
            horasEmpleadoList=horasEmpleadoDAO.getHorasEmpleadoList();
        else
            horasEmpleadoList=horasEmpleadoDAO.getHorasEmpleadoHoy();
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        model.addAttribute("horasEmpleadolist",horasEmpleadoList);
        return "horasEmpleado/listar";
    }
    @GetMapping("/editar")
    @AccessControl(roles = "ROLE_Editar_horas_trabajadas")
    public String editar(Model model,@RequestParam(name="id",required = false)Integer id,@RequestParam(name="empleado",required = false)Integer idEmpleado){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        HorasEmpleado horasEmpleado;
        if(id==null){
            horasEmpleado=new HorasEmpleado();
            horasEmpleado.setEmpleado(empleadoDAO.getEmpleado(idEmpleado));
        }
        else
            horasEmpleado=horasEmpleadoDAO.getHorasEmpleado(id);
        model.addAttribute("horasEmpleado",horasEmpleado);
        return "horasEmpleado/editar";
    }
    @PostMapping("/editar")
    public String editar(@ModelAttribute("horasEmpleado")HorasEmpleado horasEmpleado, RedirectAttributes redirectAttributes){
        horasEmpleadoDAO.guardar(horasEmpleado);
        Alert alert=new Alert("success","Se ha editado el registro exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/horasEmpleado/listar";
    }
    @GetMapping("/agregar")
    @AccessControl(roles = "ROLE_Editar_horas_trabajadas")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        HorasEmpleado horasEmpleado=new HorasEmpleado();
        model.addAttribute("horasEmpleado",horasEmpleado);
        return "horasEmpleado/agregar";
    }
    @PostMapping("/agregar")
    public String agregar(@RequestParam("horasEmpleado")HorasEmpleado horasEmpleado, RedirectAttributes redirectAttributes){
        horasEmpleadoDAO.guardar(horasEmpleado);
        Alert alert=new Alert("success","Se ha añadido el registro exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/horasEmpleado/listar";
    }
}
