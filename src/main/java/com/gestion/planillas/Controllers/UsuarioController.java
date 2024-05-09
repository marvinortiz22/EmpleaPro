package com.gestion.planillas.Controllers;

import com.gestion.planillas.UsuarioPermisos;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.TipoDocumento;
import com.gestion.planillas.modelos.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.DAO.permisoDAO;
import com.gestion.planillas.DAO.tipoDocumentoDAO;
import java.lang.System;

import java.util.ArrayList;
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
    @Autowired
    private permisoDAO permisoDAO;
    @Autowired
    private rolDAO rolDAO;
    @GetMapping("/listar")
    public String listar(Model model) {
        //pegar en todos los controladores para obtener el username y los permiso del user actual
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<Usuario> usuarios = usuarioDAO.getUsuarios();
        model.addAttribute("usuarios", usuarios);
        return "usuarios-listar";
    }
    @GetMapping("/agregar")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);

        //para los select de las llaves foraneas
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuarios-form";
    }
    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Usuario usuario= usuarioDAO.getUsuario(id);
        model.addAttribute("usuario",usuario);

        //para los select de las llaves foraneas
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuarios-form";
    }

    //sirve tanto para editar como para crear siempre y cuando usen un solo form
    @PostMapping("/guardar")
    public String guardar(@ModelAttribute("usuario")Usuario usuario){

        //esto es para encriptar la contra, ignorenlo
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuario/listar";
    }
    @GetMapping("/cambiarEstado")
    public String cambiarEstado(@RequestParam("id")int id){
        Usuario usuario=usuarioDAO.getUsuario(id);
        usuario.setEstado(!usuario.isEstado());
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuario/listar";
    }
    /*
    @PostMapping("/agregar")
    public String agregarPost(@ModelAttribute("usuario")Usuario usuario){


        if(usuarioDAO.getUsuarioPorUsername(usuario.getUsername())!=null){
            result.rejectValue("username","error.username","ya existe un usuario con este username");
        }

        if (result.hasErrors())
            return "usuarios-agregar";
        else{
            usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
            usuarioDAO.guardarUsuario(usuario);
            return "redirect:/usuario/listar";
        }
    }

    @PostMapping("/editar")
    public String editarPost(HttpServletRequest request){

        Usuario usuario=usuarioDAO.getUsuario(Integer.parseInt(request.getParameter("idUsuario")));
        Rol rol=rolDAO.getRol(Integer.parseInt(request.getParameter("Rol.idRol")));

        usuario.setUsername(request.getParameter("username"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setRol(rol);
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuario/listar";
    } */

    //pruebas---------------------------------------------------
    @GetMapping("/ver")
    public String ver(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        return "datosEmpresa-ver";
    }
    @GetMapping("/probarJoin")
    public String probarJoin(Model model){
        List<Object[]> roles= rolDAO.getRolConJoin();
        model.addAttribute("roles",roles);
        System.out.print(roles);
        return "probarJoin";
    }
    @GetMapping("/permisos")
    public String permisos(Model model){
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "permisos";
    }

}
