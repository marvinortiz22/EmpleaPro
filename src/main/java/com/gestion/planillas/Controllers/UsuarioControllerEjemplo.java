package com.gestion.planillas.Controllers;

import com.gestion.planillas.Otros.AccessControl;
import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.Otros.Alert;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.gestion.planillas.DAO.deduccionGlobalDAO;

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
    //@AccessControl(roles="ROLE_Ver_usuarios")
    @AccessControl(roles="ROLE_Administrador")
    public String listar(Model model) {
        //pegar en todos los controladores para obtener el username y los permiso del user actual
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        if (model.containsAttribute("alert")) {
            Alert alert = (Alert) model.getAttribute("alert");
            model.addAttribute("alert",alert);
        }

        List<Usuario> usuarios = usuarioDAO.getUsuarios();
        model.addAttribute("usuarios", usuarios);
        return "usuario/usuariosEjemplo-listar";
    }
    @GetMapping("/agregar")
    //@AccessControl(roles="ROLE_Agregar_usuarios")
    @AccessControl(roles="ROLE_Administrador")
    public String agregar(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        Usuario usuario=new Usuario();
        model.addAttribute("usuario",usuario);

        //para los select de las llaves foraneas
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuario/usuariosEjemplo-agregar";
    }
    @GetMapping("/editar")
    //@AccessControl(roles="ROLE_Editar_usuarios")
    @AccessControl(roles="ROLE_Administrador")
    public String editar(Model model, @RequestParam("id")int id){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());

        Usuario usuario= usuarioDAO.getUsuario(id);
        model.addAttribute("usuario",usuario);

        //para los select de las llaves foraneas
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "usuario/usuariosEjemplo-editar";
    }

    @PostMapping("/agregar")
    public String agregarPost(@ModelAttribute("usuario")Usuario usuario, RedirectAttributes redirectAttributes){
        //esto es para encriptar la contra, ignorenlo
        usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));

        Alert alert=new Alert("success","Se ha añadido el usuario exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);

        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuarioEjemplo/listar";
    }
    @PostMapping("/editar")
    public String editarPost(@ModelAttribute("usuario")Usuario usuario, RedirectAttributes redirectAttributes){

        Alert alert=new Alert("success","Se ha editado el usuario exitosamente");
        redirectAttributes.addFlashAttribute("alert",alert);
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuarioEjemplo/listar";
    }
    @GetMapping("/cambiarEstado")
    //@AccessControl(roles="ROLE_Cambiar_estado_de_usuarios")
    @AccessControl(roles="ROLE_Administrador")
    public String cambiarEstado(@RequestParam("id")int id,RedirectAttributes redirectAttributes){
        Usuario usuario=usuarioDAO.getUsuario(id);
        Alert alert;
        if(usuario.isEstado())
            alert=new Alert("danger","Se ha bloqueado el usuario "+usuario.getUsername());
        else
            alert=new Alert("success","Se ha desbloqueado el usuario "+usuario.getUsername());
        redirectAttributes.addFlashAttribute("alert",alert);
        usuario.setEstado(!usuario.isEstado());
        usuarioDAO.guardarUsuario(usuario);
        return "redirect:/usuarioEjemplo/listar";
    }

    @GetMapping("/detalles")
    //@AccessControl(roles="ROLE_Ver_usuarios")
    @AccessControl(roles="ROLE_Administrador")
    public String detalles(Model model){
        model.addAttribute("usuarioPermisos",usuarioDAO.getUsuarioActual());
        return "datosEmpresa/datosEmpresa-ver";
    }
    //pruebas---------------------------------------------------

    @GetMapping("/probarJoin")
    public String probarJoin(Model model){
        List<Object[]> roles= rolDAO.getRolConJoin();
        model.addAttribute("roles",roles);
        System.out.print(roles);
        return "pruebas/probarJoin";
    }
    @GetMapping("/permisos")
    public String permisos(Model model){
        List<Rol> roles=rolDAO.getRolesValidos();
        model.addAttribute("roles",roles);
        return "pruebas/permisos";
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
