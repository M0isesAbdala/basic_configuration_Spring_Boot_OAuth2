package abdala.client.client.controllers;

import abdala.client.client.service.ApiService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApiController {

    private final ApiService apiService;

    public ApiController(ApiService apiService) {
        this.apiService = apiService;
    }

    @GetMapping("/call-resource")
    public String callResource() {
        return apiService.getPrivateData();
    }
}