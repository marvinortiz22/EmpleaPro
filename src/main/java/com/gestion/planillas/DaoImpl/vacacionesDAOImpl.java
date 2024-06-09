package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.vacacionesDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.modelos.Usuario;
import com.gestion.planillas.modelos.Vacacion;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

@Repository
public class vacacionesDAOImpl implements vacacionesDAO{

    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private empleadoDAO empleadoDAO;
    @Override
    public List<Vacacion> getVacaciones() {
        Session session=sessionFactory.getCurrentSession();
        Query<Vacacion> query=session.createQuery("FROM Vacacion order by fechaInicio desc",Vacacion.class);
        List<Vacacion> vacaciones= query.getResultList();
        return vacaciones;
    }

    @Override
    public List<Vacacion> getVacacionesAñoActual() {
        Session session=sessionFactory.getCurrentSession();
        Query<Object[]> query=session.createNativeQuery("SELECT idvacacion,e.idempleado,v.fechainicio,fechafin,pendiente FROM vacacion v right JOIN empleado e ON e.IDEMPLEADO=v.IDEMPLEADO AND YEAR(fechainicio)=YEAR(CURDATE())",Object[].class);
        List<Object[]> vacacionesObject= query.getResultList();
        List<Vacacion> vacaciones=new ArrayList<>();
        for(Object[]  object:vacacionesObject){
            Vacacion vacacion=new Vacacion();
            if(object[0]!=null)
                vacacion.setIdVacacion((Integer) object[0]);
            vacacion.setEmpleado(empleadoDAO.getEmpleado((Integer) object[1]));
            if(object[2]!=null)
                vacacion.setFechaInicio((Date) object[2]);
            vacaciones.add(vacacion);
        }
        return vacaciones;
    }

    @Override
    public Vacacion getVacacion(int id) {
        Session session=sessionFactory.getCurrentSession();
        Vacacion vacacion=session.get(Vacacion.class,id);
        return vacacion;
    }

    @Override
    @Transactional
    public void guardar(Vacacion vacacion) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(vacacion);
    }
}
