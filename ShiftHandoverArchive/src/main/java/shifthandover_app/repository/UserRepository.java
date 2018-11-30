package shifthandover_app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import shifthandover_app.model.User;



public interface UserRepository extends JpaRepository<User, Long>{

	@Query(value="SELECT role from shifthandover.user where user.racfid=?1",nativeQuery=true)
	public String getUserRoleByracfID(String racfID);
	
	public User getUserByracfID(String racfID);
	
}
