package com.gestion.planillas.DAO;

import java.util.List;


import com.gestion.planillas.Otros.UsuarioPermisos;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;

public interface usuarioDAO {
	public List<Usuario> getUsuarios();

	public void guardarUsuario(Usuario usuario);
	public Usuario getUsuario(Integer id);
	public void borrarUsuario(int id);

	public Usuario getUsuarioPorCampo(String nombreCampo,String valorCampo);
	public Usuario getUsuarioPorCampoAjeno(String nombreCampo,String valorCampo,int id);
	public Usuario getUsuarioPorUsername(String username);

	public List<Permiso> getPermisosDeUsuario(String username);
	public UsuarioPermisos getUsuarioActual();
	public List<String> getAdminsEmails();
	public boolean tienePermiso(String permiso);
}
