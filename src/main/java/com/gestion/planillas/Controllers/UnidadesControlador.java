package com.gestion.planillas.Controllers;

import java.text.NumberFormat;
import java.util.*;

import com.gestion.planillas.modelos.DatosEmpresa;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Otros.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.DAO.datosEmpresaDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.PresupuestoAnual;
import com.gestion.planillas.modelos.Unidad;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.presupuestoDAO;
import com.gestion.planillas.DAO.tipounidadesDAO;
import com.gestion.planillas.DAO.unidadesDAO;

@Controller
@RequestMapping("/unidad")
public class UnidadesControlador {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private unidadesDAO unidadesDAO;
    @Autowired
    private tipounidadesDAO tipounidadesDAO;
    @Autowired
    private empleadoDAO empleadoDAO;
    @Autowired
    private contaduriaDAO contaduriaDAO;
    @Autowired
    private presupuestoDAO presupuesto;
    @Autowired
    private datosEmpresaDAO datosEmpresaDAO;

    @GetMapping("/listar")
    @AccessControl(roles="ROLE_Ver_unidades")
    public String listar(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Unidad> unidades = unidadesDAO.getUnidades();
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (Unidad unidad : unidades) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("id", unidad.getIdUnidad());
            resultado.put("Tipo Unidad", unidad.getTipoUnidad().getNombreTipoUnidad());
            resultado.put("Unidad Padre", (unidad.getUnidadPadre() == null) ? "N/A" : unidad.getUnidadPadre().getNombreUnidad());
            resultado.put("Nombre", unidad.getNombreUnidad());
            List<PresupuestoAnual> presupuestosUnidad = presupuesto.getPresupuestosUnidad(unidad.getIdUnidad());
            resultado.put("Presupuesto", presupuestosUnidad.size() == 0 ? "No hay presupuestos" : presupuestosUnidad.getFirst().getMonto()); 
            resultado.put("Estado", (unidad.isEstado()) ? "Activo" : "Inactivo");
            resultados.add(resultado);
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = "";
        try {
            jsonString = mapper.writeValueAsString(resultados);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("unidades", jsonString);
        boolean permisoEditar = usuarioDAO.tienePermiso("ROLE_Editar_unidades");
        boolean permisoCrear = usuarioDAO.tienePermiso("ROLE_Agregar_unidades");
        boolean cambiarEstado = usuarioDAO.tienePermiso("ROLE_Cambiar_estado_unidades");
        boolean verPresupuestos = usuarioDAO.tienePermiso("ROLE_Ver_presupuesto_de_unidades");
        model.addAttribute("permisoEditar", permisoEditar); model.addAttribute("permisoCrear", permisoCrear);
        model.addAttribute("cambiarEstado", cambiarEstado); model.addAttribute("verPresupuestos", verPresupuestos);
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        return "unidades/unidades";
    }

    @GetMapping("/agregar")
    @AccessControl(roles="ROLE_Agregar_unidades")
    public String agregar(Model model) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        model.addAttribute("unidades", unidadesDAO.getUnidadesList());
        model.addAttribute("tiposUnidades", tipounidadesDAO.getTiposUnidadesList());
        Unidad unidad = new Unidad();
        model.addAttribute("unidad", unidad); model.addAttribute("editar", false);
        return "unidades/info";
    }

