/*
 * LoginController.java
 * - 구직자, 구인자, 관리자 로그인을 컨트롤
 */
package com.sist.chodangi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 폼 요청 페이지
	// 만약 memberType이 없다면 seeker의 로그인 페이지로
	// 만약 이미 로그인이 되어 있다면 되어있는 곳으로
	@RequestMapping(value = "/loginform.action")
	public String loginForm(String memberType)
	{
		String result = "";
		if (memberType == null)
			result = "/seeker/LoginForm";
		else
			result = "/" + memberType + "/LoginForm";

		return result;
	}
	
	// 구직자 회원가입 폼 요청 페이지
	@RequestMapping(value = "seekersignupform.action")
	public String seekerSignupForm()
	{
		String result = "";
		
		result = "/seeker/SignupForm";
		
		return result;
	}
	
	// 구인자 회원가입 폼 요청 페이지
	
	// 관리자 로그인
	@RequestMapping(value = "/adminlogin.action", method = RequestMethod.POST)
	public String adminLogin(AdminDTO admin, HttpSession session)
	{
		String result = "";
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		int loginResult =  dao.login(admin);
		
		if (loginResult == 1)
		{
			// 로그인 성공
			// 로그인 성공시 관리자임을 증명하는 값을 세션에 남김
			session.setAttribute("admin", "");
			
			result = "redirect:adminmain.action";
		}
		else
		{
			// 로그인 실패
			result = "redirect:loginform.action?memberType=admin";
		}
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.action")
	public String logOut(HttpSession session)
	{
		String result = "";
		
		session.invalidate();
		
		result = "redirect:loginform.action";
		
		return result;
	}
}
