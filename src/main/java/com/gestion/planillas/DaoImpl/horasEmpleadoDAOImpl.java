package com.gestion.planillas.DaoImpl;
import com.gestion.planillas.DAO.horasEmpleadoDAO;
import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.modelos.HorasEmpleado;
import com.gestion.planillas.modelos.Usuario;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.validation.ObjectError;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Repository
public class horasEmpleadoDAOImpl implements horasEmpleadoDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Autowired
    private empleadoDAO empleadoDAO;
    @Override
    public List<HorasEmpleado> getHorasEmpleadoList() {
        Session session=sessionFactory.getCurrentSession();
        Query<HorasEmpleado> query=session.createQuery("FROM HorasEmpleado",HorasEmpleado.class);
        List<HorasEmpleado> horasEmpleadoList= query.getResultList();
        return horasEmpleadoList;
    }

    @Override
    public List<HorasEmpleado> getHorasEmpleadoHoy() {
        Session session=sessionFactory.getCurrentSession();
        Query<Object[]> query=session.createNativeQuery("SELECT idhorasempleado,e.idempleado,fecha,horaingreso,horasalida FROM empleado e LEFT JOIN horasempleado he ON e.IDEMPLEADO = he.IDEMPLEADO AND he.FECHA = CURDATE()",Object[].class);
        List<Object[]> horasEmpleadoListObject= query.getResultList();
        List<HorasEmpleado> horasEmpleadoList=new ArrayList<>();
        for(Object[] object:horasEmpleadoListObject){
            HorasEmpleado horasEmpleado=new HorasEmpleado();
            if(object[0]!=null)
                horasEmpleado.setIdHorasEmpleado((Integer) object[0]);
            horasEmpleado.setEmpleado(empleadoDAO.getEmpleado((Integer) object[1]));
            if(object[2]!=null)
                horasEmpleado.setFecha((Date) object[2]);
            if(object[3]!=null)
                horasEmpleado.setHoraIngreso((Date) object[3]);
            if(object[4]!=null)
                horasEmpleado.setHoraSalida((Date) object[4]);
            horasEmpleadoList.add(horasEmpleado);
        }
        return horasEmpleadoList;
    }

    @Override
    public HorasEmpleado getHorasEmpleado(int id) {
        Session session=sessionFactory.getCurrentSession();
        HorasEmpleado horasEmpleado=session.get(HorasEmpleado.class,id);
        return horasEmpleado;
    }

    @Override
    @Transactional
    public void guardar(HorasEmpleado horasEmpleado) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(horasEmpleado);
    }
}
