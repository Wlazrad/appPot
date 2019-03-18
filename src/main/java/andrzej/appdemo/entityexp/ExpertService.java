package andrzej.appdemo.entityexp;

import andrzej.appdemo.user.User;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ExpertService {

    public void saveExpert(Expert expert);
    public List<Expert> findAll();
    List<Expert> findAllSearch(String param);
    public Expert getExpert();
    Expert getExpertByIdEquals(int expert_id);
}
