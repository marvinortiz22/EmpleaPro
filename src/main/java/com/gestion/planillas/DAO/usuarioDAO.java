package com.gestion.planillas.DAO;

import java.util.List;


import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;
import org.hibernate.SessionFactory;

public interface usuarioDAO {
	public List<Usuario> getUsuarios();

	public void guardarUsuario(Usuario usuario);
	public Usuario getUsuario(Integer id);
	public void borrarUsuario(int id);
	public Usuario getUsuarioPorUsername(String username);

	public List<Permiso> getPermisosDeUsuario(int idUsuario);

}
