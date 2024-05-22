package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.deduccionGlobalDAO;
import com.gestion.planillas.modelos.DeduccionBeneficioGlobal;
import com.gestion.planillas.modelos.DeduccionBeneficio;
import com.gestion.planillas.modelos.Rol;
import com.gestion.planillas.modelos.Usuario;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class deduccionGlobalDAOImpl implements deduccionGlobalDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<DeduccionBeneficio> getDeduccionesGlobales() {
        Session session=sessionFactory.getCurrentSession();
        Query<DeduccionBeneficio> query=session.createQuery("FROM DeduccionBeneficio",DeduccionBeneficio.class);
        List<DeduccionBeneficio> deduccionBeneficios= query.getResultList();
        return deduccionBeneficios;
    }

    @Override
    public DeduccionBeneficioGlobal getDeduccionBeneficio(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        DeduccionBeneficioGlobal deduccionBeneficio=session.get(DeduccionBeneficioGlobal.class,id);
        return deduccionBeneficio;
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
