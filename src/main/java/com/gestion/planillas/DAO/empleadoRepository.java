package com.gestion.planillas.DAO;

import com.gestion.planillas.modelos.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface empleadoRepository extends JpaRepository<Empleado, Long> {
	boolean existsByNumeroDoc(String numeroDoc);
	boolean existsByNit(String nit);
	boolean existsByIsss(String isss);
	boolean existsByNup(String nup);
	boolean existsByCorreoInstitucional(String correoInstitucional);
	boolean existsByCorreoPersonal(String correoPersonal);
}
