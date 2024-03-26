package com.gestion.planillas.usuarios.DAO;

import java.util.List;

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
		 Session session=sessionFactory.openSession();
	     Query<Usuario> query=session.createQuery("from Usuario",Usuario.class);
	     List<Usuario> usuarios= query.getResultList();
	     session.close();
	     return usuarios;
	}

	@Override
	public void insertarCliente(Usuario usuario) {
		Session session=sessionFactory.openSession();
		session.save(usuario);
	}

}
