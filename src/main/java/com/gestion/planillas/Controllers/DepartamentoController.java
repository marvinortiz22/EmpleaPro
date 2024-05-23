package com.gestion.planillas.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gestion.planillas.modelos.*;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/departamentos")
public class DepartamentoController {
    @Autowired
    private  com.gestion.planillas.DAO.departamentoDAO departamentoDAO;

    @GetMapping
    @ResponseBody
    public List<Departamento> obtenerDepartamentos() {
        return departamentoDAO.getDepartamentos();
    }
}
