/*
 * LoginController.java
 * - 구직자, 구인자, 관리자 로그인을 컨트롤
 */
package com.sist.chodangi;

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
	
	@RequestMapping(value = "loginform.action")
	public String loginForm(String memberType)
	{
		String result = "";
		if (memberType == null)
			result = "/seeker/LoginForm";
		else
			result = "/" + memberType + "/LoginForm";

		return result;
	}
	
	@RequestMapping(value = "adminlogin.action", method = RequestMethod.POST)
	public String login(AdminDTO admin)
	{
		String result = "";
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		int loginResult =  dao.login(admin);
		
		if (loginResult == 1)
			result = "/admin/Main";
		else
		{
			result = "redirect:loginform.action?memberType=admin";
		}
		
		
		return result;
	}
}
