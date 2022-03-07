package com.glostock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.glostock.command.PortfolioVO;

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
		return "user/feed";
	}

	@RequestMapping("/follow")
	public String follow() {
		return "user/follow";
	}

	@RequestMapping("/write")
	public String write() {
		return "user/write";
	}

	@RequestMapping("/portfolio")
	public String portfolio() {
		return "user/portfolio";
	}
	
	@RequestMapping("/service")
	public String service() {
		return "user/service";
	}

	@RequestMapping("/crypto")
	public String crypto() {
		return "user/crypto";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}

	
	@RequestMapping("/calculator") 
	public String calculator() {  
		return "user/calculator"; 
		
	} 
	
	@RequestMapping("/portfolio_result")
	public String portfolio_result(@RequestParam("pf_name") String pf_name, Model model) {
		System.out.println("==controller==");
		System.out.println("포트폴리오 이름 : " + pf_name);
		PortfolioVO vo = new PortfolioVO();
		vo.setPf_name(pf_name);
		model.addAttribute("port", vo);
		return "user/portfolio_result";
	}
	
	@RequestMapping("/delete")
	public String pf_delete(@RequestParam("pf_name") String pf_name) {
		System.out.println("==controller==");
		System.out.println("포트폴리오 이름 : " + pf_name);
		//기능구현해야함!
		return "redirect:/user/portfolio";
	}

}
