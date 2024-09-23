package com.sist.chodangi.seeker;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.chodangi.common.IOpenApplicationDAO;

@Controller
public class ScheduleController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 지원서 저장
	@RequestMapping(value = "saveoa.action")
	public @ResponseBody String saveOA(OpenApplicationDTO dto, HttpSession session)
	{
		String result = "";
		
		if (session.getAttribute("seeker") == null)
			return result;
		else
		{
			int s_id = (int)session.getAttribute("seeker");
			
			// location_id 구하기
			ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
			
			SeekerDTO seeker = seekerDAO.searchById(s_id);
			
			dto.setS_id(s_id);
			System.out.println(seeker.getLocation_id());
			dto.setLocation_id(seeker.getLocation_id());
			
			IOpenApplicationDAO oaDAO = sqlSession.getMapper(IOpenApplicationDAO.class);
			
			int insertResult = oaDAO.add(dto);
		}
		
		return result;
	}
	
	// 지원서 삭제
	@RequestMapping(value = "deleteoa.action", method = RequestMethod.GET)
	public String deleteOA(int id, HttpSession session)
	{
		String result = "";
		
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			IOpenApplicationDAO oaDAO = sqlSession.getMapper(IOpenApplicationDAO.class);
			
			// 만약 이미 제안이 잇으면 지원서 삭제 불가
			
			int removeReslt = oaDAO.remove(id);
			
			result = "redirect:scheduler.action";
		}
		
		return result;
	}
	
	// 제안 받은 공고리스트로 가기
	@RequestMapping(value = "confirmoffer.action", method = RequestMethod.GET)
	public String confirmOffer(Model model, int id, HttpSession session)
	{
		String result = "";
		
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			
			
			result = "redirect:seekerjobpostingstatus.action";
		}
		
		return result;
	}
}
