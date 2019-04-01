package andrzej.appdemo.controller;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.entityexp.ExpertService;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;


@Controller
public class FileUploadController {
    public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/images";

    @Autowired
    UserService userService;
    @Autowired
    ExpertService expertService;



    @RequestMapping("/photo/{expert_id}")
    public String UploadPage(@PathVariable("expert_id") int expert_id, Model model){
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Expert expert = new Expert();
        expert = expertService.getExpertByIdEquals(expert_id);

        if(expert.getUser_id()==user.getId())
        model.addAttribute(expert_id);
        return "uploadview";
    }

    @RequestMapping("/upload/{expert_id}")
    public String upload(Model model, @RequestParam("files") MultipartFile[] files,
                         @PathVariable("expert_id") int expert_id) throws IOException {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        StringBuilder fileNames = new StringBuilder();
        for(MultipartFile file : files){
            Path fileNameAndPath = Paths.get(uploadDirectory, expert_id+".jpg");
            fileNames.append(file.getOriginalFilename());
            System.out.println(file);

            try{
                Files.write(fileNameAndPath, file.getBytes());
                byte[] fileContent = FileUtils.readFileToByteArray(new File("C:\\RW\\git\\appPot\\src\\main\\resources\\static\\images\\"+expert_id+".jpg"));
                String encodedString = Base64.getEncoder().encodeToString(fileContent);
                System.out.println(encodedString);
                expertService.updatePhoto(expert_id,encodedString);
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        model.addAttribute("msg", "Successfully uploaded files"+fileNames.toString());
        return "uploadstatusview";
    }


}
