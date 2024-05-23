package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Departamento;
import com.gestion.planillas.modelos.Municipio;
import com.gestion.planillas.modelos.ProfesionOficio;

import java.util.List;

public interface municipioDAO {
    public List<Municipio> getMunicipios();
    public List<Municipio> getMunicipiosXDepartamento(Integer id);

}
