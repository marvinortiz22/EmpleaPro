package com.gestion.planillas.DaoImpl;

import com.gestion.planillas.modelos.Permiso;
import com.gestion.planillas.modelos.Usuario;
import com.gestion.planillas.DAO.usuarioDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private usuarioDAO usuarioDAO;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario=usuarioDAO.getUsuarioPorUsername(username);
        User.UserBuilder builder=null;
        if (usuario!=null){
            builder=User.withUsername(username);
            builder.disabled(false);
            builder.password(usuario.getPassword());
            //builder.authorities(new SimpleGrantedAuthority("ROLE_USER"));
            builder.authorities(mapearRoles(usuarioDAO.getPermisosDeUsuario(usuario.getIdUsuario())));
        }else{
            throw new UsernameNotFoundException("usuario no encontrado");
        }

        return builder.build();
    }

    private Collection<? extends GrantedAuthority> mapearRoles(List<Permiso> permisos){
        return permisos.stream().map(rol->new SimpleGrantedAuthority(rol.getNombrePermiso())).collect(Collectors.toList());

    }
}
