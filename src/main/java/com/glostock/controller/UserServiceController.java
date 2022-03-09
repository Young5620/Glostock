package com.glostock.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.glostock.command.CalVO;
import com.glostock.command.PortfolioVO;
import com.glostock.service.PortfolioService;

@Controller
@RequestMapping("/user/*")
public class UserServiceController {
	
	@Autowired
	private PortfolioService service;
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
	
	@RequestMapping("/service") //계산기 유저서비스 화면
	public String service() {
		return "user/service";	
	}

	@RequestMapping("ipoForm") //공모주계산기
	public String ipoForm(Model model, CalVO vo) {  
		
		
		model.addAttribute("ipoForm", vo);
		
		return "user/service";
		
	} 
	
	@RequestMapping("divForm") //배당률계산기
	public String divForm(Model model, CalVO vo) {  
	
		
		model.addAttribute("divForm", vo);
		
		return "user/service";
		
	} 
	
	@RequestMapping("compoundForm") //복리수익률계산기
	public String compoundForm(Model model, CalVO vo) {  
		
		
		model.addAttribute("compoundForm", vo);
		
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
	
	@RequestMapping("/portfolio_insert")
	public String portfolio_insert(@RequestParam("pfname") String pfname,
					@RequestParam("ticker") String ticker,
					@RequestParam("transaction") String transaction,
					@RequestParam("shares") String shares,
					@RequestParam("nickname") String nickname,
					@RequestParam("price") String price,
					RedirectAttributes RA,
					Model model) {
		int result = service.insertPort(pfname, ticker, transaction, shares, nickname, price);
		if(result==1) {
			RA.addAttribute("pfname", pfname);
			return "user/portfolio_insert";
		} else {
			return "redirect:/user/portfolio";
		}
	}
	
	@RequestMapping("/portfolio_result")
	public String portfolio_result(Model model) {
		System.out.println("==controller==");
		
		ArrayList<PortfolioVO> DB = service.getList();
		
		model.addAttribute("port", DB);
		
		return "user/portfolio_result";
	}
	
	@RequestMapping("/delete")
	public String pf_delete(@RequestParam("pfname") String pfname) {
		System.out.println("==controller==");
		System.out.println("포트폴리오 이름 : " + pfname);
		service.delete(pfname);
		
		return "redirect:/user/portfolio";
	}

}
