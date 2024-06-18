package com.gestion.planillas.modelos;
import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;


@Entity
@Table(name = "usuario")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idUsuario;

    @ManyToOne
    @JoinColumn(name = "IDROL")
    private Rol rol;

	@Transient
	private String oldRolNombre;
	private String username;
	private String email;

	@Size(min = 8, message = "La contraseña debe tener al menos 8 caracteres")
	@Pattern.List({
			@Pattern(regexp = "(?=.*[0-9]).+", message = "La contraseña debe contener al menos un número"),
			@Pattern(regexp = "(?=.*[a-zA-Z]).+", message = "La contraseña debe contener al menos una letra"),
			//@Pattern(regexp = "(?=.*[A-Z]).+", message = "La contraseña debe contener al menos una letra mayúscula"),
			@Pattern(regexp = "(?=.*[@#$%^&+=*_/]).+", message = "La contraseña debe contener al menos un símbolo especial"),
		}
	)
    private String password;
	@Transient
	private String password2;

    private boolean estado=true;
    private int intentosLogin;

	private boolean solicitoDesbloqueo=false;
    
	public Usuario() {
		super();
	}

	public Usuario(int idUsuario, Rol rol,String username, String email, String password, boolean estado, int intentosLogin,boolean solicitoDesbloqueo) {
		this.idUsuario = idUsuario;
		this.rol = rol;

		this.username = username;
		this.email = email;
		this.password = password;

		this.estado = estado;
		this.intentosLogin = intentosLogin;
		this.solicitoDesbloqueo=solicitoDesbloqueo;
	}

	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}

	public String getOldRolNombre() {
		return oldRolNombre;
	}

	public void setOldRolNombre(String oldRolNombre) {
		this.oldRolNombre = oldRolNombre;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public int getIntentosLogin() {
		return intentosLogin;
	}
	public void setIntentosLogin(int intentosLogin) {
		this.intentosLogin = intentosLogin;
	}

	public boolean isSolicitoDesbloqueo() {
		return solicitoDesbloqueo;
	}

	public void setSolicitoDesbloqueo(boolean solicitoDesbloqueo) {
		this.solicitoDesbloqueo = solicitoDesbloqueo;
	}

}
