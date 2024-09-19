package com.sist.chodangi;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InquiryController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/seekerinquiryform.action", method = RequestMethod.GET)
	public String seekerInqiryForm(Model model)
	{
		String result = "";

		ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);

		model.addAttribute("list", dao.list());

		result = "seeker/InquiryForm";

		return result;
	}

	// 관리자 시점 구직자들의 신고문의 리스트
	@RequestMapping(value = "/seekerinquirylist.action", method = RequestMethod.GET)
	public String seekerInqiryList(Model model)
	{
		String result = "";

		ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);

		model.addAttribute("list2", dao.list2());

		result = "admin/SeekerInquiryList";

		return result;
	}

	// 구직자들의 신고내용 상세보기
	@RequestMapping(value = "/search.action", method = RequestMethod.GET)
	public String search(SeekerInquiryDTO dto, Model model)
	{
		String result = "";

		ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);

		model.addAttribute("search", dao.search(dto));

		result = "admin/SeekerInquiryInfo";

		return result;
	}

	// 관리자 시점 구인자들의 신고문의 리스트
	@RequestMapping(value = "/posterinquirylist.action", method = RequestMethod.GET)
	public String posterInqiryList(Model model)
	{
		String result = "";

		IPosterInquiryDAO dao = sqlSession.getMapper(IPosterInquiryDAO.class);

		model.addAttribute("list2", dao.list2());

		result = "admin/PosterInquiryList";

		return result;
	}

	// 구인자들의 신고내용 상세보기
	@RequestMapping(value = "/p_search.action", method = RequestMethod.GET)
	public String psearch(PosterInquiryDTO dto, Model model)
	{
		String result = "";

		IPosterInquiryDAO dao = sqlSession.getMapper(IPosterInquiryDAO.class);

		model.addAttribute("p_search", dao.p_search(dto));

		result = "admin/PosterInquiryInfo";

		return result;
	}

	// 구인자들의 신고내용 답장폼
	@RequestMapping(value = "/p_search2.action", method = RequestMethod.GET)
	public String p2search(PosterInquiryDTO dto, Model model)
	{
		String result = "";

		IPosterInquiryDAO dao = sqlSession.getMapper(IPosterInquiryDAO.class);

		model.addAttribute("p_search", dao.p_search(dto));

		result = "admin/PInquiryAnswerForm";

		return result;
	}

	// 구직자들의 신고내용 답장폼
	@RequestMapping(value = "/search2.action", method = RequestMethod.GET)
	public String search2(SeekerInquiryDTO dto, Model model)
	{
		String result = "";

		ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);

		model.addAttribute("search", dao.search(dto));

		result = "admin/SInquiryAnswerForm";

		return result;
	}

	// 구인자들의 신고내용 답장
	@RequestMapping(value = "/pinquiryanswer.action", method = RequestMethod.GET)
	public String pInquiryAnswer(PosterInquiryDTO dto)
	{
		String result = null;

		IPosterInquiryDAO dao = sqlSession.getMapper(IPosterInquiryDAO.class);

		dao.answer(dto);
		dao.status_update(dto);

		result = "redirect:posterinquirylist.action";

		return result;
	}

	// 구직자들의 신고내용 답장
	@RequestMapping(value = "/sinquiryanswer.action", method = RequestMethod.GET)
	public String sInquiryAnswer(SeekerInquiryDTO dto)
	{
		String result = null;

		ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);

		dao.answer(dto);
		dao.status_update(dto);

		result = "redirect:seekerinquirylist.action";

		return result;
	}

	@RequestMapping(value = "/posterinquiryform.action", method = RequestMethod.GET)
	public String PosterInquiryForm(Model model)
	{
		String result = "";

		IPosterInquiryDAO dao = sqlSession.getMapper(IPosterInquiryDAO.class);

		model.addAttribute("list", dao.list());

		result = "poster/InquiryForm";

		return result;
	}

	@RequestMapping(value = "/p_inquiryinsert.action", method = RequestMethod.GET)
	public String pInquiryInsert(PosterInquiryDTO dto, HttpServletRequest request)
	{
		IPosterInquiryDAO dao = sqlSession.getMapper(IPosterInquiryDAO.class);

		dao.add(dto);

		// Referer 헤더에서 이전 페이지 URL을 가져옵니다.
		String referer = request.getHeader("Referer");

		// Referer가 null이거나 빈 문자열인 경우를 처리합니다.
		if (referer == null || referer.isEmpty())
		{
			referer = "defaultPage.action"; // 기본 페이지 URL 설정
		}

		return "redirect:" + referer;
	}

	@RequestMapping(value = "/s_inquiryinsert.action", method = RequestMethod.GET)
	public String sInquiryInsert(SeekerInquiryDTO dto, HttpServletRequest request)
	{
		ISeekerInquiryDAO dao = sqlSession.getMapper(ISeekerInquiryDAO.class);

		dao.add(dto);

		String referer = request.getHeader("Referer");

		// Referer가 null이거나 빈 문자열인 경우를 처리합니다.
		if (referer == null || referer.isEmpty())
		{
			referer = "defaultPage.action"; // 기본 페이지 URL 설정
		}

		return "redirect:" + referer;
	}

	@RequestMapping(value = "/prepage.action", method = RequestMethod.GET)
	public String sPrePage(HttpServletRequest request)
	{
		String referer = request.getHeader("Referer");

		// Referer가 null이거나 빈 문자열인 경우를 처리합니다.
		if (referer == null || referer.isEmpty())
		{
			referer = "defaultPage.action"; // 기본 페이지 URL 설정
		}

		return "redirect:" + referer;
	}
}
