package com.gestion.planillas;

import com.gestion.planillas.DaoImpl.UserDetailServiceImpl;
import com.gestion.planillas.DaoImpl.UsuarioDAOImpl;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.web.filter.CorsFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import javax.sql.DataSource;
import java.util.Arrays;

@Configuration
@EnableWebSecurity
/*@EnableMethodSecurity(
        prePostEnabled = false, jsr250Enabled = true
)*/
public class SecurityConfiguration {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http, AuthenticationManagerBuilder auth) throws Exception {

        http.authorizeHttpRequests(request -> request
                        .requestMatchers("/images/**", "/css/**", "/js/**", "/WEB-INF/jsp/**","/registro").permitAll()
                        .requestMatchers("/usuarioEjemplo/rolusuario").hasRole("VER_USUARIOS")
                        .anyRequest().authenticated())
                .formLogin(form->form
                .loginPage("/login")
                .permitAll()
                .defaultSuccessUrl("/usuarioEjemplo/listar"))
                .logout(logout->logout
                        .permitAll()
                        .logoutUrl("/logout"));
        http.exceptionHandling(exception->exception
                .accessDeniedPage("/error"));



        return  http.build();

    }



    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }





}
