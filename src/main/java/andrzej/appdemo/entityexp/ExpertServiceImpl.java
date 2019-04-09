package andrzej.appdemo.entityexp;


import andrzej.appdemo.admin.AdminServiceImpl;
import andrzej.appdemo.comment.Comment;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserRepository;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("expertService")
@Transactional
public class ExpertServiceImpl implements ExpertService {

    private static final Logger LOG = LoggerFactory.getLogger(AdminServiceImpl.class);


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

    @Override
    public Expert getExpert() {
        return null;
    }

    @Override
    public Expert getExpertByIdEquals(int expert_id) {
        Expert expert = expertRepository.getExpertByIdEquals(expert_id);
        return expert;
    }


    @Override
    public boolean addComment(Comment comment) {

        return false;
    }

    @Override
    public void updatePhoto(int expert_id, String image_url) {
        Expert expert = expertRepository.getExpertByIdEquals(expert_id);
        expert.setImage_url(image_url);

    }

    @Override
    public List<Expert> getExpertWhereUserId(int user_id) {
        List<Expert> expertList = expertRepository.getExpertWhereUserId(user_id);
        return expertList;
    }

    @Override
    public void deleteExpertById(int id) {
        LOG.debug("[WYWOŁANIE >>> ExpertServiceImpl.deleteExpertById > PARAMETR: " + id);
        expertRepository.deleteExpertFromCommentsExperts(id);
        expertRepository.deleteExpert(id);

    }


}
