package com.glostock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/*")
public class CompanyController {

    //로그인페이지
    @RequestMapping("/show")
    public String login() {
        return "redirect:/company/show";
    }

}
