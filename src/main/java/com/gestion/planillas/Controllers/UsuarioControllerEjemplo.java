package com.gestion.planillas.Controllers;

import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.Usuario;
import com.gestion.planillas.Otros.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.DAO.permisoDAO;
import com.gestion.planillas.DAO.tipoDocumentoDAO;
import java.lang.System;

import java.util.List;

@Controller
@RequestMapping("/usuarioEjemplo")
public class UsuarioControllerEjemplo {

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
    @Autowired
    private EmailService emailService;
    @GetMapping("/listar")
    public String listar(Model model) {
        //pegar en todos los controladores para obtener el username y los permiso del user actual
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        List<Usuario> usuarios = usuarioDAO.getUsuarios();
        model.addAttribute("usuarios", usuarios);
        return "usuariosEjemplo-listar";
    }
    @GetMapping("/agregar")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);

        //para los select de las llaves foraneas
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuariosEjemplo-form";
    }
    @GetMapping("/editar")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Usuario usuario= usuarioDAO.getUsuario(id);
        model.addAttribute("usuario",usuario);

        //para los select de las llaves foraneas
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuariosEjemplo-form";
    }

    //sirve tanto para editar como para crear siempre y cuando usen un solo form
    @PostMapping("/guardar")
    public String guardar(@ModelAttribute("usuario")Usuario usuario){

        //esto es para encriptar la contra, ignorenlo
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuarioEjemplo/listar";
    }
    @GetMapping("/cambiarEstado")
    public String cambiarEstado(@RequestParam("id")int id){
        Usuario usuario=usuarioDAO.getUsuario(id);
        usuario.setEstado(!usuario.isEstado());
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuarioEjemplo/listar";
    }

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
    @GetMapping("/rolusuario")
    @ResponseBody
    @AccessControl(roles={"ROLE_Ver_empleados","ROLE_Ver_puestos"})
    public String rolusuario(){
        return "hola";
    }
    @GetMapping("/rolusuario2")
    @ResponseBody
    @AccessControl(roles = {})
    public String rolusuario2(){
        return "hola2";
    }
    @GetMapping("/mail")
    public String mail(){
        String to = "";
        String subject = "Asunto del correo";
        String text = "a\ngoogle.com";
        emailService.sendEmail(to, subject, text);
        return "redirect:/usuarioEjemplo/listar";
    }

}
