package com.DAO;

import com.entity.User;

public interface UserDAO {
	
	public int userRegister(User u);
	
	
	
	public boolean updateProfile(User u);
	
	public int getRegisteredCount();
	
	
	public boolean checkEmail(String email);
	
	public User getUserByEmail(String email);
}
