package com.gestion.planillas.DaoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gestion.planillas.modelos.Departamento;
import com.gestion.planillas.DAO.demograficoDAO;
import com.gestion.planillas.modelos.Municipio;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class demograficoDAOImpl implements demograficoDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public List<Object> countEmpleadosPorDep() {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createQuery(
                "SELECT nombreDepartamento, COUNT(idEmpleado),idDepartamento FROM Departamento d " +
                        "JOIN Municipio m ON m.departamento.idDepartamento=d.idDepartamento " +
                        "LEFT JOIN Empleado e ON e.municipio.idMunicipio=m.idMunicipio " +
                        "GROUP BY idDepartamento", Object[].class
        );

        List<Object[]> resultList = query.getResultList();
        List<Object> result = new ArrayList<>();
        for (Object[] row : resultList) {
            Map<String, Object> map = new HashMap<>();
            map.put("nombreDepartamento", row[0]);
            map.put("cantidad_empleados", row[1]);
            map.put("idDepartamento", row[2]);
            result.add(map);
        }
        return result;
    }
    @Override
    public List<Object> countEmpleadosPorMun(int idDepartamento) {
        Session session = sessionFactory.getCurrentSession();
        Query<Object[]> query = session.createQuery(
                "SELECT m.idMunicipio, m.nombreMunicipio, COALESCE(COUNT(e.idEmpleado), 0) AS cantidad_empleados " +
                        "FROM Municipio m " +
                        "LEFT JOIN Empleado e ON m.idMunicipio = e.municipio.idMunicipio " +
                        "WHERE m.departamento.idDepartamento = :idDepartamento " +
                        "GROUP BY m.idMunicipio, m.nombreMunicipio", Object[].class
        );
        query.setParameter("idDepartamento", idDepartamento);
        List<Object[]> resultList = query.getResultList();
        List<Object> result = new ArrayList<>();
        for (Object[] row : resultList) {
            Map<String, Object> map = new HashMap<>();
            map.put("idMunicipio", row[0]);
            map.put("nombreMunicipio", row[1]);
            map.put("cantidad_empleados", row[2]);
            result.add(map);
        }
        return result;
    }
    @Override
    public String depSeleccionado(int idDepartamento){
        String nombreDep = null;
        Session session = sessionFactory.getCurrentSession();
        Query<String> query = session.createQuery("SELECT nombreDepartamento FROM Departamento WHERE idDepartamento = :idDepartamento", String.class);
        query.setParameter("idDepartamento", idDepartamento);
        List<String> resultados = query.getResultList();
        if (!resultados.isEmpty()) {
            nombreDep = resultados.get(0);
        }
        return nombreDep;
    }

    @Override
    public long getNumEmpleados(){
        long nDeEmpleados = 0;
        Session session = sessionFactory.getCurrentSession();
        Query<Long> query = session.createQuery("SELECT COUNT(idEmpleado) FROM Empleado", Long.class);

        List<Long> resultados = query.getResultList();
        if (!resultados.isEmpty()) {
            nDeEmpleados = resultados.get(0);
        }
        return nDeEmpleados;
    }
    /*@Override
    public List<Departamento> getDepartamentos() {
        Session session=sessionFactory.getCurrentSession();
        Query<Departamento> query=session.createQuery("FROM Departamento ORDER BY nombreDepartamento",Departamento.class);
        List<Departamento> departamentos = query.getResultList();
        return departamentos;
    }



    @Override
    public List<Municipio> getMunicipiosPorDepartamento(int idDepartamento) {
        Session session = sessionFactory.getCurrentSession();
        Query<Municipio> query = session.createQuery("FROM Municipio WHERE departamento.idDepartamento = :idDepartamento", Municipio.class);
        query.setParameter("idDepartamento", idDepartamento);
        List<Municipio> municipios = query.getResultList();
        return municipios;
    }*/



}
