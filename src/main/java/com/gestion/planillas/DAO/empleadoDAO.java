package com.gestion.planillas.DAO;

import com.gestion.planillas.Controllers.EmpleadoController;
import com.gestion.planillas.Otros.UsuarioPermisos;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Empleado;

import java.util.List;

public interface empleadoDAO {
	public List<Empleado> getEmpleados();

}