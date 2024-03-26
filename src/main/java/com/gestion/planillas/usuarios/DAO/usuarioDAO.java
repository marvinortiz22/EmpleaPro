package com.gestion.planillas.usuarios.DAO;

import java.util.List;
import java.util.UUID;


import com.gestion.planillas.modelos.Usuario;

public interface usuarioDAO {
	public List<Usuario> getUsuarios();

	public void insertarCliente(Usuario usuario);

}
