package com.sist.chodangi;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PostingController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/posting.action")
	public String postingInfo(PostingInfoDTO dto, Model model)
	{
		String result = "";

		IPostingInfoDAO dao = sqlSession.getMapper(IPostingInfoDAO.class);

		model.addAttribute("info", dao.info(dto));

		result = "seeker/Posting_Info";

		return result;
	}
}
