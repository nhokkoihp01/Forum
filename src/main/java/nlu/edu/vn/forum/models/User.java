package nlu.edu.vn.forum.models;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class User {
    private String username;
    private String password;
    private String email;
    private Date joinDate;

    public User(String username, String password, String email,
                Date joinDate) {
        super();
        this.username = username;
        this.password = password;
        this.email = email;
        this.joinDate = joinDate;
    }


}
