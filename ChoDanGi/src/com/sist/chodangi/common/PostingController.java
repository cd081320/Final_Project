package com.sist.chodangi.common;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.chodangi.seeker.IPostingApplicationDAO;
import com.sist.chodangi.seeker.PostingApplicationDTO;

@Controller
public class PostingController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/posting.action")
	public String postingInfo(HttpSession session, PostingInfoDTO dto, Model model)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			IPostingInfoDAO dao = sqlSession.getMapper(IPostingInfoDAO.class);
			dto = dao.info(dto);
			
			// 공고 정보 저장
			model.addAttribute("info", dto);
			
			int posting_id = dto.getId();
			int s_id = (int)session.getAttribute("seeker");
			
			IPostingApplicationDAO PAdao = sqlSession.getMapper(IPostingApplicationDAO.class);
			PostingApplicationDTO PAdto = new PostingApplicationDTO();
			PAdto.setPosting_id(posting_id);
			PAdto.setS_id(s_id);
			
			// 지원 정보 저장
			model.addAttribute("isApp", PAdao.search(PAdto));
			
			result = "seeker/Posting_Info";
		}

		return result;
	}
}
