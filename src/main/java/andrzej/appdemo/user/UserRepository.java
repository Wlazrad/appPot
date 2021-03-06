package andrzej.appdemo.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Integer> {

    public User findByEmail(String email);

    @Modifying
    @Query("UPDATE User u SET u.password = :newPassword WHERE u.email= :email")
    public void updateUserPassword(@Param("newPassword") String password, @Param("email") String email);

    @Modifying
    @Query("UPDATE User u SET u.name = :newName, u.lastName = :newLastName, u.email = :newEmail WHERE u.id= :id")
    public void updateUserProfile(@Param("newName") String newName, @Param("newLastName") String newLastName,
                                  @Param("newEmail") String newEmail, @Param("id") Integer id);


    @Query(value = "SELECT *FROM User u WHERE user_id =:id", nativeQuery = true)
    User getUserByIdEquals(@Param("id") int id);

    @Modifying
    @Query("UPDATE User u SET u.active =:activeParam WHERE u.activationCode =:activationCode")
    public void updateActivation(@Param("activeParam") int activeParam, @Param("activationCode") String activationCode);


//    @Query(value = "INSERT INTO `role` VALUES (1,'ROLE_ADMIN');" +
//            "INSERT INTO `role` VALUES (2,'ROLE_USER')", nativeQuery = true)
//    public void insertRole();





}



