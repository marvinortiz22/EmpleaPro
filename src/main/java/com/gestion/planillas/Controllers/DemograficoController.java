package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.demograficoDAO;
import com.gestion.planillas.modelos.Departamento;
import com.gestion.planillas.modelos.Municipio;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/demografia")
public class DemograficoController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private demograficoDAO demograficoDAO;

    /*@GetMapping("/listar")
    public String listar(@RequestParam(name = "idDepartamento", required = false) Integer idDepartamento, Model model) {

        //pegar en todos los controladores para obtener el username y los permiso del user actual
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<Departamento> departamentos = demograficoDAO.getDepartamentos();
        // Si no se proporciona ningún idDepartamento, establece un valor por defecto
        if (idDepartamento == null) {
            idDepartamento = 0;
            model.addAttribute("depSeleccionado","Seleccionar el departamento");
        }
        else{
            String nombreDep = demograficoDAO.depSeleccionado(idDepartamento);
            model.addAttribute("depSeleccionado",nombreDep);
            List<Object> cantEmpMun = demograficoDAO.countEmpleadosPorMun(idDepartamento);

            List<String> nombresMunicipios = new ArrayList<>();
            List<Long> cantidadEmpleados = new ArrayList<>();
            for (Object obj : cantEmpMun) {
                Map<String, Object> map = (Map<String, Object>) obj;
                nombresMunicipios.add((String) map.get("nombreMunicipio"));
                cantidadEmpleados.add((Long) map.get("cantidad_empleados"));
            }

            model.addAttribute("nombresMunicipios", nombresMunicipios );
            model.addAttribute("cantidadEmpleados", cantidadEmpleados);
        }

        List<Municipio> municipios = demograficoDAO.getMunicipiosPorDepartamento(idDepartamento);
        model.addAttribute("departamentos", departamentos);
        model.addAttribute("municipios", municipios);
        return "demografico-listar";
    }*/

    @GetMapping("/departamentos")
    public String departamentos(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Object> departamentos=demograficoDAO.countEmpleadosPorDep();
        long nDeEmpleados=demograficoDAO.getNumEmpleados();
        model.addAttribute("nDeEmpleados",nDeEmpleados);
        model.addAttribute("departamentos",departamentos);

        // Crear listas para almacenar los nombres de los departamentos y la cantidad de empleados
        List<String> nombresDepartamentos = new ArrayList<>();
        List<Long> cantidadEmpleados = new ArrayList<>();

        // Iterar sobre la lista de departamentos
        for (Object obj : departamentos) {
            Map<String, Object> map = (Map<String, Object>) obj;
            nombresDepartamentos.add((String) map.get("nombreDepartamento"));
            cantidadEmpleados.add((Long) map.get("cantidad_empleados"));
        }

        // Pasar los nombres de los departamentos y la cantidad de empleados por departamento a la vista
        model.addAttribute("nombresDepartamentos", nombresDepartamentos);
        model.addAttribute("cantidadEmpleados", cantidadEmpleados);

        System.out.print("departamentos"+nombresDepartamentos);
        System.out.println("cantidad de emp"+cantidadEmpleados);
        return "demografico-departamentos";
    }
    @GetMapping("/municipios")
    public String municipios(Model model,@RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        List<Object> municipios=demograficoDAO.countEmpleadosPorMun(id);
        String nombreDepartamento=demograficoDAO.depSeleccionado(id);
        List<Usuario> usuario=usuarioDAO.getUsuarios();
        model.addAttribute("municipios",municipios);
        model.addAttribute("nombreDepartamento",nombreDepartamento);
        return "demografico-municipios";
    }

}
