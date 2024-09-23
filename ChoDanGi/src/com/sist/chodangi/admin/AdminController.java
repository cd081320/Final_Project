/*
 * AdminController.java
 */
package com.sist.chodangi.admin;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/changemaxheadcountform.action", method = RequestMethod.GET)
	public String seekerEvalForm(AdminDTO dto, Model model)
	{
		String result = "";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("headcount", dao.headcount(dto));

		result = "admin/ChangeMaxHeadcountForm";

		return result;
	}
	
	// 최대모집인원 변경
	@RequestMapping(value = "/headcountchange.action", method = RequestMethod.GET)
	public String HeadcountChange(AdminDTO dto, Model model)
	{
		String result = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		dao.change_headcount(dto);

		result = "redirect:adminmainform.action";

		return result;
	}
}
