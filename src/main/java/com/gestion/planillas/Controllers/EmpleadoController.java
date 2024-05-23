package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.*;
import com.gestion.planillas.modelos.Otros.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        model.addAttribute("empleado", new Empleado());

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

        return "empleado/empleado-agregar";
    }

    @PostMapping("/guardar")
    public String guardar(@ModelAttribute("empleado") Empleado empleado, RedirectAttributes redirectAttributes) {
        empleadoDAO.guardarEmpleado(empleado);

        Alert alert=new Alert("success","Se ha añadido el empleado exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);

        return "redirect:/empleado/listar";
    }

}
