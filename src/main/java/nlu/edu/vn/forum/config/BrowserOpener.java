package nlu.edu.vn.forum.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.awt.*;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;

@Component
public class BrowserOpener {

    @Value("${server.port}")
    private int serverPort;

    @Value("${server.servlet.context-path}")
    private String contextPath;

    @PostConstruct
    public void init() throws IOException, URISyntaxException {
        String url = String.format("http://localhost:%d%s", serverPort, contextPath);
        if (Desktop.isDesktopSupported()) {
            Desktop.getDesktop().browse(new URI(url));
        }
    }
}
