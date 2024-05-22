package com.gestion.planillas.DaoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gestion.planillas.DAO.unidadesDAO;
import com.gestion.planillas.modelos.Unidad;

@Repository
public class unidadesDAOImp implements unidadesDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public String getUnidades() {
        Session session = sessionFactory.getCurrentSession();
        Query<Unidad> query = session.createQuery("from Unidad", Unidad.class);
        List<Unidad> unidades = query.getResultList();
        List<Map<String, Object>> resultados = new ArrayList<>();
        for (Unidad unidad : unidades) {
            Map<String, Object> resultado = new HashMap<>();
            resultado.put("id", unidad.getIdUnidad());
            resultado.put("Tipo Unidad", unidad.getTipoUnidad().getNombreTipoUnidad() + "-" + unidad.getTipoUnidad().getIdTipoUnidad());
            resultado.put("Unidad Padre", unidad.getUnidadPadre());
            resultado.put("Nombre", unidad.getNombreUnidad());
            resultado.put("Estado", unidad.isEstado());
            resultados.add(resultado);
        }
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = "";
        try {
            jsonString = mapper.writeValueAsString(resultados);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonString;
    }

}
