package com.sist.chodangi;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/adminmainform.action", method = RequestMethod.GET)
	public String seekerInqiryForm(Model model)
	{
		String result = "";
		
		//ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);
		
		//model.addAttribute("list", dao.list());
		
		result = "admin/Main";
		
		return result;
	}
}