    @GetMapping("/editar")
    @AccessControl(roles="ROLE_Editar_unidades")
    public String editar(Model model, @RequestParam("id")int id) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Unidad unidad = unidadesDAO.getUnidad(id);
        model.addAttribute("unidades", unidadesDAO.getUnidadesList());
        model.addAttribute("tiposUnidades", tipounidadesDAO.getTiposUnidadesList());
        model.addAttribute("unidad", unidad); model.addAttribute("editar", true);
        return "unidades/info";
    }


    @PostMapping("/agregar")
    public String agregarUnidad(@ModelAttribute("unidad") Unidad unidad, RedirectAttributes redirectAttributes) {
        unidadesDAO.agregarEditarUnidad(unidad);
        Alert alert=new Alert("success","Se ha agregado la unidad exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/unidad/listar";
    }

    @PostMapping("/editar")
    public String editarUnidad(@ModelAttribute("unidad") Unidad unidad, RedirectAttributes redirectAttributes) {
        unidadesDAO.agregarEditarUnidad(unidad);
        Alert alert=new Alert("success","Se ha editado la unidad exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/unidad/listar";
    }

    @GetMapping("/presupuestos")
    @AccessControl(roles="ROLE_Ver_presupuesto_de_unidades")
    public String presupuestos(Model model, @RequestParam("id") int id) {
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Unidad unidad = unidadesDAO.getUnidad(id);
        model.addAttribute("unidad", unidad);
        DatosEmpresa datosEmpresa=datosEmpresaDAO.getDatosEmpresa();
        model.addAttribute("nombreEmpresa",datosEmpresa.getNombreEmpresa());
        List<PresupuestoAnual> presupuestos = presupuesto.getPresupuestosUnidad(id);
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (PresupuestoAnual presupuesto : presupuestos) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("id", presupuesto.getIdPresupuesto());
            resultado.put("Año", presupuesto.getAno());
            resultado.put("Monto", presupuesto.getMonto());
            List<Empleado> empleados=empleadoDAO.getEmpleadosUnidad(id, presupuesto.getAno());
            Double sumaSalarios=0.00;
            for(Empleado empleado:empleados){
                Double salarioNeto=(Double) contaduriaDAO.planillaEmpleado(empleado.getFechaIngreso().toString(),presupuesto.getAno()+"-12-31",empleado.getIdEmpleado())[16];
                sumaSalarios+=salarioNeto;
            }
            sumaSalarios=Double.parseDouble(presupuesto.getMonto().toString())-sumaSalarios;
            NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
            resultado.put("Monto-Salarios",currencyFormatter.format(sumaSalarios));
            resultados.add(resultado);
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = "";
        try {
            jsonString = mapper.writeValueAsString(resultados);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("presupuestos", jsonString); model.addAttribute("idUnidad", id);
        boolean permisoEditar = usuarioDAO.tienePermiso("ROLE_Editar_presupuesto_de_unidades");
        model.addAttribute("permisoEditar", permisoEditar);
        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }
        return "unidades/presupuestos";
    }

    @GetMapping("/presupuestos/agregar")
    @AccessControl(roles="ROLE_Agregar_presupuesto_de_unidades")
    public String agregarP(Model model, @RequestParam("idUnidad") int idUnidad){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Unidad unidad = unidadesDAO.getUnidad(idUnidad);
        PresupuestoAnual presupuesto = new PresupuestoAnual();
        presupuesto.setUnidad(unidad);
        model.addAttribute("presupuesto", presupuesto);
        model.addAttribute("editar", false);
        return "unidades/infoPresupuesto";
    }

    @GetMapping("/presupuestos/editar")
    @AccessControl(roles="ROLE_Editar_presupuesto_de_unidades")
    public String editarP(Model model, @RequestParam("id") int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        PresupuestoAnual presupuest = presupuesto.getPresupuesto(id);
        model.addAttribute("presupuesto", presupuest); model.addAttribute("editar", true);
        return "unidades/infoPresupuesto";
    }

    @PostMapping("/presupuestos/agregar")
    public String agregarPresupuesto(@ModelAttribute("presupuesto") PresupuestoAnual presupuest, RedirectAttributes redirectAttributes) {
        presupuesto.agregarEditarPresupuesto(presupuest);
        Alert alert=new Alert("success","Se ha agregado el presupuesto exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/unidad/presupuestos?id=" + presupuest.getUnidad().getIdUnidad();
    }

    @PostMapping("/presupuestos/editar")
    public String editarPresupuesto(@ModelAttribute("presupuesto") PresupuestoAnual presupuest, RedirectAttributes redirectAttributes) {
        presupuesto.agregarEditarPresupuesto(presupuest);
        Alert alert=new Alert("success","Se ha editado el presupuesto exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        return "redirect:/unidad/presupuestos?id=" + presupuest.getUnidad().getIdUnidad();
    }
}
