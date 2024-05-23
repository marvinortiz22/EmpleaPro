package com.gestion.planillas.DAO;

import com.gestion.planillas.Controllers.EmpleadoController;
import com.gestion.planillas.Otros.UsuarioPermisos;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.ProfesionOficio;
import com.gestion.planillas.modelos.Usuario;

import java.util.List;

public interface empleadoDAO {
	public List<Empleado> getEmpleados();
	public Empleado getEmpleado(Integer id);
	public void guardarEmpleado(Empleado empleado);
	public List<ProfesionOficio> getProfesionesOficios(Integer id);

}
