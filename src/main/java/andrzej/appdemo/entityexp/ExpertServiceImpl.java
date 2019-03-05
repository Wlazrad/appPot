package andrzej.appdemo.entityexp;


import andrzej.appdemo.user.Role;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserRepository;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service("expertService")
@Transactional
public class ExpertServiceImpl implements ExpertService {


    @Autowired
    private ExpertRepository expertRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void saveExpert(Expert expert) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        user.setExpert(expert);
        expertRepository.save(expert);
    }

    @Override
    public List<Expert> findAll() {
        List<Expert> expertList = expertRepository.findAll();
        return expertList;
    }

    @Override
    public List<Expert> findAllSearch(String param) {
        List<Expert> expertList = expertRepository.findAllSearch(param);
        return expertList;
    }


}
