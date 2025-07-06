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

    @Override
    public Object[] planillaEmpleado(String fecha1, String fecha2, int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createNativeQuery("{CALL planillaEmpleado(:fecha1,:fecha2,:idempleado)}", Object[].class);
        query.setParameter("fecha1", fecha1);
        query.setParameter("fecha2", fecha2);
        query.setParameter("idempleado", id);
        if(query.getResultList().isEmpty()){
            return null;
        }
        Object[] planilla = query.getResultList().get(0);
        return planilla;
    }

    @Override
    public Object[] planillaEmpleado2(String fecha1,String fecha2, String numerodoc){
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createNativeQuery("{CALL planillaEmpleado2(:fecha1,:fecha2,:numerodoc)}", Object[].class);
        query.setParameter("fecha1", fecha1);
        query.setParameter("fecha2", fecha2);
        query.setParameter("numerodoc", numerodoc);
        if(query.getResultList().isEmpty()){
            return null;
        }
        Object[] planilla = query.getResultList().get(0);
        return planilla;
    }

    @Override
    public Double getSalarioNeto(String fecha1, String fecha2, int id) {
        Session session = sessionFactory.getCurrentSession();
        Query<Double> query = session.createNativeQuery("{CALL salarioNeto(:fecha1,:fecha2,:idempleado)}", Double.class);
        query.setParameter("fecha1", fecha1);
        query.setParameter("fecha2", fecha2);
        query.setParameter("idempleado", id);
        Double salarioNeto = query.getResultList().get(0);
        return salarioNeto;
    }
}
