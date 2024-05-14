package com.gestion.planillas.Controllers;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.ProfesionOficio;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.modelos.DatosEmpresa;
import com.gestion.planillas.DAO.datosEmpresaDAO;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/datosEmpresa")
public class DatosEmpresaController {
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private datosEmpresaDAO datosEmpresa;
    @GetMapping("/listar")
    public String listarDatosEmpresa(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DatosEmpresa dataEmp =  datosEmpresa.getDatosEmpresa();
        if (dataEmp==null){
            dataEmp = new DatosEmpresa();
            dataEmp.setNombreEmpresa("[No se ha registrado nombre de la empresa]");
            dataEmp.setDireccion("[No se ha registrado direccion de la empresa]");
            dataEmp.setNombreRepresentante("[No se ha registrado a representante legal]");
            dataEmp.setNit("[No se ha registrado NIT]");
            dataEmp.setNic("[No se ha registrado NIC]");
            dataEmp.setTelefono("[No se ha registrado numero telefonico]");
            dataEmp.setPaginaWeb("[No se ha registrado pagina web]");
            dataEmp.setEmail("[No se ha registrado email]");
            model.addAttribute("datosEmpresa",dataEmp);
        }
        else
            model.addAttribute("datosEmpresa",dataEmp);

        return "datosEmpresa-ver";
    }
    @GetMapping("/editar")
    public String editar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        DatosEmpresa dataEmp = datosEmpresa.getDatosEmpresa();
        if(dataEmp == null){
            dataEmp = new DatosEmpresa();
            dataEmp.setIdEmpresa(1);
            dataEmp.setNombreEmpresa("");
            dataEmp.setDireccion("");
            dataEmp.setNombreRepresentante("");
            dataEmp.setNit("");
            dataEmp.setNic("");
            dataEmp.setTelefono("");
            dataEmp.setPaginaWeb("");
            dataEmp.setEmail("");
            model.addAttribute("datosEmpresa",dataEmp);
        }
        else
            model.addAttribute("datosEmpresa",dataEmp);
        return "datosEmpresa-editar";
    }
    @PostMapping("/editar")
    public String editarPost(HttpServletRequest request){
        DatosEmpresa dataEmp = new DatosEmpresa();
        dataEmp.setNombreEmpresa(request.getParameter("nombreEmpresa"));
        dataEmp.setDireccion(request.getParameter("direccion"));
        dataEmp.setNombreRepresentante(request.getParameter("nombreRepresentante"));
        dataEmp.setNit(request.getParameter("nit"));
        dataEmp.setNic(request.getParameter("nic"));
        dataEmp.setTelefono(request.getParameter("telefono"));
        dataEmp.setPaginaWeb(request.getParameter("paginaWeb"));
        dataEmp.setEmail(request.getParameter("email"));
        datosEmpresa.guardarDatosEmpresa(dataEmp);
        return "redirect:/datosEmpresa/listar";
    }
}
