package org.Lee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.Lee.domain.MemberDTO;
import org.Lee.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/member" , method = RequestMethod.GET)
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService mservice;
	//회원 가입 페이지
	@PostMapping("/join")
	public void getWrite() {
		
	}
	//회원가입 정보 입력
	@PostMapping("/joinPost")
	public String postWrite(MemberDTO mdto) throws Exception {
		mservice.member(mdto);
		return "redirect:/main";
	}
	//아이디 중복 체크 (회원가입)
	@RequestMapping(value="/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String id) throws Exception{
		logger.info("memberidchk() 진입");		
		int result = mservice.idCheck(id);	
		logger.info("결과값 =" + result);
		
		if(result != 0 ) {
			return "fail"; //중복 아이디가 존재
		}else {
			return "success"; //중복아이디 X
		}
	}
	//닉네임 중복 체크 (회원가입)
	@RequestMapping(value="/memberNicChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberNicChkPOST(String nicname) throws Exception{
		logger.info("membernicchk() 진입");	
		int result = mservice.nicCheck(nicname);		
		logger.info("결과값 =" + result);
		
		if(result != 0 ) {
			return "fail"; //중복 닉네임가 존재
		}else {
			return "success"; //중복닉네임X
		}
	}
	//로그인 페이지
	@GetMapping("/login")
	public void loginGet() {
		
	}
	 /* 로그인 */
	 @RequestMapping(value="/loginPost", method=RequestMethod.POST)
	 public String loginPOST(HttpServletRequest request, MemberDTO mdto, RedirectAttributes rttr) throws Exception{	        
	        /*System.out.println("login 메서드 진입");
	        System.out.println("전달된 데이터 : " + mdto);*/	 
		 
		 HttpSession session = request.getSession();
		 MemberDTO ldto = mservice.memberLogin(mdto);
		 if(ldto == null) {                                // 일치하지 않는 아이디, 비밀번호 입력 경우
	            
	            int result = 0;
	            rttr.addFlashAttribute("result", result);
	            return "redirect:/member/login";	            
	        }	        
	        session.setAttribute("member", ldto);  
	        logger.info("전달된 데이터 : " + ldto);    // 일치하는 아이디, 비밀번호 경우 (로그인 성공)	        
	        return "redirect:/main";	               
	 }
	 //로그아웃
	 @PostMapping("/logout")
	 public String logoutPost(HttpServletRequest request) throws Exception {
		 HttpSession session = request.getSession();        
	     session.invalidate();	   
	     logger.info("로그아웃");
	     return "redirect:/main"; 		 
	 }
	 // 회원정보 
	@GetMapping("/profile")
	 public void profileGet(HttpSession session, Model model) throws Exception {
		 		    
	 }
	//회원정보 수정페이지
	@GetMapping("/modify")
	public void profileModify(HttpSession session, Model model) throws Exception {
			
	}
	
	//회원수정 
	@PostMapping("/modifyPost")
	public String updateMember(MemberDTO mdto, HttpSession session, Model model) throws Exception {				 		
		mservice.updateMember(mdto);
		if(mdto.getName() != null &&mdto.getNicname() != null &&mdto.getPw() != null) {
			session.setAttribute("member", mdto);
			logger.info("수정된 데이터값 : " + mdto);
			return "redirect:/main";
		}else {		    
		    logger.info("수정된 데이터값 : " + mdto);
			return "redirect:/member/profile";
		}				
	}
	//회원 탈퇴
	@PostMapping("/deletePost")
	public String deleteMember(MemberDTO mdto, HttpSession session, Model model) throws Exception {
		MemberDTO ldto =(MemberDTO)session.getAttribute("member");		
		mservice.deleteMember(ldto);
		logger.info("삭제된 데이터 값 : " + ldto);
		session.invalidate();
		logger.info("회원탈퇴");
		return "redirect:/main";
	}
	
	
	
}
