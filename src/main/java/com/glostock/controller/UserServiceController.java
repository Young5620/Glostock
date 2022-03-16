package com.glostock.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.glostock.model.BoardVO;
import com.glostock.model.FollowVO;
import com.glostock.model.PortfolioVO;
import com.glostock.model.StockVO;
import com.glostock.service.BoardService;
import com.glostock.service.FollowService;
import com.glostock.service.PortfolioService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.glostock.command.CalVO;
import com.glostock.model.UserVO;
import com.glostock.service.UserService;
import yahoofinance.Stock;
import yahoofinance.YahooFinance;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user/*")
public class UserServiceController {

	@Autowired
	private UserService service;

	@Autowired
	private FollowService followService;

	@Autowired
	private PortfolioService portservice;
	
	@Autowired
	private BoardService boardservice;
	
	//로그인페이지
	@RequestMapping("/login")
	public String login() { 
		return "user/login"; 
	}
	
	//로그인폼
	@RequestMapping("/loginForm")
	public String loginForm(UserVO vo, HttpSession session, RedirectAttributes RA) {

		int result = service.login(vo);
		
		if (result==1) {//로그인성공(세션생성)

			session.setAttribute("user_email", vo.getEmail());
			session.setAttribute("user_password", vo.getPassword());

			return "redirect:/user/feed"; 
		
		} else { //로그인 실패 
			RA.addFlashAttribute("msg","아이디 비밀번호를 확인하세요");

			return "redirect:/user/login";
		} 

	}  
	
	//회원가입화면
	@RequestMapping("/join")
	public String join() {  
		return "user/join";
	}
	//회원가입폼
	@RequestMapping("/joinForm")
	public String joinForm(UserVO vo, RedirectAttributes RA ) {
	
		//서비스로 join을 처리해야함.
		int result = service.join(vo);
	
		if (result ==1) {  //1반환시 성공
			RA.addFlashAttribute("msg","회원가입에 성공했습니다.");

			return "redirect:/user/join_result";  
			
		} else { 		//insert 실패 
			RA.addFlashAttribute("msg","회원가입에 실패했습니다.");

			return "redirect:/user/join"; 
		}

	}
	//회원가입 성공처리
	@RequestMapping("/join_result")
	public String join_result() { 

		return "user/join_result";
		
	} 
	
	//유저피드화면
	@RequestMapping("/feed")
	public String feed(HttpSession session, Model model,BoardVO vo) {
		if (session.getAttribute("user_email")==null) { 
			return "redirect:/user/login"; }
			
			else { 
				
				ArrayList<BoardVO> list = boardservice.getfeed();
		
				model.addAttribute("feed", list);
		
		return "user/feed";
		}
	}

	
	//내게시글확인
	@RequestMapping("/myfeed")
	public String myfeed(HttpSession session,Model model) { 

		session.getAttribute("user_email");
		session.getAttribute("user_password");
		String user_email= (String)session.getAttribute("user_email");
		
	
		
		BoardVO vo=boardservice.mypage(user_email);
	
		String nickname= (String)vo.getNickname();
		ArrayList<BoardVO> list = boardservice.myfeed(nickname);
		
		
		
		model.addAttribute("feed", list);
		
		
		
		return "user/myfeed";
		
	} 
	
	
	//피드쓰기화면
	@RequestMapping("/write")
	public String write(HttpSession session, Model model )  { 
	
		if (session.getAttribute("user_email")==null) { 
		return "redirect:/user/login"; }
		
		else { 
			session.getAttribute("user_email");
			session.getAttribute("user_password");
			String user_email= (String)session.getAttribute("user_email");
			
			BoardVO vo=boardservice.mypage(user_email);
			model.addAttribute("mypage", vo);
			
		
		return "user/write";
		
		}
		}
	
	//피드폼처리	
	@RequestMapping("feedRegister")
	public String feedRegister(BoardVO vo ) { 
		
		boardservice.insertfeed(vo);
		
	
		return "redirect:/user/feed";
	} 
	
	
	
	
	
	@RequestMapping("/follow")
	public String follow(HttpSession session) {

		String nickname = "TestNickname";

		ArrayList<FollowVO> followList = followService.getFollowList(nickname);

		ArrayList<StockVO> returnFollowList = new ArrayList<StockVO>();
		for (FollowVO tempFollowVO : followList) {
			String stockTicker = tempFollowVO.getTicker();
			StockVO tempVO = new StockVO();
			tempVO.setTicker(stockTicker);
			Stock tempStock = null;
			try {
				tempStock = YahooFinance.get("TSLA");
			} catch (Exception e) {
				System.out.println("Could not recognise the ticker symbol. Try again.");
				e.printStackTrace();
			}
			tempVO.setCurrent_price(tempStock.getQuote().getPrice().doubleValue());
			tempVO.setName(tempStock.getName());
			tempVO.setChange_in_percentage(tempStock.getQuote().getChangeInPercent().doubleValue());
			tempVO.setPrev_close_price(tempStock.getQuote().getPreviousClose().doubleValue());
			returnFollowList.add(tempVO);
		}
		session.setAttribute("follow_list", returnFollowList);

		return "user/follow";
	}

	@RequestMapping("/addFollow")
	public String addFollow(@RequestParam("ticker") String ticker, HttpSession session) {

		String nickname = "TestNickname";

		followService.follow(nickname, ticker);

		return "redirect:/user/follow";
	}

	@RequestMapping("/deleteFollow")
	public String deleteFollow(@RequestParam("ticker") String ticker, HttpSession session) {

		String nickname = "TestNickname";

		System.out.println("deleteFollow Checkpoint");
		followService.unfollow(nickname, ticker);

		return "redirect:/user/follow";
	}

	

	@RequestMapping("/portfolio")
	public String portfolio(HttpSession session) {
		String user_email = (String)session.getAttribute("user_email");
		BoardVO vo = boardservice.mypage(user_email);
		
		String nickname= (String)vo.getNickname();
		session.setAttribute("nickname", nickname);
		return "user/portfolio";
	}
	
	@RequestMapping(value="/portfolio_insert",method=RequestMethod.POST)
	public String portfolio_insert(HttpServletRequest request,HttpSession session) {
		
		PortfolioVO vo = new PortfolioVO();
		
		//form태그에서 row별로 이름을 배열로 받음
		String[] ticker = request.getParameterValues("ticker");
		String[] transaction = request.getParameterValues("transaction");
		String[] shares = request.getParameterValues("shares");
		String[] price = request.getParameterValues("price");

		//배열의 인덱스를 for문으로 돌려서 인덱스 별로 vo에 저장 그리고 서비스로
		for(int i=0;i<ticker.length;i++) {
			System.out.println("==컨트롤러==");
			System.out.println("ticker : "+ticker[i]);
			vo.setTicker(ticker[i]);
			System.out.println("transaction : " + transaction[i]);
			vo.setTransaction(transaction[i]);
			System.out.println("shares : "+shares[i]);
			vo.setShares(shares[i]);
			System.out.println("price : "+price[i]);
			vo.setPrice(price[i]);
			
			String nickname = request.getParameter("nickname");		
			System.out.println("nickname : "+nickname);
			vo.setNickname(nickname);
			String pfname = request.getParameter("pfname");
			vo.setPfname(pfname);

			portservice.insertPort(vo);
			
		}
		//세션에 포트폴리오 이름 저장 (result에 기준값 넘기기 위해서)
		session.setAttribute("pfname", request.getParameter("pfname"));
		
		return "user/portfolio_insert";
		
	}
	
	@RequestMapping(value="/portfolio_result",method=RequestMethod.POST)
	public String portfolio_result(HttpSession session, PortfolioVO vo,Model model) {
		System.out.println("==controller==");
		String pfname = (String)session.getAttribute("pfname");
		System.out.println("pfname : " + pfname);
		ArrayList<PortfolioVO> DB = portservice.getList(pfname);
		model.addAttribute("port", DB);
			
		return "user/portfolio_result";
	}
	
	@RequestMapping(value="/portfolio_result",method=RequestMethod.GET)
	public String portfolio_result(@RequestParam("pfname") String pfname, PortfolioVO vo,Model model) {
		System.out.println("==controller==");
		System.out.println("pfname : " + pfname);
		ArrayList<PortfolioVO> DB = portservice.getList(pfname);
		model.addAttribute("port", DB);
			
		return "user/portfolio_result";
	}
	
	
	@RequestMapping("/portfolio_delete")
	public String pf_delete(HttpSession session) {
		System.out.println("==controller==");
		String pfname = (String)session.getAttribute("pfname");
		System.out.println("포트폴리오 이름 : " + pfname);
		portservice.delete(pfname);
		
		return "redirect:/user/portfolio";
	}
	
	@RequestMapping("/portfolio_list")
	public String portfolio_list(HttpSession session,Model model) {
		System.out.println("==컨트롤러(list)==");
		String nickname = (String)session.getAttribute("nickname");
		
		ArrayList<PortfolioVO> list = portservice.getList_nick(nickname);
		for(PortfolioVO vo:list) {
			session.setAttribute("pfname", vo.getPfname());
		}
		model.addAttribute("list", list);
		return "user/portfolio_list";
	}
	
	@RequestMapping("/service") //계산기 유저서비스 화면
	public String service() {
		return "user/service";	
	}

	@RequestMapping("ipoForm") //공모주계산기
	public String ipoForm(Model model, CalVO vo) {  
		
		
		model.addAttribute("ipoForm", vo);
		
		return "user/service#first";
		
	} 
	
	@RequestMapping("divForm") //배당률계산기
	public String divForm(Model model, CalVO vo) {  
		model.addAttribute("divForm", vo);
		return "user/service#second";
	} 
	
	@RequestMapping("compoundForm") //복리수익률계산기
	public String compoundForm(Model model, CalVO vo) {  
		model.addAttribute("compoundForm", vo);
		return "user/service#third";
		
	} 

	@RequestMapping("/crypto")
	public String crypto() {
		return "user/crypto";
	}
	
	//마이페이지
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
	//세션없을경우 접근불가
		if (session.getAttribute("user_email")==null) { 
		return "redirect:/user/login"; }
		
		else { 
			session.getAttribute("user_email");
			session.getAttribute("user_password");
			String user_email= (String)session.getAttribute("user_email");
			
			
			UserVO vo=service.mypage(user_email);
			model.addAttribute("mypage", vo);
		
		return "user/mypage";
		}
	}
	
	@RequestMapping("/update")
	public String update(HttpSession session, Model model) {
		
		if (session.getAttribute("user_email")==null) { 
			return "redirect:/user/login"; }
			
			else { 
				session.getAttribute("user_email");
				session.getAttribute("user_password");
				String user_email= (String)session.getAttribute("user_email");
				
				UserVO vo=service.mypage(user_email);
				model.addAttribute("mypage", vo);
	
		
		return "user/update"; 
		}
	}
	
	@RequestMapping("/myinfo")
	public String myinfo(HttpSession session, Model model) {
		
		if (session.getAttribute("user_email")==null) { 
			return "redirect:/user/login"; }
			
			else { 
				session.getAttribute("user_email");
				session.getAttribute("user_password");
				String user_email= (String)session.getAttribute("user_email");
				
				UserVO vo=service.mypage(user_email);
				model.addAttribute("mypage", vo);
		
		
		return "user/myinfo"; }
	}
	
	
	
	//비밀번호업데이트화면
	@RequestMapping("/passwordupdate") 
	public String passwordupdate() {
		return "user/passwordupdate";	
	}
	
	
	//내정보수정
	@RequestMapping("updateForm")
	public String updateform(HttpSession session, Model model, UserVO vo) {
		if (session.getAttribute("user_email")==null) { 
			return "redirect:/user/login"; } 
		else { 
		service.update(vo);
	
		model.addAttribute("mypage", vo); 
		
		
		return "redirect:/user/myinfo";
		}
	}
	

	
	
	
	
	
	//비밀번호수정
		@RequestMapping("passwordUpdate")
		public String passwordUpdate(HttpSession session, Model model, @RequestParam ("newpassword") String newpassword  )  {
			if (session.getAttribute("user_email")==null) { 
				return "redirect:/user/login"; } 
			else { 
				UserVO vo= new UserVO(); 
				String user_email= (String)session.getAttribute("user_email");
				vo.setNewpassword(newpassword);
				vo.setEmail(user_email);
				service.passwordchange(vo);
			
		
			
			return "redirect:/user/mypage";
			}
		}

	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {  
		
		session.invalidate(); 
		
		return "redirect:/"; 
	}

	
	
	//비밀번호업데이트화면
	@RequestMapping("/userleave") 
	public String userleave() {
		
		return "user/userleave";	
	}
	
	
	//회원탈퇴
	@RequestMapping("userLeave")
	public String userLeave(HttpSession session, Model model)  {
		if (session.getAttribute("user_email")==null) { 
			return "redirect:/user/login"; } 
		else { 
			
			UserVO vo= new UserVO(); 
			session.getAttribute("user_email");
			session.getAttribute("user_password");
			String user_email= (String)session.getAttribute("user_email");
			String user_password=(String) session.getAttribute("user_password");

			vo.setEmail(user_email);
			vo.setPassword(user_password);
			service.userleave(vo);
		
	
		
		return "redirect:/";
		}
	}
	
	
	
	
	
	
	
	
}
