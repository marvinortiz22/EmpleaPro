package com.gestion.planillas.Otros;
import com.gestion.planillas.modelos.Permiso;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToPermisoConverter implements Converter<String, Permiso> {

    @Override
    public Permiso convert(String source) {
        Permiso permiso = new Permiso();
        permiso.setIdPermiso(Integer.parseInt(source));
        return permiso;
    }
}
