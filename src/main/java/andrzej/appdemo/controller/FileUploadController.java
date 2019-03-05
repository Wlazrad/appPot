package andrzej.appdemo.controller;

import andrzej.appdemo.entityexp.Expert;
import andrzej.appdemo.user.User;
import andrzej.appdemo.user.UserService;
import andrzej.appdemo.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class FileUploadController {
    public static String uploadDirectory = System.getProperty("user.dir")+"/src/main/resources/static/images";

    @Autowired
    UserService userService;



    @RequestMapping("/photo")
    public String UploadPage(Model model){
        return "uploadview";
    }

    @RequestMapping("/upload")
    public String upload(Model model, @RequestParam("files") MultipartFile[] files){
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        StringBuilder fileNames = new StringBuilder();
        for(MultipartFile file : files){
            Path fileNameAndPath = Paths.get(uploadDirectory, user.getExpert().getId()+".jpg");
            fileNames.append(file.getOriginalFilename());
            try{
                Files.write(fileNameAndPath, file.getBytes());
            }catch (IOException e){
                e.printStackTrace();
            }
        }
        model.addAttribute("msg", "Successfully uploaded files"+fileNames.toString());
        return "uploadstatusview";
    }


}
