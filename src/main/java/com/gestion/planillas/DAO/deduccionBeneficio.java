package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;

import java.util.List;

public interface deduccionBeneficio {
    public List<DeduccionBeneficioGlobal> getDeduccionesGlobales();
    public DeduccionBeneficioGlobal getDeduccionBeneficio(Integer id);
    public List<DeduccionBeneficio_Empleado> getDeduccionBeneficioEmp(int id);
    public void guardar(DeduccionBeneficio deduccionBeneficio);
    public void guardar(DeduccionBeneficioGlobal deduccionBeneficioGlobal);
}
