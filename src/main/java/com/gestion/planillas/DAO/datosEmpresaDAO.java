package com.gestion.planillas.DAO;

import java.util.List;
import com.gestion.planillas.modelos.DatosEmpresa;

public interface datosEmpresaDAO {
    public DatosEmpresa getDatosEmpresa();
    public void guardarDatosEmpresa(DatosEmpresa datosEmpresa);
}
