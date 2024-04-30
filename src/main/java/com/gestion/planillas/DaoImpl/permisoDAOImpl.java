package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.permisoDAO;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class permisoDAOImpl implements permisoDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Permiso> getPermisosPorRol(int idRol) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Permiso WHERE idRol = :idRol",Permiso.class);
        query.setParameter("idRol", idRol);
        List<Permiso> permisos = query.list();
        return permisos;
    }
}
