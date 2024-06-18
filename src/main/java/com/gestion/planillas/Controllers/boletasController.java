package com.gestion.planillas.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.DAO.deduccionBeneficioDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.datosEmpresaDAO;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.DatosEmpresa;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;
import com.gestion.planillas.modelos.Empleado;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@RequestMapping("/contabilidad")
@Controller
public class boletasController {
    @Autowired
    private contaduriaDAO contaduriaDAO;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private empleadoDAO empleadoDAO;
    @Autowired
    private deduccionBeneficioDAO deduccionBeneficio;
    @Autowired
    private datosEmpresaDAO datosEmpresaDAO;
    @GetMapping("/listarEmpleados")
    @AccessControl(roles = "ROLE_Ver_boletas_de_pago")
    public String listarEmpleados(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Empleado> empleados = empleadoDAO.getEmpleados();
        model.addAttribute("empleados", empleados);
        return "contaduria/empleados-listar";
    }
    @PostMapping("/boleta")
    @AccessControl(roles = "ROLE_Ver_boletas_de_pago")
    public String boleta(Model model, @RequestParam("id")int id, HttpServletRequest request){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<DeduccionBeneficioGlobal> deduccionBeneficioGlobals=deduccionBeneficio.getDeduccionesGlobales();
        List<DeduccionBeneficio_Empleado> deduccionBeneficioEmpleados=deduccionBeneficio.getDeduccionesBeneficiosEmp(id);
        Empleado empleado=empleadoDAO.getEmpleado(id);
        model.addAttribute("empleado",empleado);
        model.addAttribute("deduccionesGlobales",deduccionBeneficioGlobals);
        model.addAttribute("deduccionEmpleado",deduccionBeneficioEmpleados);
        Object[] boleta;
        String fecha1="",fecha2="";
        fecha1=request.getParameter("fecha1");
        fecha2=request.getParameter("fecha2");
        boleta= contaduriaDAO.planillaEmpleado(fecha1,fecha2,id);

        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate fecha1Local = LocalDate.parse(fecha1, inputFormatter);
        LocalDate fecha2Local = LocalDate.parse(fecha2, inputFormatter);
        String fecha1Salida = fecha1Local.format(outputFormatter);
        String fecha2Salida=fecha2Local.format(outputFormatter);


        model.addAttribute("boleta",boleta);
        model.addAttribute("fecha1",fecha1Salida);
        model.addAttribute("fecha2",fecha2Salida);

        DatosEmpresa datosEmpresa=datosEmpresaDAO.getDatosEmpresa();
        String nombreEmpresa="";
        if(datosEmpresa!=null)
            nombreEmpresa=datosEmpresa.getNombreEmpresa();
        List<Map<String, Object>> resultados = new ArrayList<>();

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");

        Map<String, Object> resultado = new HashMap<>();
        resultado.put("Empresa",nombreEmpresa);
        resultado.put("fecha1",fecha1.formatted(formatter));
        resultado.put("fecha2",fecha2.formatted(formatter));
        resultado.put("Número de documento", boleta[0]);
        resultado.put("Nombre", boleta[1]);
        resultado.put("Cargo", boleta[2]);
        resultado.put("Salario/hora", currencyFormatter.format(boleta[3]));
        resultado.put("Horas normales", currencyFormatter.format(boleta[4]));
        resultado.put("Salario*horas normales", currencyFormatter.format(boleta[5]));
        resultado.put("Vacaciones", currencyFormatter.format(boleta[6]));
        resultado.put("Horas extra", currencyFormatter.format(boleta[7]));
        resultado.put("Permisos remunerables", currencyFormatter.format(boleta[8]));
        // Procesar deducciones globales y beneficios del empleado aquí
        List<Map<String, String>> deduccionesBeneficios = new ArrayList<>();

        for (DeduccionBeneficioGlobal deduccionGlobal : deduccionBeneficioGlobals) {
            if (deduccionGlobal.getDeduccionBeneficio().getTipo().equals("B")) {
                Map<String, String> detalle = new HashMap<>();

                if (deduccionGlobal.isProporcionalAlSueldo()) {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef()+" ("+deduccionGlobal.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", currencyFormatter.format(deduccionGlobal.getMontoOPorcentaje().divide(new BigDecimal(100)).multiply(new BigDecimal(boleta[5].toString()))));
                } else {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", currencyFormatter.format(deduccionGlobal.getMontoOPorcentaje()));
                }
                deduccionesBeneficios.add(detalle);
            }
        }

        for (DeduccionBeneficio_Empleado beneficioEmpleado : deduccionBeneficioEmpleados) {
            if (beneficioEmpleado.getDeduccionBeneficio().getTipo().equals("B")) {
                Map<String, String> detalle = new HashMap<>();

                if (beneficioEmpleado.isProporcionalAlSueldo()) {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef()+" ("+beneficioEmpleado.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", currencyFormatter.format(beneficioEmpleado.getMontoOPorcentaje().divide(new BigDecimal(100)).multiply(new BigDecimal(boleta[5].toString()))));
                } else {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", currencyFormatter.format(beneficioEmpleado.getMontoOPorcentaje()));
                }
                deduccionesBeneficios.add(detalle);
            }
        }

        resultado.put("Beneficios", deduccionesBeneficios);
        resultado.put("Salario+beneficios", currencyFormatter.format(boleta[10]));
        resultado.put("ISSS", currencyFormatter.format(boleta[11]));
        resultado.put("AFP", currencyFormatter.format(boleta[12]));
        resultado.put("ISR", currencyFormatter.format(boleta[13]));
        // Procesar deducciones del empleado aquí
        List<Map<String, String>> deduccionesEmpleado = new ArrayList<>();

        for (DeduccionBeneficioGlobal deduccionGlobal : deduccionBeneficioGlobals) {
            if (deduccionGlobal.getDeduccionBeneficio().getTipo().equals("D")) {
                Map<String, String> detalle = new HashMap<>();

                if (deduccionGlobal.isProporcionalAlSueldo()) {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef()+" ("+deduccionGlobal.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", currencyFormatter.format(deduccionGlobal.getMontoOPorcentaje().divide(new BigDecimal(100)).multiply(new BigDecimal(boleta[10].toString()))));
                } else {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", currencyFormatter.format(deduccionGlobal.getMontoOPorcentaje()));
                }
                deduccionesEmpleado.add(detalle);
            }
        }

        for (DeduccionBeneficio_Empleado beneficioEmpleado : deduccionBeneficioEmpleados) {
            if (beneficioEmpleado.getDeduccionBeneficio().getTipo().equals("D")) {
                Map<String, String> detalle = new HashMap<>();
                if (beneficioEmpleado.isProporcionalAlSueldo()) {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef()+" ("+beneficioEmpleado.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", currencyFormatter.format(beneficioEmpleado.getMontoOPorcentaje().divide(new BigDecimal(100)).multiply(new BigDecimal(boleta[10].toString()))));
                } else {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", currencyFormatter.format(beneficioEmpleado.getMontoOPorcentaje()));
                }
                deduccionesEmpleado.add(detalle);
            }
        }

        resultado.put("Deducciones", deduccionesEmpleado);
        resultado.put("Total deducciones", currencyFormatter.format(boleta[15]));
        resultado.put("Salario neto", currencyFormatter.format(boleta[16]));

        resultados.add(resultado);


        // Convertir la lista de resultados a JSON
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = "";
        try {
            jsonString = mapper.writeValueAsString(resultados);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("json",jsonString);

        return "contaduria/boleta";
    }
}
