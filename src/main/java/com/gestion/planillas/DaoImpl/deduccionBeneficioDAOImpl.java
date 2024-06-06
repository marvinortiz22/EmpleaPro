package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.deduccionBeneficioDAO;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.DeduccionBeneficio_Empleado;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class deduccionBeneficioDAOImpl implements deduccionBeneficioDAO {

    @Autowired
    private SessionFactory sessionFactory;
    @Override
    @Transactional
    public void guardar(DeduccionBeneficio deduccionBeneficio) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(deduccionBeneficio);
    }

    @Override
    public DeduccionBeneficio getDeduccionBeneficioBase(int id) {
        Session session=sessionFactory.getCurrentSession();
        DeduccionBeneficio deduccionBeneficio=session.get(DeduccionBeneficio.class,id);
        return deduccionBeneficio;
    }

    @Override
    public List<DeduccionBeneficio> getDeduccionesBeneficios() {
        Session session=sessionFactory.getCurrentSession();
        Query<DeduccionBeneficio> query=session.createNativeQuery("SELECT * FROM deduccionbeneficio d WHERE d.IDDEDUCBENEF NOT IN (SELECT IDDEDUCBENEF FROM deduccionbeneficioglobal)",DeduccionBeneficio.class);
        List<DeduccionBeneficio> deduccionBeneficios= query.getResultList();
        return deduccionBeneficios;
    }

    @Override
    public List<DeduccionBeneficioGlobal> getDeduccionesGlobales() {
        Session session=sessionFactory.getCurrentSession();
        Query<DeduccionBeneficioGlobal> query=session.createQuery("FROM DeduccionBeneficioGlobal",DeduccionBeneficioGlobal.class);
        List<DeduccionBeneficioGlobal> deduccionBeneficios= query.getResultList();
        return deduccionBeneficios;
    }

    @Override
    public DeduccionBeneficioGlobal getDeduccionBeneficioGlobal(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        DeduccionBeneficioGlobal deduccionBeneficio=session.get(DeduccionBeneficioGlobal.class,id);
        return deduccionBeneficio;
    }
    @Override
    @Transactional
    public void guardarGlobal(DeduccionBeneficioGlobal deduccionBeneficioGlobal) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(deduccionBeneficioGlobal);
    }

    @Override
    public List<DeduccionBeneficio_Empleado> getDeduccionesBeneficiosEmp(int id) {
        Session session=sessionFactory.getCurrentSession();
        Query<DeduccionBeneficio_Empleado> query=session.createQuery("FROM DeduccionBeneficio_Empleado where empleado.idEmpleado=:id order by deduccionBeneficio.tipo, proporcionalAlSueldo",DeduccionBeneficio_Empleado.class);
        query.setParameter("id",id);
        List<DeduccionBeneficio_Empleado> deduccionBeneficios= query.getResultList();
        return deduccionBeneficios;
    }

    @Override
    public DeduccionBeneficio_Empleado getDeduccionBeneficioEmp(int id) {
        Session session=sessionFactory.getCurrentSession();
        DeduccionBeneficio_Empleado deduccionBeneficioEmpleado=session.get(DeduccionBeneficio_Empleado.class,id);
        return deduccionBeneficioEmpleado;
    }

    @Override
    @Transactional
    public void guardarEmp(DeduccionBeneficio_Empleado deduccionBeneficioEmpleado) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(deduccionBeneficioEmpleado);
    }
}
