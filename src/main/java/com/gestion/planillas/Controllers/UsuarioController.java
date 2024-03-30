package com.gestion.planillas.Controllers;

import com.gestion.planillas.UsuarioPermisos;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.TipoDocumento;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.tipoDocumentoDAO;

import java.util.List;

@Controller
@RequestMapping("/usuario")
public class UsuarioController {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    @Autowired
    private usuarioDAO usuarioDAO;
    @Autowired
    private tipoDocumentoDAO tipoDocumentoDAO;
    @GetMapping("/listar")
    public String jsp(Model model){
        //pegar en todos los controladores para obtener el username y los permiso del user actual
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<Usuario> puestos= usuarioDAO.getUsuarios();
        model.addAttribute("puestos",puestos);
        return "usuarios-listar";
    }
    @GetMapping("/agregar")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<TipoDocumento> tipoDocumentoList=tipoDocumentoDAO.getTipoDocumentos();
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);
        /*para los select de las llaves foraneas
        model.addAttribute("tiposDeDocumento",tipoDocumentoList);*/
        return "usuarios-form";
    }
    @PostMapping("/agregar")
    public String agregarPost(@ModelAttribute("usuario")Usuario usuario){
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuario/listar";
    }
    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<TipoDocumento> tipoDocumentoList=tipoDocumentoDAO.getTipoDocumentos();
        Usuario usuario= usuarioDAO.getUsuario(id);
        model.addAttribute("usuario",usuario);
        /*para los select de las llaves foraneas
        model.addAttribute("tiposDeDocumento",tipoDocumentoList);*/
        return "usuarios-form";
    }
    @PostMapping("/editar")
    public String editarPost(@ModelAttribute("usuario")Usuario usuario){
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuario/listar";
    }
    @GetMapping("/borrar")
    public String borrar(@RequestParam("id")int id){
        usuarioDAO.borrarUsuario(id);
        return "redirect:/usuario/listar";
    }
}
