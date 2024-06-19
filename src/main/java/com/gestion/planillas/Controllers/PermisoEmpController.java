package com.gestion.planillas.Controllers;


import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.modelos.Empleado;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.ConstraintViolationException;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.relational.core.sql.In;
import org.springframework.ui.Model;
import com.gestion.planillas.Otros.AccessControl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.modelos.Perlic_Empleado;
import com.gestion.planillas.DAO.perimsoEmpDAO;
import com.gestion.planillas.modelos.PermisoLicencia;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/permiso")
public class PermisoEmpController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private perimsoEmpDAO permisoEmp;
    @Autowired
    private empleadoDAO empDAO;
    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Ver_permisos_y_licencias")
    public String listarPermisos(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Perlic_Empleado> permisosEmp = permisoEmp.getPermisosEmp();
        model.addAttribute("permisos",permisosEmp);
        return "permisos/listar";
    }
    @GetMapping("/agregar")
    @AccessControl(roles="ROLE_Agregar_permisos_y_licencias")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Perlic_Empleado permiso = new Perlic_Empleado();
        List<Empleado> empleados = empDAO.getEmpleadosActivados();
        List<PermisoLicencia> listaCausas = permisoEmp.getPermLic();
        model.addAttribute("permiso", permiso);
        model.addAttribute("empleados", empleados);
        model.addAttribute("causas",listaCausas);
        return "permisos/agregar";
    }
    @PostMapping("/agregar")
    public String agregarPerm(
            @RequestParam("fechaInicio") String fechaInicioStr,
            @RequestParam("fechaFin") String fechaFinStr,
            @ModelAttribute("permiso") Perlic_Empleado perm,
            BindingResult result,
            Model model) {

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date fechaInicio = dateFormat.parse(fechaInicioStr);
            Date fechaFin = dateFormat.parse(fechaFinStr);
            perm.setFechaInicio(fechaInicio);
            perm.setFechaFin(fechaFin);
            permisoEmp.savePermEmp(perm);
        }catch (Exception e) {
            //para ver el mensaje original devuelto por mysql del trigger model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("errorMessage", "La fecha de inicio debe ser menor que la fecha de fin");
            return agregar(model);
        }
        return "redirect:/permiso/listar";
    }

    @GetMapping("/editar")
    @AccessControl(roles="ROLE_Editar_permisos_y_licencias")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos", usuarioDAO.getUsuarioActual());
        Perlic_Empleado permisoEmpl = permisoEmp.getPermisoEmp(id);
        List<Empleado> empleados = empDAO.getEmpleadosActivados();
        List<PermisoLicencia> listaCausas = permisoEmp.getPermLic();
        model.addAttribute("permiso", permisoEmpl);
        model.addAttribute("causas", listaCausas);
        return "permisos/editar";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
    @AccessControl(roles="ROLE_Editar_permisos_y_licencias")
    @PostMapping("/editar")
    public String editarPost(@ModelAttribute("permiso") Perlic_Empleado permiso,
                             HttpServletRequest request,
                             Model model,
                             @RequestParam("fechaInicio") String fechaInicioStr,
                             @RequestParam("fechaFin") String fechaFinStr) throws ParseException {
        Perlic_Empleado permSave = permisoEmp.getPermisoEmp(Integer.parseInt(request.getParameter("idPerLic_Emp")));
        permSave.setDireccionArchivo(null);
        permSave.setAprobada(permiso.isAprobada());
        permSave.setDescontable(permiso.isDescontable());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaInicio = dateFormat.parse(fechaInicioStr);
        Date fechaFin = dateFormat.parse(fechaFinStr);
        permSave.setFechaInicio(fechaInicio);
        permSave.setFechaFin(fechaFin);
        permSave.setPermisoLicencia(permiso.getPermisoLicencia());
        try {
            permisoEmp.savePermEmp(permSave);

        }catch (Exception e){
            model.addAttribute("errorMessage", "La fecha de inicio debe ser menor que la fecha de fin");
            model.addAttribute("usuarioPermisos", usuarioDAO.getUsuarioActual());
            List<PermisoLicencia> listaCausas = permisoEmp.getPermLic();
            model.addAttribute("causas", listaCausas);
            model.addAttribute("permiso", permSave);
            return editar(model, permiso.getIdPerLic_Emp());
        }
        return "redirect:/permiso/listar";
    }
}
