package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;

import java.util.List;

public interface deduccionGlobalDAO {
    public List<DeduccionBeneficio> getDeduccionesGlobales();
    public DeduccionBeneficioGlobal getDeduccionBeneficio(Integer id);
    public void guardar(DeduccionBeneficio deduccionBeneficio);
    public void guardar(DeduccionBeneficioGlobal deduccionBeneficioGlobal);
}
