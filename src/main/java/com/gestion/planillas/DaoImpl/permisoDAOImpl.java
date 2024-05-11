package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.permisoDAO;
import com.gestion.planillas.Modelos.Permiso;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class permisoDAOImpl implements permisoDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Permiso getPermiso(int id) {
        Session session=sessionFactory.getCurrentSession();
        Permiso permiso=session.get(Permiso.class,id);
        return permiso;
    }

    @Override
    public List<Permiso> getPermisos() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Permiso",Permiso.class);
        List<Permiso> permisos = query.list();
        return permisos;
    }

    @Override
    public List<Permiso> getPermisosPorRol(int idRol) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Permiso WHERE idRol = :idRol",Permiso.class);
        query.setParameter("idRol", idRol);
        List<Permiso> permisos = query.list();
        return permisos;
    }
}
