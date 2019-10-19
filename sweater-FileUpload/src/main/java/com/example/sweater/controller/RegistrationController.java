package com.example.sweater.controller;

import com.example.sweater.domain.User;
import com.example.sweater.domain.dto.CaptchaResponseDto;
import com.example.sweater.service.UserSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    private static final String captchaUrl = "https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";

    @Autowired
    private UserSevice userService;

    @Autowired
    private RestTemplate restTemplate;

    @Value("${recaptcha.secret}")
    private String secret;

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("passwordСonfirmation") String passwordСonfirmation,
            @RequestParam("g-recaptcha-response") String captchaResp,
            @Valid User user,
            BindingResult bindingResult,
            Model model) {

        String url = String.format(captchaUrl, secret, captchaResp);
        CaptchaResponseDto responseDto = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);
        if(!responseDto.isSuccess()){
            model.addAttribute("captchaError","Fill captcha!");
        }
        boolean isPasswordConfEmpty = passwordСonfirmation.isEmpty();
        if (isPasswordConfEmpty) {
            model.addAttribute("passwordСonfirmationError","Password confirmation can not be empty!");
        }

        if (user.getPassword() != null && !user.getPassword().equals(passwordСonfirmation)){
            model.addAttribute("message", "Password are different!");
        }
        if(isPasswordConfEmpty || bindingResult.hasErrors() || !responseDto.isSuccess()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }
        if (!userService.addUser(user)) {
            model.addAttribute("usernameError", "User exists!");
            return "registration";
        }

        return "redirect:/login";
    }

    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){

        boolean isActivated = userService.activateUser(code);
        if(isActivated){
            model.addAttribute("message", "Activation successful!");
            model.addAttribute("messageType", "success");
        }
        else{
            model.addAttribute("message", "Activation code is not found!");
            model.addAttribute("messageType", "danger");
        }
        return "login";
    }

}
