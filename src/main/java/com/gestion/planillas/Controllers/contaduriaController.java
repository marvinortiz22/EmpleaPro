package com.gestion.planillas.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.DatosEmpresa;
import com.gestion.planillas.modelos.PresupuestoAnual;
import com.gestion.planillas.modelos.Unidad;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.DAO.datosEmpresaDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.NumberFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequestMapping("/contabilidad")
public class contaduriaController {
    @Autowired
    private contaduriaDAO contaduriaDAO;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private datosEmpresaDAO datosEmpresaDAO;
    @GetMapping("/planilla")
    @AccessControl(roles = "ROLE_Ver_planilla")
    public String planilla(Model model, HttpServletRequest request){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        String jsonString = "";
        model.addAttribute("unidades", jsonString);
        return "contaduria/planilla";
    }
    @PostMapping("/planilla")
    public String planillaPost(Model model,HttpServletRequest request){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DatosEmpresa datosEmpresa = datosEmpresaDAO.getDatosEmpresa();
        model.addAttribute("nombreEmpresa", datosEmpresa.getNombreEmpresa());
        List<Object[]> planillaList = contaduriaDAO.planilla(request.getParameter("fecha1"),request.getParameter("fecha2"));

        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.US);
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (Object[] planilla : planillaList) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("Número de documento", planilla[0]);
            resultado.put("Nombre", planilla[1]);
            resultado.put("Cargo", planilla[2]);
            resultado.put("Salario / hora", currencyFormatter.format(planilla[3]));
            resultado.put("Horas normales", currencyFormatter.format(planilla[4]));
            resultado.put("Salario base",currencyFormatter.format(planilla[5]));
            resultado.put("Vacaciones", currencyFormatter.format(planilla[6]));
            resultado.put("Horas extra",currencyFormatter.format(planilla[7]));
            resultado.put("Permisos remunerables",currencyFormatter.format(planilla[8]));
            resultado.put("Otros beneficios", currencyFormatter.format(planilla[9]));
            resultado.put("Salario + beneficios", currencyFormatter.format(planilla[10]));
            resultado.put("ISSS", currencyFormatter.format(planilla[11]));
            resultado.put("AFP",currencyFormatter.format(planilla[12]));
            resultado.put("ISR",currencyFormatter.format(planilla[13]));
            resultado.put("Otras deducciones", currencyFormatter.format(planilla[14]));
            resultado.put("Total deducciones",currencyFormatter.format(planilla[15]));
            resultado.put("Salario neto",currencyFormatter.format(planilla[16]));
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
        model.addAttribute("planilla",planillaList);
        String fecha1="",fecha2="";
        fecha1=request.getParameter("fecha1");
        fecha2=request.getParameter("fecha2");

        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate fecha1Local = LocalDate.parse(fecha1, inputFormatter);
        LocalDate fecha2Local = LocalDate.parse(fecha2, inputFormatter);
        String fecha1Salida = fecha1Local.format(outputFormatter);
        String fecha2Salida=fecha2Local.format(outputFormatter);
        model.addAttribute("fecha1",fecha1Salida);
        model.addAttribute("fecha2",fecha2Salida);
        return "contaduria/planillaPost";
    }
}
