/*
 * LoginController.java
 * - 구직자, 구인자, 관리자 로그인을 컨트롤
 */
package com.sist.chodangi.common;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.chodangi.admin.AdminDTO;
import com.sist.chodangi.admin.IAdminDAO;
import com.sist.chodangi.poster.IPosterDAO;
import com.sist.chodangi.poster.PosterDTO;
import com.sist.chodangi.poster.PosterLogDTO;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 폼 요청 페이지
	// 만약 memberType이 없다면 seeker의 로그인 페이지로
	// 만약 이미 로그인이 되어 있다면 되어있는 곳으로
	@RequestMapping(value = "/loginform.action")
	public String loginForm(String memberType, HttpSession session)
	{
		String result = "";
		if (session.getAttribute("seeker") != null)
			result = "redirect:seekermainpage.action";
		else if (session.getAttribute("poster") != null)
			result = "redirect:postermainpage.action";
		else if (session.getAttribute("admin") != null)
			result = "redirect:adminlogin.action";
		else if (memberType == null)
			result = "/seeker/LoginForm";
		else
			result = "/" + memberType + "/LoginForm";

		return result;
	}
	
	
	// 구인자 회원가입 폼 요청 페이지
	@RequestMapping(value = "postersignupform.action")
	public String posterSignupForm()
	{
		String result = "";
		
		result = "/poster/SignupForm";
		
		return result;
	}
	
	// 구인자 아이디 찾기 폼 요청 페이지
	@RequestMapping(value = "posterfindidform.action")
	public String posterFindIdForm()
	{
		String result = "";
		
		result = "/poster/FindIdForm";
		
		return result;
	}
	
	// 구인자 비밀번호 변경 폼 요청 페이지
	@RequestMapping(value = "posterchangepwform.action")
	public String posterChangePwForm()
	{
		String result = "";
		
		result = "/poster/ChangePwForm";
		
		return result;
	}
	
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
		IPosterDAO dao = sqlSession.getMapper(IPosterDAO.class);
		String result = "";
		
		Integer p_id = (Integer)session.getAttribute("poster");
		
		if (p_id != null) 
		{
	        PosterDTO dto = dao.posterMypage(p_id);

	        PosterLogDTO pldto = new PosterLogDTO();
	        pldto.setP_id(dto.getP_id());

	        dao.PosterLogInsert(pldto);
	    }
		
		session.invalidate();
		
		result = "redirect:loginform.action";
		
		return result;
	}
}
