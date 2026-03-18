package abdala.client.client.controllers;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

    @GetMapping("/")
    public String publicPage() {
        return "public page";
    }

    @GetMapping("/private")
    public String privatePage(@AuthenticationPrincipal OAuth2User user) {
        return "Olá " + user.getName();
    }

    @GetMapping("/token")
    public String privatePage(@RegisteredOAuth2AuthorizedClient("web-client-oidc") OAuth2AuthorizedClient authorizedClient,
                              @AuthenticationPrincipal OAuth2User user,
                              Model model) {
        model.addAttribute("user", user.getAttributes());
        model.addAttribute("token", authorizedClient.getAccessToken().getTokenValue());
        return model.toString();
    }
}