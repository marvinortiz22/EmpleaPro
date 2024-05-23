package com.gestion.planillas.Controllers;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.*;
import com.gestion.planillas.modelos.Otros.Alert;
import jakarta.validation.Valid;

import java.math.BigDecimal;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Period;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/empleado")
public class EmpleadoController {
    @Autowired
    private com.gestion.planillas.DAO.usuarioDAO usuarioDAO;
    @Autowired
    private  com.gestion.planillas.DAO.empleadoDAO empleadoDAO;
    @Autowired
    private  com.gestion.planillas.DAO.puestoDAO puestoDAO;
    @Autowired
    private  com.gestion.planillas.DAO.estadoCivilDAO estadoCivilDAO;
    @Autowired
    private  com.gestion.planillas.DAO.tipoDocumentoDAO tipoDocumentoDAO;
    @Autowired
    private  com.gestion.planillas.DAO.departamentoDAO departamentoDAO;
    @Autowired
    private  com.gestion.planillas.DAO.municipioDAO municipioDAO;

    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Administrador")
    public String listar(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<Empleado> empleados = empleadoDAO.getEmpleados();
        model.addAttribute("empleados", empleados);

        return "empleado/empleados-listar";
    }

    @GetMapping("/detalles")
    @AccessControl(roles="ROLE_Administrador")
    public String detalles(Model model, @RequestParam("id") int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Empleado empleado = empleadoDAO.getEmpleado(id);
        model.addAttribute("empleado", empleado);

        List<ProfesionOficio> profesionOficios = empleadoDAO.getProfesionesOficios(id);
        model.addAttribute("profesionesOficios", profesionOficios);

        return "empleado/empleado-detalle";
    }

    @GetMapping("/cambiarEstado")
    public String cambiarEstado(@RequestParam("id")int id, RedirectAttributes redirectAttributes){
        Empleado empleado = empleadoDAO.getEmpleado(id);

        Alert alert;

        if(empleado.isEstado())
            alert=new Alert("danger","Se ha desactivado el empleado "+empleado.getNombre1()+", "+empleado.getApellido1());
        else
            alert=new Alert("success","Se ha activado el empleado "+empleado.getNombre1()+", "+empleado.getApellido1());

        redirectAttributes.addFlashAttribute("alert",alert);

        empleado.setEstado(!empleado.isEstado());
        empleadoDAO.guardarEmpleado(empleado);

        return "redirect:/empleado/listar";
    }

    @GetMapping("/agregar")
    public String agregar(Model model) {
        model.addAttribute("empleado", new Empleado());
        agregarListasModelo(model);
        return "empleado/empleado-agregar";
    }

    @PostMapping("/guardar")
    public String guardar(@Valid @ModelAttribute("empleado") Empleado empleado, BindingResult result, Model model, RedirectAttributes redirectAttributes) {
        //validar fechanac
        validarFechaNacimiento(empleado.getFechaNacimiento(), result);

        // Validaciones de selects
        if (empleado.getSexo().equals("X")) {
            result.rejectValue("sexo", "error.sexo", "Debe seleccionar un sexo válido.");
        }
        if (empleado.getEstadoCivil().getIdEstadoCivil() == 0) {
            result.rejectValue("estadoCivil", "error.empleado", "Debe seleccionar un estado civil válido.");
        }
        if (empleado.getMunicipio().getDepartamento().getIdDepartamento() == 0) {
            result.rejectValue("municipio.departamento", "error.empleado", "Debe seleccionar un departamento válido.");
        }
        if (empleado.getMunicipio().getIdMunicipio() == 0) {
            result.rejectValue("municipio", "error.empleado", "Debe seleccionar un municipio válido.");
        }

        //validar nulls
        if (empleado.getSupervisor().getIdEmpleado() == 0) {
            empleado.setSupervisor(null);
        }
        if (empleado.getNit() == "") {
            empleado.setNit(null);
        }
        if (empleado.getNup() == "") {
            empleado.setNup(null);
        }
        if (empleado.getNup() == "") {
            empleado.setNup(null);
        }

        // Validar sueldo
        BigDecimal salarioEmpleado = empleado.getSalario();
        Puesto puesto = puestoDAO.getPuesto(empleado.getPuesto().getIdPuesto());
        BigDecimal salarioMinimo = puesto.getSalarioMin();
        BigDecimal salarioMaximo = puesto.getSalarioMax();

        if (salarioEmpleado == null) {
            result.rejectValue("salario", "error.empleado", "El salario es obligatorio");
        } else if (salarioMinimo == null || salarioMaximo == null) {
            // Manejar el caso si los salarios mínimos o máximos son null
            result.rejectValue("salario", "error.empleado", "No se puede comparar el salario debido a valores nulos");
        } else {
            if (salarioEmpleado.compareTo(salarioMinimo) < 0) {
                result.rejectValue("salario", "error.empleado", "El salario debe ser mayor o igual a " + salarioMinimo);
            }
            if (salarioEmpleado.compareTo(salarioMaximo) > 0) {
                result.rejectValue("salario", "error.empleado", "El salario debe ser menor o igual a " + salarioMaximo);
            }
        }

        if (result.hasErrors()) {
            // Manejar errores de validación aquí
            agregarListasModelo(model);
            return "empleado/empleado-agregar";
        }

        empleadoDAO.guardarEmpleado(empleado);

        Alert alert=new Alert("success","Se ha añadido el empleado exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);

        return "redirect:/empleado/listar";
    }

    private void validarFechaNacimiento(Date fechaNacimiento, BindingResult result) {
        if (fechaNacimiento == null) {
            result.rejectValue("fechaNacimiento", "error.empleado", "La fecha de nacimiento es obligatoria");
            return;
        }

        LocalDate fechaNacimientoLocal = new java.sql.Date(fechaNacimiento.getTime()).toLocalDate();
        LocalDate hoy = LocalDate.now();
        int edad = Period.between(fechaNacimientoLocal, hoy).getYears();

        if (edad < 16 || edad > 100) {
            result.rejectValue("fechaNacimiento", "error.empleado", "La fecha de nacimiento debe ser valida");
        }
    }

    private void agregarListasModelo(Model model) {

        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        //para los select de las llaves foraneas
        List<Puesto> puestos =puestoDAO.getPuestos();
        model.addAttribute("puestos", puestos);

        List<EstadoCivil> estadosCiviles = estadoCivilDAO.getEstadosCiviles();
        model.addAttribute("estadosCiviles", estadosCiviles);

        List<Departamento> departamentos = departamentoDAO.getDepartamentos();
        model.addAttribute("departamentos", departamentos);

        List<TipoDocumento> tiposDocumentos = tipoDocumentoDAO.getTipoDocumentos();
        model.addAttribute("tiposDocumentos", tiposDocumentos);

        List<Empleado> empleados = empleadoDAO.getEmpleados();
        model.addAttribute("empleados", empleados);
    }
}
