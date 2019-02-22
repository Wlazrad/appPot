package andrzej.appdemo.entityexp;


import andrzej.appdemo.user.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.HashSet;

@Service("expertService")
@Transactional
public class ExpertServiceImpl implements ExpertService {


    @Autowired
    private ExpertRepository expertRepository;

    @Override
    public void saveExpert(Expert expert) {
        expertRepository.save(expert);
    }
}
