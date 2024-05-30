package com.gestion.planillas.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.DAO.deduccionBeneficio;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;
import com.gestion.planillas.modelos.Empleado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    private deduccionBeneficio deduccionBeneficio;
    @GetMapping("/listarEmpleados")
    public String listarEmpleados(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Empleado> empleados = empleadoDAO.getEmpleados();
        model.addAttribute("empleados", empleados);
        return "contaduria/empleados-listar";
    }
    @GetMapping("/boleta")   
    public String boleta(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<DeduccionBeneficioGlobal> deduccionBeneficioGlobals=deduccionBeneficio.getDeduccionesGlobales();
        List<DeduccionBeneficio_Empleado> deduccionBeneficioEmpleados=deduccionBeneficio.getDeduccionBeneficioEmp(id);
        Empleado empleado=empleadoDAO.getEmpleado(id);
        model.addAttribute("empleado",empleado);
        model.addAttribute("deduccionesGlobales",deduccionBeneficioGlobals);
        model.addAttribute("deduccionEmpleado",deduccionBeneficioEmpleados);
        Object[] boleta= contaduriaDAO.planillaEmpleado("2024-05-21","2024-05-23",id);
        model.addAttribute("boleta",boleta);

        List<Map<String, Object>> resultados = new ArrayList<>();

        Map<String, Object> resultado = new HashMap<>();
        resultado.put("Número de documento", boleta[0]);
        resultado.put("Nombre", boleta[1]);
        resultado.put("Cargo", boleta[2]);
        resultado.put("Salario/hora", "$" + boleta[3]);
        resultado.put("Horas normales", boleta[4]);
        resultado.put("Salario*horas normales", "$" + boleta[5]);
        resultado.put("Vacaciones", "$" + boleta[6]);
        resultado.put("Horas extra", "$" + boleta[7]);
        resultado.put("Permisos remunerables", String.format("$%.2f",Double.parseDouble(boleta[8].toString())));
        // Procesar deducciones globales y beneficios del empleado aquí
        List<Map<String, String>> deduccionesBeneficios = new ArrayList<>();

        for (DeduccionBeneficioGlobal deduccionGlobal : deduccionBeneficioGlobals) {
            if (deduccionGlobal.getDeduccionBeneficio().getTipo().equals("B")) {
                Map<String, String> detalle = new HashMap<>();

                if (deduccionGlobal.isProporcionalAlSueldo()) {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef()+" ("+deduccionGlobal.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", String.format("$%.2f", (deduccionGlobal.getMontoOPorcentaje().divide(new BigDecimal(100))).multiply(new BigDecimal(boleta[5].toString()))));
                } else {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", String.format("$%.2f", deduccionGlobal.getMontoOPorcentaje()));
                }
                deduccionesBeneficios.add(detalle);
            }
        }

        for (DeduccionBeneficio_Empleado beneficioEmpleado : deduccionBeneficioEmpleados) {
            if (beneficioEmpleado.getDeduccionBeneficio().getTipo().equals("B")) {
                Map<String, String> detalle = new HashMap<>();

                if (beneficioEmpleado.isProporcionalAlSueldo()) {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef()+" ("+beneficioEmpleado.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", String.format("$%.2f", (beneficioEmpleado.getMontoOPorcentaje().divide(new BigDecimal(100))).multiply(new BigDecimal(boleta[5].toString()))));
                } else {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", String.format("$%.2f", beneficioEmpleado.getMontoOPorcentaje()));
                }
                deduccionesBeneficios.add(detalle);
            }
        }

        resultado.put("Beneficios", deduccionesBeneficios);
        resultado.put("Salario+beneficios", String.format("$%.2f",Double.parseDouble(boleta[10].toString())));
        resultado.put("ISSS", "$" + boleta[11]);
        resultado.put("AFP", "$" + boleta[12]);
        resultado.put("ISR", "$" + boleta[13]);
        // Procesar deducciones del empleado aquí
        List<Map<String, String>> deduccionesEmpleado = new ArrayList<>();

        for (DeduccionBeneficioGlobal deduccionGlobal : deduccionBeneficioGlobals) {
            if (deduccionGlobal.getDeduccionBeneficio().getTipo().equals("D")) {
                Map<String, String> detalle = new HashMap<>();


                if (deduccionGlobal.isProporcionalAlSueldo()) {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef()+" ("+deduccionGlobal.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", String.format("$%.2f", (deduccionGlobal.getMontoOPorcentaje().divide(new BigDecimal(100))).multiply(new BigDecimal(boleta[10].toString()))));
                } else {
                    detalle.put("nombre", deduccionGlobal.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", String.format("$%.2f", deduccionGlobal.getMontoOPorcentaje()));
                }
                deduccionesEmpleado.add(detalle);
            }
        }

        for (DeduccionBeneficio_Empleado beneficioEmpleado : deduccionBeneficioEmpleados) {
            if (beneficioEmpleado.getDeduccionBeneficio().getTipo().equals("D")) {
                Map<String, String> detalle = new HashMap<>();
                if (beneficioEmpleado.isProporcionalAlSueldo()) {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef()+" ("+beneficioEmpleado.getMontoOPorcentaje()+"%)");
                    detalle.put("monto", String.format("$%.2f", (beneficioEmpleado.getMontoOPorcentaje().divide(new BigDecimal(100))).multiply(new BigDecimal(boleta[10].toString()))));
                } else {
                    detalle.put("nombre", beneficioEmpleado.getDeduccionBeneficio().getNombreDeducBenef());
                    detalle.put("monto", String.format("$%.2f", beneficioEmpleado.getMontoOPorcentaje()));
                }
                deduccionesEmpleado.add(detalle);
            }
        }

        resultado.put("Deducciones", deduccionesEmpleado);
        resultado.put("Total deducciones", "$" + boleta[15]);
        resultado.put("Salario neto", String.format("$%.2f",Double.parseDouble(boleta[16].toString())));

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
