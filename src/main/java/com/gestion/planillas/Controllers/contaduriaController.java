package com.gestion.planillas.Controllers;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.modelos.PresupuestoAnual;
import com.gestion.planillas.modelos.Unidad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.DAO.contaduriaDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/contaduria")
public class contaduriaController {
    @Autowired
    private contaduriaDAO contaduriaDAO;
    @Autowired
    private usuarioDAO usuarioDAO;
    @GetMapping("/planilla")
    public String planilla(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Object[]> planillaList = contaduriaDAO.planilla("2024-05-21","2024-05-23");
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (Object[] planilla : planillaList) {
            for(Object campo:planilla){
                System.out.print(campo.toString());
            }
        }
        for (Object[] planilla : planillaList) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("Número de documento", planilla[0]);
            resultado.put("Nombre", planilla[1]);
            resultado.put("Cargo", planilla[2]);
            resultado.put("Salario/hora", "$"+planilla[3]);
            resultado.put("Horas normales", planilla[4]);
            resultado.put("Salario*horas normales","$"+ planilla[5]);
            resultado.put("Vacaciones", "$"+planilla[6]);
            resultado.put("Horas extra","$"+ planilla[7]);
            resultado.put("Permisos remunerables","$"+ planilla[8]);
            resultado.put("Otros beneficios", "$"+planilla[9]);
            resultado.put("Salario+beneficios", "$"+planilla[10]);
            resultado.put("ISSS", "$"+planilla[11]);
            resultado.put("AFP","$"+ planilla[12]);
            resultado.put("ISR","$"+ planilla[13]);
            resultado.put("Otras deducciones", "$"+planilla[14]);
            resultado.put("Total deducciones","$"+ planilla[15]);
            resultado.put("Salario neto","$"+ planilla[16]);
            resultados.add(resultado);
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = "";
        try {
            jsonString = mapper.writeValueAsString(resultados);
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean permisoEditar = false;
        boolean permisoCrear = false;
        boolean cambiarEstado = false;
        boolean verPresupuestos = false;
        model.addAttribute("permisoEditar", permisoEditar);
        model.addAttribute("permisoCrear", permisoCrear);
        model.addAttribute("cambiarEstado", cambiarEstado);
        model.addAttribute("verPresupuestos", verPresupuestos);
        model.addAttribute("unidades", jsonString);
        return "contaduria/planilla";
    }
}
