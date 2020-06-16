package andrzej.appdemo.user;

import java.util.List;

public interface UserService {
	
	public User findUserByEmail(String email);
	public void saveUser(User user);
	public void updateUserPassword(String newPassword, String email);
	public void updateUserProfile(String newName, String newLastName, String newEmail, int id);
	public List<User> findAll();
	User findByUserName(String userName);
	User getUserByIdEquals(int id);
	public void updateUserActivation(int activeCode, String activationCode);


}
