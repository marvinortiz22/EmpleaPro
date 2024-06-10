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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        model.addAttribute("fecha1",request.getParameter("fecha1")); model.addAttribute("fecha2",request.getParameter("fecha2"));
        DatosEmpresa datosEmpresa = datosEmpresaDAO.getDatosEmpresa();
        model.addAttribute("nombreEmpresa", datosEmpresa.getNombreEmpresa());
        List<Object[]> planillaList = contaduriaDAO.planilla(request.getParameter("fecha1"),request.getParameter("fecha2"));
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (Object[] planilla : planillaList) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("Número de documento", planilla[0]);
            resultado.put("Nombre", planilla[1]);
            resultado.put("Cargo", planilla[2]);
            resultado.put("Salario/hora", String.format("$%.2f",Double.parseDouble(planilla[3].toString())));
            resultado.put("Horas normales", planilla[4]);
            resultado.put("Salario*horas normales",String.format("$%.2f",Double.parseDouble(planilla[5].toString())));
            resultado.put("Vacaciones", String.format("$%.2f",Double.parseDouble(planilla[6].toString())));
            resultado.put("Horas extra",String.format("$%.2f",Double.parseDouble(planilla[7].toString())));
            resultado.put("Permisos remunerables",String.format("$%.2f",Double.parseDouble(planilla[8].toString())));
            resultado.put("Otros beneficios", String.format("$%.2f",Double.parseDouble(planilla[9].toString())));
            resultado.put("Salario+beneficios", String.format("$%.2f",Double.parseDouble(planilla[10].toString())));
            resultado.put("ISSS", String.format("$%.2f",Double.parseDouble(planilla[11].toString())));
            resultado.put("AFP",String.format("$%.2f",Double.parseDouble(planilla[12].toString())));
            resultado.put("ISR",String.format("$%.2f",Double.parseDouble(planilla[13].toString())));
            resultado.put("Otras deducciones", String.format("$%.2f",Double.parseDouble(planilla[14].toString())));
            resultado.put("Total deducciones",String.format("$%.2f",Double.parseDouble(planilla[15].toString())));
            resultado.put("Salario neto",String.format("$%.2f",Double.parseDouble(planilla[16].toString())));
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
        return "contaduria/planilla";
    }
}
