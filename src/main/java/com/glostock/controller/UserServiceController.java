package com.glostock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/*")
public class UserServiceController {

	//로그인페이지
	@RequestMapping("/login")
	public String login() { 
		return "user/login"; 
	}
	
	@RequestMapping("/join")
	public String join() {  
		return "user/join";
	}

	@RequestMapping("/feed")
	public String feed() { 
		
		return "user/feed";}
	
	
	
	
}
