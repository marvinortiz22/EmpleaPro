package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.DAO.empleadoDAO;
import com.gestion.planillas.DAO.usuarioDAO;
import com.gestion.planillas.modelos.Empleado;
import com.gestion.planillas.modelos.ProfesionOficio;
import com.gestion.planillas.modelos.Usuario;
import jakarta.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class empleadoDAOImpl implements empleadoDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Empleado> getEmpleados() {
        Session session=sessionFactory.getCurrentSession();
        Query<Empleado> query=session.createQuery("FROM Empleado ORDER BY nombre1", Empleado.class);
        List<Empleado> empleados= query.getResultList();
        return empleados;
    }

    @Override
    public List<Empleado> getSubordinados(Integer id) {
        Session session=sessionFactory.getCurrentSession();

        Query<Empleado> query=session.createQuery("FROM Empleado WHERE supervisor =: supervisor ORDER BY nombre1", Empleado.class);
        query.setParameter("supervisor", getEmpleado(id));

        List<Empleado> empleados= query.getResultList();

        return empleados;
    }

    @Override
    public List<Empleado> getEmpleadosActivados() {
        Session session=sessionFactory.getCurrentSession();
        Query<Empleado> query=session.createQuery("FROM Empleado WHERE estado = true ORDER BY nombre1", Empleado.class);
        List<Empleado> empleados= query.getResultList();
        return empleados;
    }

    @Override
    public Empleado getEmpleado(Integer id) {
        Session session=sessionFactory.getCurrentSession();
        Empleado empleado = session.get(Empleado.class,id);
        return empleado;
    }

    @Override
    @Transactional
    public void guardarEmpleado(Empleado empleado) {
        Session session=sessionFactory.getCurrentSession();
        session.saveOrUpdate(empleado);
    }
    /*
    private void guardarBitacoraEmpleado(Empleado empleado, Integer idUsuario) {
        Session session = sessionFactory.getCurrentSession();
        AuditoriaEmpleado auditoria = new AuditoriaEmpleado();
        auditoria.setUsuario(idUsuario);
        session.save(auditoria);
    }
    */
    @Override
    public List<ProfesionOficio> getProfesionesOficios(Integer id) {
        Empleado empleado = getEmpleado(id);
        return new ArrayList<>(empleado.getProfesionOficios());
    }

    @Override
    public List<Empleado> getEmpleadosUnidad(int id,int anio) {
        Session session=sessionFactory.getCurrentSession();
        Query<Empleado> query=session.createNativeQuery("SELECT e.IDEMPLEADO,e.IDPUESTO,e.IDMUNICIPIO,e.IDESTADOCIVIL,e.EMP_IDEMPLEADO,e.IDTIPODOC,e.NOMBRE1,e.NOMBRE2,e.APELLIDO1,e.APELLIDO2,e.APELLIDOCASADA,e.SEXO,e.FECHANACIMIENTO,e.FECHAINGRESO,e.NUMERODOC,e.NIT,e.ISSS,e.NUP,e.SALARIO,e.CORREOINSTITUCIONAL,e.CORREOPERSONAL,e.ESTADO FROM empleado e JOIN puesto p ON p.IDPUESTO=e.IDPUESTO JOIN unidad u ON u.IDUNIDAD=p.IDUNIDAD WHERE e.estado=1 AND u.idunidad=:idunidad AND YEAR(fechaingreso)<=:año", Empleado.class);
        query.setParameter("idunidad",id);
        query.setParameter("año",anio);
        List<Empleado> empleados= query.getResultList();
        return empleados;
    }

    @Override
    public List<Empleado> getEmpleadosUnidadSuperior(int id, int idempleado) {
        Session session=sessionFactory.getCurrentSession();
        Query<Empleado> query=session.createNativeQuery("{CALL ObtenerEmpleadosPorUnidadSuperiorInmediata(:id, :idEmpleado)}", Empleado.class);
        query.setParameter("id",id);
        query.setParameter("idEmpleado",idempleado);
        List<Empleado> empleados= query.getResultList();
        return empleados;
    }
}
