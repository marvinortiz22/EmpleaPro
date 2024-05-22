package com.gestion.planillas.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.Otros.UsuarioPermisos;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Rol;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import com.gestion.planillas.modelos.Usuario;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

@Repository
public class UsuarioDAOImpl implements usuarioDAO {
	@Autowired
    private SessionFactory sessionFactory;
  
	@Override
	public List<Usuario> getUsuarios() {
		 Session session=sessionFactory.getCurrentSession();
	     Query<Usuario> query=session.createQuery("FROM Usuario ORDER BY estado desc",Usuario.class);
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
	@Override
	public Usuario getUsuarioPorCampo(String nombreCampo,String valorCampo) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Usuario WHERE "+nombreCampo+" = :valorCampo",Usuario.class);
		query.setParameter("valorCampo", valorCampo);
		Usuario usuario = (Usuario) query.uniqueResult();
		session.close();
		return usuario;
	}
	@Override
	public Usuario getUsuarioPorCampoAjeno(String nombreCampo,String valorCampo,int id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Usuario WHERE "+nombreCampo+" = :valorCampo AND idUsuario!=:id",Usuario.class);
		query.setParameter("valorCampo", valorCampo);
		query.setParameter("id", id);
		Usuario usuario = (Usuario) query.uniqueResult();
		session.close();
		return usuario;
	}
	@Override
	public Usuario getUsuarioPorUsername(String username) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("FROM Usuario WHERE username = :username",Usuario.class);
		query.setParameter("username", username);
		Usuario usuario = (Usuario) query.uniqueResult();
		session.close();
		return usuario;
	}
	@Override
	public List<Permiso> getPermisosDeUsuario(String username) {
		Session session = sessionFactory.openSession();

		// Obtener el usuario por su ID
        Query query = session.createQuery("FROM Usuario WHERE username = :username",Usuario.class);
        query.setParameter("username", username);
        Usuario usuario = (Usuario) query.uniqueResult();

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
		Query<Permiso> query2 = session.createQuery("SELECT rp.permiso FROM Rol_Permiso rp WHERE rp.rol = :rol", Permiso.class);
		query2.setParameter("rol", rol);
		List<Permiso> permisos = query2.list();
		session.close();
		return permisos;
	}
	@Override
    public UsuarioPermisos getUsuarioActual() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails=(UserDetails) authentication.getPrincipal();
            String username=userDetails.getUsername();
            List<Permiso> permisos=getPermisosDeUsuario(username);
            UsuarioPermisos usuarioPermisos=new UsuarioPermisos(username,permisos);
            return usuarioPermisos;
        }
        // En este punto, podría devolver null o lanzar una excepción según tus requisitos.
        return null;
    }

	@Override
	public List<String> getAdminsEmails(){
		Session session = sessionFactory.getCurrentSession();
		Query<String> query = session.createQuery("SELECT email FROM Usuario u " +
				"JOIN Rol_Permiso rp ON rp.rol.idRol=u.rol.idRol " +
				"JOIN Permiso p ON p.idPermiso=rp.permiso.idPermiso " +
				"WHERE p.nombrePermiso='ROLE_Administrador'", String.class);
		List<String> resultados = query.getResultList();
		return resultados;
	}

	@Override
	public boolean tienePermiso(String permiso) {
		UsuarioPermisos usuarioPermisos = getUsuarioActual();
		if (usuarioPermisos == null) {
			return false;
		}
		List<Permiso> permisos = usuarioPermisos.getPermisos();
		for (Permiso p : permisos) {
			if (p.getNombrePermiso().equals(permiso)) {
				return true;
			}
		}
		return false;
	}
}
