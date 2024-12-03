package com.sist.chodangi.common;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.chodangi.seeker.IPostingApplicationDAO;
import com.sist.chodangi.seeker.IPostingBookmarkDAO;
import com.sist.chodangi.seeker.PostingApplicationDTO;
import com.sist.chodangi.seeker.PostingBookmarkDTO;

@Controller
public class PostingController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/seekerposting.action")
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
			
			// 이미 즐겨찾기 한 공고인지 확인
			// 즐겨찾기 되어있다면 posting_bookmark_id 추가
			IPostingBookmarkDAO PBdao = sqlSession.getMapper(IPostingBookmarkDAO.class);
			PostingBookmarkDTO PBdto = new PostingBookmarkDTO();
			PBdto.setS_id(s_id);
			PBdto.setPosting_id(posting_id);
			
			int posting_bookmark_id = PBdao.search(PBdto);
			model.addAttribute("posting_bookmark_id", posting_bookmark_id);
			
			result = "seeker/Posting_Info";
		}

		return result;
	}
}
