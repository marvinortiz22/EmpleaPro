package com.gestion.planillas.DaoImpl;

import java.beans.Transient;
import java.util.ArrayList;
import java.util.List;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Rol;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAOImpl implements usuarioDAO {
	@Autowired
    private SessionFactory sessionFactory;
  
	@Override
	public List<Usuario> getUsuarios() {
		 Session session=sessionFactory.getCurrentSession();
	     Query<Usuario> query=session.createQuery("from Usuario",Usuario.class);
	     List<Usuario> usuarios= query.getResultList();
	     return usuarios;
	}
	@Override
	public Usuario getUsuario(Integer id) {
		Session session=sessionFactory.getCurrentSession();
		Usuario usuario=session.get(Usuario.class,id);
		return usuario;
	}

	@Override
	@Transactional
	public void borrarUsuario(int id) {
		Session session=sessionFactory.getCurrentSession();
		Usuario usuario=session.get(Usuario.class,id);
		session.delete(usuario);
	}

	@Override
	@Transactional
	public void guardarUsuario(Usuario usuario) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(usuario);
	}
	public Usuario getUsuarioPorUsername(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Usuario WHERE username = :username");
		query.setParameter("username", username);
		Usuario usuario = (Usuario) query.uniqueResult();
		return usuario;
	}
	public List<Permiso> getPermisosDeUsuario(int idUsuario) {
		Session session = sessionFactory.openSession();

		// Obtener el usuario por su ID
		Usuario usuario = session.get(Usuario.class, idUsuario);

		// Verificar si el usuario existe
		if (usuario == null) {
			return new ArrayList<>(); // Devolver una lista vacía si el usuario no existe
		}

		// Obtener el rol del usuario
		Rol rol = usuario.getRol();

		// Verificar si el rol existe
		if (rol == null) {
			return new ArrayList<>(); // Devolver una lista vacía si el usuario no tiene un rol asignado
		}

		// Obtener todos los permisos asociados al rol del usuario
		Query<Permiso> query = session.createQuery("SELECT rp.permiso FROM Rol_Permiso rp WHERE rp.rol = :rol", Permiso.class);
		query.setParameter("rol", rol);
		List<Permiso> permisos = query.list();
		return permisos;
	}







}
