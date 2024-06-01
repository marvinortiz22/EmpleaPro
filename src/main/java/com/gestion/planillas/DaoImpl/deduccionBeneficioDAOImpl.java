package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.deduccionBeneficio;
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
public class deduccionBeneficioDAOImpl implements deduccionBeneficio {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<DeduccionBeneficioGlobal> getDeduccionesGlobales() {
        Session session=sessionFactory.getCurrentSession();
        Query<DeduccionBeneficioGlobal> query=session.createQuery("FROM DeduccionBeneficioGlobal",DeduccionBeneficioGlobal.class);
        List<DeduccionBeneficioGlobal> deduccionBeneficios= query.getResultList();
        return deduccionBeneficios;
    }

    @Override
    public DeduccionBeneficioGlobal getDeduccionBeneficio(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        DeduccionBeneficioGlobal deduccionBeneficio=session.get(DeduccionBeneficioGlobal.class,id);
        return deduccionBeneficio;
    }

    @Override
    public List<DeduccionBeneficio_Empleado> getDeduccionBeneficioEmp(int id) {
        Session session=sessionFactory.getCurrentSession();
        Query<DeduccionBeneficio_Empleado> query=session.createQuery("FROM DeduccionBeneficio_Empleado where empleado.idEmpleado=:id",DeduccionBeneficio_Empleado.class);
        query.setParameter("id",id);
        List<DeduccionBeneficio_Empleado> deduccionBeneficios= query.getResultList();
        return deduccionBeneficios;
    }

    @Override
    @Transactional
    public void guardar(DeduccionBeneficio deduccionBeneficio) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(deduccionBeneficio);
    }

    @Override
    @Transactional
    public void guardar(DeduccionBeneficioGlobal deduccionBeneficioGlobal) {
        Session session= sessionFactory.getCurrentSession();
        session.saveOrUpdate(deduccionBeneficioGlobal);
    }
}
