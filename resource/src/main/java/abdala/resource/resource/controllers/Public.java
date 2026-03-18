package abdala.resource.resource.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/public")
public class Public {

    @GetMapping
    public String sayPublic(){
        return "PUBLIC RESOURCE";
    }
}
