package com.gestion.planillas.usuarios.controladores;

import com.gestion.planillas.modelos.TipoDocumento;
import com.gestion.planillas.modelos.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.gestion.planillas.usuarios.DAO.usuarioDAO;
import com.gestion.planillas.usuarios.tipoDocumentoDAO.tipoDocumentoDAO;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private tipoDocumentoDAO tipoDocumentoDAO;
    @GetMapping("/listar")
    public String jsp(Model model){
        List<Usuario> puestos= usuarioDAO.getUsuarios();
        model.addAttribute("puestos",puestos);
        return "usuarios-listar";
    }
    @GetMapping("/agregar")
    public String agregar(Model model){
        List<TipoDocumento> tipoDocumentoList=tipoDocumentoDAO.getTipoDocumentos();
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);
        model.addAttribute("tiposDeDocumento",tipoDocumentoList);
        return "usuarios-agregar";
    }
    @PostMapping("/agregar")
    public String agregarPost(@ModelAttribute("usuario")Usuario usuario, HttpServletRequest request){
        TipoDocumento tipoDocumento=tipoDocumentoDAO.getTipoDocumento(Integer.parseInt(request.getParameter("tipoDocumento")));
        usuario.setTipoDocumento(tipoDocumento);
        usuarioDAO.insertarCliente(usuario);
        return "redirect:/usuario/agregar";
    }
}
