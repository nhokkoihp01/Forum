package nlu.edu.vn.forum.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
//    http://localhost:8080/home
    @GetMapping("/home")
    public String index(){
        return "index";
    }
}
