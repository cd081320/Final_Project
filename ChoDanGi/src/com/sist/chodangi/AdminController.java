/*
 * AdminController.java
 */
package com.sist.chodangi;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "adminmain.action")
	public String mainPage(HttpSession session)
	{
		String result = "";
		
		if (session.getAttribute("admin") == null)
		{
			// 세션에 관리자값이 없다면
			result =  "redirect:loginform.action";
		}
		else
		{
			result = "/admin/Main";
		}
		
		return result;
	}
}
