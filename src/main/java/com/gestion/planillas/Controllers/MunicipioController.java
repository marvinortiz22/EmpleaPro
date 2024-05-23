package com.gestion.planillas.Controllers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gestion.planillas.modelos.*;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/departamentos/{idDepartamento}/municipios")
public class MunicipioController {
    @Autowired
    private  com.gestion.planillas.DAO.municipioDAO municipioDAO;

    @GetMapping
    @ResponseBody
    public List<Municipio> obtenerMunicipios(@PathVariable int idDepartamento) {
        return municipioDAO.getMunicipiosXDepartamento(idDepartamento);
    }
}
