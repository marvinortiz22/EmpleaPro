package com.gestion.planillas.DAO;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.Perlic_Empleado;
import com.gestion.planillas.modelos.PermisoLicencia;

import java.util.List;

public interface perimsoEmpDAO {
    public List<Perlic_Empleado> getPermisosEmp();
    public Perlic_Empleado getPermisoEmp(int id);
    public void savePermEmp(Perlic_Empleado permEmp);
    public List<PermisoLicencia> getPermLic();
    public PermisoLicencia getPermLicById(int id);
    public Empleado getEmp(int id);
}
