package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.rolDAO;
import com.gestion.planillas.Modelos.Rol;

import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class rolDAOImpl implements rolDAO {
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Rol> getRolesValidos() {
        Session session=sessionFactory.getCurrentSession();
        Query<Rol> query=session.createQuery("FROM Rol WHERE estado=true",Rol.class);
        List<Rol> puestos= query.getResultList();
        return puestos;
    }

    @Override
    public Rol getRol(int id) {
        Session session=sessionFactory.getCurrentSession();
        Rol rol=session.get(Rol.class,id);
        return rol;
    }

    @Override
    public List<Object[]> getRolConJoin() {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createQuery("SELECT nombreRol, COUNT(idUsuario) FROM Rol r JOIN Usuario u ON u.rol.idRol=r.idRol GROUP BY nombreRol", Object[].class);
        List<Object[]> resultados = query.getResultList();
        return resultados;
    }

    @Override
    @Transactional
    public void guardarRol(Rol rol) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(rol);
    }
}
