package com.gestion.planillas.Controllers;

import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Otros.Alert;
import com.gestion.planillas.modelos.Puesto;
import jakarta.validation.Valid;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.gestion.planillas.modelos.*;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/puesto")
public class PuestoController {
    @Autowired
    private com.gestion.planillas.DAO.usuarioDAO usuarioDAO;
    @Autowired
    private  com.gestion.planillas.DAO.puestoDAO puestoDAO;
    @Autowired
    private  com.gestion.planillas.DAO.unidadesDAO unidadesDAO;

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

    @GetMapping("/agregar")
    public String agregar(Model model) {
        model.addAttribute("puesto", new Puesto());
        agregarListasModelo(model);
        return "puesto/puesto-agregar";
    }

    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id") int id) {
        Puesto puesto = puestoDAO.getPuesto(id);
        model.addAttribute("puesto", puesto);
        agregarListasModelo(model);
        return "puesto/puesto-agregar";
    }

    private void agregarListasModelo(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        //para los select de las llaves foraneas
        List<Unidad> unidades = unidadesDAO.getUnidades();
        model.addAttribute("unidades", unidades);
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute("puesto") Puesto puesto, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
        // Validar rango salarial
        BigDecimal salarioMin = puesto.getSalarioMin();
        BigDecimal salarioMax = puesto.getSalarioMax();

        if (salarioMin != null && salarioMax != null) {
            if (salarioMin.compareTo(salarioMax) > 0) {
                result.rejectValue("salarioMin", "error.puesto", "El salario mínimo no puede ser mayor.");
            }
        }

        //validar nulls
        if (puesto.getUnidad().getIdUnidad() == 0) {
            puesto.setUnidad(null);
        }

        //validar campos unicos (nombre)
        if (puesto.getIdPuesto() == null){
            if(!puestoDAO.esUnico("nombrePuesto", puesto.getNombrePuesto()))
                result.rejectValue("nombrePuesto","error.nombrePuesto","Ya existe un puesto con este nombre");
        } else {
            if(!puestoDAO.esUnico("nombrePuesto", puesto.getNombrePuesto(), puesto.getIdPuesto()))
                result.rejectValue("nombrePuesto","error.nombrePuesto","Ya existe un puesto con este nombre");
        }

        //mostrar errores
        if (result.hasErrors()) {
            // Manejar errores de validación aquí
            agregarListasModelo(model);
            return "puesto/puesto-agregar";
        }

        //mostrar mensaje
        if (puesto.getIdPuesto() != null) {
            Alert alert=new Alert("success","Se ha actualizado el puesto exitosamente");
            redirectAttributes.addFlashAttribute("alert",alert);
        } else {
            Alert alert=new Alert("success","Se ha añadido el puesto exitosamente");
            redirectAttributes.addFlashAttribute("alert",alert);
        }

        puestoDAO.guardarPuesto(puesto);

        return "redirect:/puesto/listar";
    }
}
