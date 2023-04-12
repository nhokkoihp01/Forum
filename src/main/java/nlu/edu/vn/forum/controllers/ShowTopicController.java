package nlu.edu.vn.forum.controllers;

import nlu.edu.vn.forum.models.Message;
import nlu.edu.vn.forum.models.Topic;
import nlu.edu.vn.forum.models.User;
import nlu.edu.vn.forum.services.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ShowTopicController {
    @Autowired
    private ForumService forumService;

    @GetMapping("/topic-detail")
    public String index(@RequestParam("id") Integer id, Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        Topic topic = forumService.findTopic(id);
        List<Message> messages = forumService.getAllMessagesByTopicId(id);
        model.addAttribute("messages", messages);
        model.addAttribute("topic", topic);
        return "showTopic";
    }

}
