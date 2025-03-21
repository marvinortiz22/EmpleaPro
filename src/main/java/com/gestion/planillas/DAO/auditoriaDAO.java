package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Auditoria_DeduccionBeneficioEmpleado;
import com.gestion.planillas.modelos.Auditoria_DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.Auditoria_Empleado;

import java.util.List;

public interface auditoriaDAO {
    public List<Auditoria_Empleado> getAuditoriaEmps();
    public Auditoria_Empleado getAuditoriaEmp(Integer id);
    public List<Auditoria_DeduccionBeneficioEmpleado> getAuditoriaDecBenEmp();
    public List<Auditoria_DeduccionBeneficioGlobal> getAuditoriaDecBenGlo();

}
