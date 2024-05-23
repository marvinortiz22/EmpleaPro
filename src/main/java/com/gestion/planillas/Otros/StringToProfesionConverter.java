package com.gestion.planillas.Otros;
import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.ProfesionOficio;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToProfesionConverter implements Converter<String, ProfesionOficio> {

    @Override
    public ProfesionOficio convert(String source) {
        ProfesionOficio profesionOficio=new ProfesionOficio();
        profesionOficio.setIdProfOfc(Integer.parseInt(source));
        return profesionOficio;
    }
}
