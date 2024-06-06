package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;

import java.util.List;

public interface deduccionBeneficioDAO {
    public void guardar(DeduccionBeneficio deduccionBeneficio);
    public DeduccionBeneficio getDeduccionBeneficioBase(int id);
    public List<DeduccionBeneficio> getDeduccionesBeneficios();
    public List<DeduccionBeneficioGlobal> getDeduccionesGlobales();
    public DeduccionBeneficioGlobal getDeduccionBeneficioGlobal(Integer id);
    public void guardarGlobal(DeduccionBeneficioGlobal deduccionBeneficioGlobal);
    public List<DeduccionBeneficio_Empleado> getDeduccionesBeneficiosEmp(int id);
    public DeduccionBeneficio_Empleado getDeduccionBeneficioEmp(int id);
    public void guardarEmp(DeduccionBeneficio_Empleado deduccionBeneficioEmpleado);


}
