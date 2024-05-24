package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.contaduriaDAO;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class contaduriaDAOImpl implements contaduriaDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Object[]> planilla(String fecha1,String fecha2) {
        Session session=sessionFactory.getCurrentSession();
        Query<Object[]> query=session.createNativeQuery("{CALL planilla(:fecha1,:fecha2)}", Object[].class);
        query.setParameter("fecha1",fecha1);
        query.setParameter("fecha2",fecha2);
        List<Object[]> planilla= query.getResultList();
        return planilla;
    }
}
