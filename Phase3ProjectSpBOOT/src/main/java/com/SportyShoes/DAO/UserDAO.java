package com.SportyShoes.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.SportyShoes.MODELS.User;

public interface UserDAO extends CrudRepository<User, Integer>{
	
	@Query("select u from User u where u.username=:username and u.password=:password")
	public User loginCheck(@Param("username") String username,@Param("password") String password);
	
	@Query(value = "select * from user where user.user_type=:usertype",nativeQuery = true)
	public List<Object[]> getUserbyUserType(@Param("usertype") String admin_or_customer);

	@Query(value = "select * from user where user.user_type=:usertype",nativeQuery = true)
	public List<User> getUserbyType(@Param("usertype") String admin_or_customer);
	
	@Query(value = "select * from user where user.username=:usrname and user.user_type='customer'",nativeQuery = true)
	public User getCustomerbyusername(@Param("usrname") String username);
	
	@Query(value = "select * from user where user.phonenumber like :phno and user.user_type='customer'",nativeQuery = true)
	public List<User> getCustomerbyphoneNo(@Param("phno") String phoneNo);
	
	@Query(value = "select * from user where user.user_Realname like :rname and user.user_type='customer'",nativeQuery = true)
	public List<User> getCustomerbyName(@Param("rname") String realname);
	
}
