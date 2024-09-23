package com.sist.chodangi.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sist.chodangi.seeker.ISeekerEvalDAO;
import com.sist.chodangi.seeker.SeekerEvalDTO;

@Controller
public class EvaluationController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/s_evaluationform.action", method = RequestMethod.GET)
	public String seekerEvalForm(Model model)
	{
		String result = "";

		ISeekerEvalDAO dao = sqlSession.getMapper(ISeekerEvalDAO.class);

		model.addAttribute("list", dao.list());

		result = "poster/S_Eval_Form";

		return result;
	}

	@RequestMapping(value = "/s_evaluationinsert.action", method = RequestMethod.GET)
	public String sEvalInsert(@RequestParam Map<String, String> params, HttpServletRequest request)
	{
		// 숨겨진 필드 값 추출
		int postingId = Integer.parseInt(params.get("posting_id"));
		int pId = Integer.parseInt(params.get("p_id"));
		int sId = Integer.parseInt(params.get("s_id"));

		ISeekerEvalDAO dao = sqlSession.getMapper(ISeekerEvalDAO.class);
		
		// 폼 파라미터를 순회하여 각 평가 점수를 처리
		for (Map.Entry<String, String> entry : params.entrySet())
		{
			String key = entry.getKey();
			String value = entry.getValue();

			if (key.startsWith("score"))
			{
				// 인덱스와 점수 값 추출
				int index = Integer.parseInt(key.substring(5)); // e.g., "score0" -> 0
				int score = Integer.parseInt(value);

				// 새로운 SeekerEvalDTO 객체를 생성하고 속성 설정
				SeekerEvalDTO dto = new SeekerEvalDTO();
				dto.setScore(score);
				dto.setPosting_id(postingId); // Posting ID 설정
				dto.setP_id(pId); // P ID 설정
				dto.setS_id(sId); // S ID 설정
				dto.setItem_id(index); // Item ID 설정

				// 데이터베이스에 평가 추가
				dao.add(dto);
			}
		}

		// 이전 페이지로 리다이렉트
		String referer = request.getHeader("Referer");
		if (referer == null || referer.isEmpty())
		{
			referer = "defaultPage.action"; // Referer가 없을 경우 기본 페이지로 리다이렉트
		}

		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "/c_evaluationform.action", method = RequestMethod.GET)
	public String companyEvalForm(Model model)
	{
		String result = "";

		ICompanyEvalDAO dao = sqlSession.getMapper(ICompanyEvalDAO.class);

		model.addAttribute("list", dao.list());

		result = "seeker/C_Eval_Form";

		return result;
	}
	
	@RequestMapping(value = "/c_evaluationinsert.action", method = RequestMethod.GET)
	public String cEvalInsert(@RequestParam Map<String, String> params, HttpServletRequest request)
	{
		// 숨겨진 필드 값 추출
		int postingId = Integer.parseInt(params.get("posting_id"));
		int cId = Integer.parseInt(params.get("c_id"));
		int sId = Integer.parseInt(params.get("s_id"));

		ICompanyEvalDAO dao = sqlSession.getMapper(ICompanyEvalDAO.class);
		
		// 폼 파라미터를 순회하여 각 평가 점수를 처리
		for (Map.Entry<String, String> entry : params.entrySet())
		{
			String key = entry.getKey();
			String value = entry.getValue();

			if (key.startsWith("score"))
			{
				// 인덱스와 점수 값 추출
				int index = Integer.parseInt(key.substring(5)); // e.g., "score0" -> 0
				int score = Integer.parseInt(value);

				// 새로운 SeekerEvalDTO 객체를 생성하고 속성 설정
				CompanyEvalDTO dto = new CompanyEvalDTO();
				dto.setScore(score);
				dto.setPosting_id(postingId); // Posting ID 설정
				dto.setC_id(cId); // P ID 설정
				dto.setS_id(sId); // S ID 설정
				dto.setEvaluation_id(index); // Item ID 설정

				// 데이터베이스에 평가 추가
				dao.add(dto);
			}
		}

		// 이전 페이지로 리다이렉트
		String referer = request.getHeader("Referer");
		if (referer == null || referer.isEmpty())
		{
			referer = "defaultPage.action"; // Referer가 없을 경우 기본 페이지로 리다이렉트
		}

		return "redirect:" + referer;
	}
}
