package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.permisoLicenciaDAO;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.PermisoLicencia;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class permisoLicenciaDAOImpl implements permisoLicenciaDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public PermisoLicencia getPermiso(int id) {
        Session session=sessionFactory.getCurrentSession();
        PermisoLicencia permisoLicencia=session.get(PermisoLicencia.class,id);
        return permisoLicencia;
    }
}
