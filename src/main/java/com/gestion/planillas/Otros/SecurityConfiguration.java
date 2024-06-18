package com.gestion.planillas.Otros;

import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, AuthenticationManagerBuilder auth) throws Exception {

        http.authorizeHttpRequests(request -> request
                        .requestMatchers("/images/**", "/css/**", "/js/**", "/WEB-INF/jsp/**","/registro","/login/**","/error/**").permitAll()
                        //.requestMatchers("/usuarioEjemplo/rolusuario").hasAuthority("ROLE_Ver_usuarios")
                        .anyRequest().authenticated())
                .formLogin(form->form
                .loginPage("/login")
                .permitAll()
                .defaultSuccessUrl("/home")
                        .failureHandler(authenticationFailureHandler()))
                .logout(logout->logout
                                .logoutUrl("/logout")
                                .logoutSuccessUrl("/login")
                                .permitAll());
        http.exceptionHandling(exception->exception
                .accessDeniedPage("/error"));



        return  http.build();

    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new CustomAuthenticationFailureHandler();
    }
    @Bean
    StringToPermisoConverter stringToPersonConverter() {
        return new StringToPermisoConverter();
    }
    @Bean
    StringToProfesionConverter stringToProfesionConverterConverter() {
        return new StringToProfesionConverter();
    }

    @Bean
    StringToSqlTimeConverter stringToSqlTimeConverter(){return new StringToSqlTimeConverter();}
}
