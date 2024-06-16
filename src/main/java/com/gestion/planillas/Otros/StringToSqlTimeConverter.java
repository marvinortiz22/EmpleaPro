package com.gestion.planillas.Otros;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

@Component
public class StringToSqlTimeConverter implements Converter<String, Time> {

    @Override
    public Time convert(String source) {
        if (source == null || source.isEmpty()) {
            return null;
        }
        try {
            LocalTime localTime = LocalTime.parse(source);
            return Time.valueOf(localTime);
        } catch (DateTimeParseException e) {
            // Manejar la excepción si es necesario
            return null;
        }
    }
}
