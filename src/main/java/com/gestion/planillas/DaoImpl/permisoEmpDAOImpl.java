package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.perimsoEmpDAO;
import com.gestion.planillas.modelos.*;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class permisoEmpDAOImpl implements perimsoEmpDAO{

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Perlic_Empleado> getPermisosEmp() {
        Session session=sessionFactory.getCurrentSession();
        Query<Perlic_Empleado> query = session.createQuery("FROM Perlic_Empleado ORDER BY idPerLic_Emp", Perlic_Empleado.class);
        return query.getResultList();
    }

    @Override
    public Perlic_Empleado getPermisoEmp(int id) {
        Session session=sessionFactory.getCurrentSession();
        Perlic_Empleado permiso=session.get(Perlic_Empleado.class,id);
        return permiso;
    }

    @Override
    @Transactional
    public void savePermEmp(Perlic_Empleado permEmp) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(permEmp);
    }

    @Override
    public List<PermisoLicencia> getPermLic() {
        Session session=sessionFactory.getCurrentSession();
        Query<PermisoLicencia> query = session.createQuery("FROM PermisoLicencia ORDER BY causa", PermisoLicencia.class);
        return query.getResultList();
    }

    @Override
    public PermisoLicencia getPermLicById(int id) {
        Session session=sessionFactory.getCurrentSession();
        return session.get(PermisoLicencia.class,id);
    }

    @Override
    public Empleado getEmp(int id) {
        Session session=sessionFactory.getCurrentSession();
        return session.get(Empleado.class,id);
    }
}
