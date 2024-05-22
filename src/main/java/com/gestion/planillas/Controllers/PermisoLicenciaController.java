package com.gestion.planillas.Controllers;

import com.gestion.planillas.modelos.Perlic_Empleado;
import com.gestion.planillas.modelos.PermisoLicencia;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/permisos")
public class PermisoLicenciaController {
    @GetMapping("/agregar")
    public String agregar(Model model){
        Perlic_Empleado permisoLicencia=new Perlic_Empleado();
        model.addAttribute("permiso",permisoLicencia);
        return "permisoLicencia/permisoLicencia-agregar";
    }
}
