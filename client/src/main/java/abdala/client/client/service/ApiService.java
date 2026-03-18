package abdala.client.client.service;

import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;

@Service
public class ApiService {

    private final String resourceHost;

    private final WebClient webClient;

    public ApiService(WebClient webClient, Environment env) {
        this.webClient = webClient;
        this.resourceHost = env.getProperty("RESOURCE_URL");
    }

    public String getPrivateData() {

        return webClient
                .get()
                .uri(resourceHost + "/private")
                .retrieve()
                .bodyToMono(String.class)
                .block();
    }
}