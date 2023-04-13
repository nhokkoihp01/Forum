package nlu.edu.vn.forum.models;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Calendar;

@Getter
@Setter
@NoArgsConstructor
public abstract class Entry {
    private String title;
    private String content;
    private Calendar createdTime;
    private User creator;

    public Entry(String title, String content, User creator) {
        this.title = title;
        this.content = content;
        this.creator = creator;
        createdTime = Calendar.getInstance();
    }

}

