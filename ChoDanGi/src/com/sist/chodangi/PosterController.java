package com.sist.chodangi;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PosterController
{
	@Autowired
	private SqlSession sqlsession;
	
	// 구인자 로그인 요청 페이지
	@RequestMapping(value = "posterlogin.action")
	public String PosterLogin(PosterDTO poster, HttpSession session)
	{
		String result = "";
		IPosterDAO posterDAO = sqlsession.getMapper(IPosterDAO.class);
		System.out.println("확인");
		// 구인자 번호 알아내기
		int p_id = posterDAO.login(poster);
		
		if (p_id != 0)
		{
			// 로그인 성공

			// 세션에 구직자 번호 저장
			session.setAttribute("poster", p_id);
			
			result = "redirect:postermypage.action";
		}
		else 
		{
			// 로그인 실패
			result = "redirect:loginform.action";
		}
		
		return result;
	}
	
	
	// 구인자 회원가입 요청 페이지
	@RequestMapping(value = "postersignup.action")
	public String seekerSignup(PosterDTO poster)
	{
		String result = "";
		
		IPosterDAO posterDAO = sqlsession.getMapper(IPosterDAO.class);
		
		System.out.println(poster.getEmail());
		
		// 회원 정보 db 저장
		posterDAO.addPoster(poster);
		posterDAO.addPosterInfo(poster);

		result = "redirect:loginform.action";
		
		return result;
	}
	
	
	// 메인페이지
	@RequestMapping(value = "postermainpage.action")
	public String posterMainPage()
	{
		return "redirect:postermypage.action";
	}
	
	
	
	// 구인자 아이디 중복체크 ajax
	@RequestMapping(value = "/ajax.action")
	public String checkId(String login_id, Model model)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
        int count = dao.search(login_id);
        model.addAttribute("count", count);
        
        return "idCheck";
	}
	
	// 구인자 마이페이지 페이지 요청
	@RequestMapping(value = "/postermypage.action")
	public String PosterMyPage(Model model, HttpSession session)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		String result;
		
		int p_id;
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			result = "/poster/MyPage";
			p_id = (int)session.getAttribute("poster");	
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			model.addAttribute("dto", dto);
		}
		
		return result;
	}
	
	// 구인자 공고 확인 상태 페이지 요청
	@RequestMapping(value = "/jobpostingstatus.action", method = RequestMethod.GET)
	public String JobPostingStatus(Model model, HttpSession session)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		String result = "";
		
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			int p_id = (int)session.getAttribute("poster");
			System.out.println("Poster ID: " + p_id);
			//--==>>Poster ID: 1
			
			
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			model.addAttribute("appList", dao.appList(p_id));
			model.addAttribute("offList", dao.offList(p_id));
			result = "poster/JobpostingStatus";
		}
		
		return result;
	}
	
	
	// 구인자 마이페이지 수정 폼 요청
	@RequestMapping(value = "/postermypageupdateform.action", method = RequestMethod.POST)
	public String PosterMyPageUpdateForm(Model model, HttpSession session)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			int p_id = (int)session.getAttribute("poster");
			System.out.println("Poster ID: " + p_id);
			
			PosterDTO dto = dao.posterMypage(p_id);
			
			model.addAttribute("loginId", dto.getLogin_id());
			
			model.addAttribute("dto", dto);
			
			
			result = "poster/MyPageUpdateForm";
		}
		
		return result;
	}
	
	// 구인자 마이페이지 수정 - 리다이렉트
	@RequestMapping(value = "/postermypageupdate.action", method = RequestMethod.POST)
	public String PosterMyPageUpdate(PosterDTO dto, HttpSession session)
	{
		String result = "";
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		int p_id;
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			dto.setP_id(p_id);
			System.out.println("login_id: " + dto.getLogin_id());
			System.out.println("login_pw: " + dto.getLogin_pw());
		    System.out.println("name: " + dto.getName());
		    System.out.println("tel: " + dto.getTel());
		    System.out.println("email: " + dto.getEmail());
		    
			dao.posterMyPageUpdate(dto);
			result = "redirect:postermypage.action";
		}
		//dao.updatePosterCompanyInfo(dto);
		//dao.updateCompany(dto);
	
		return result;
	}
	
	// 구인자 마이페이지 → 비밀번호 검증 후 마이페이지 수정 ajax
	@RequestMapping(value = "/pwdcheckajax.action", method = RequestMethod.POST)
	public String pwdCheckAjax(Model model , PosterDTO dto)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		System.out.println("login_pw :" + dto.getLogin_pw());
		System.out.println("p_id :" + dto.getP_id());
		
		int count = dao.pwdCheckAjax(dto);
		
		model.addAttribute("count", count);
		String result = "pwdCheckAjax";
		
		return result;
	}
	
	// 구인자 마이페이지 → 비밀번호 변경 ajax
	@RequestMapping(value = "/changepwdajax.action", method = RequestMethod.POST)
	public String changePwdAjax(PosterDTO dto, Model model)
	{
		String result = "";
		
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		System.out.println("login_pw:"+dto.getLogin_pw());
		System.out.println("p_id:"+dto.getP_id());
		
		int count = dao.changePwdAjax(dto.getLogin_pw(), dto.getP_id());
		
		System.out.println("count:"+count);
		model.addAttribute("count", count);
		
		result = "changePwdAjax";
		
		return result;
	}
	
	// 구인자 마이페이지 → 채용 완료한 공고 페이지 요청 
	@RequestMapping(value = "/endpostinglist.action", method = RequestMethod.GET)
	public String EndPostingList(Model model, HttpSession session)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			System.out.println("Poster ID: " + p_id);
			
			PosterDTO dto = dao.posterMypage(p_id);
			
			model.addAttribute("loginId",dto.getLogin_id());
			model.addAttribute("endPostingList", dao.endPostingList(p_id));
			result = "/poster/EndPostingList";
		}
		
		return result;
	}
	
	// 구인자 마이페이지 → 채용 완료한 공고 페이지 → 구직자 정보 모달 ajax
	@RequestMapping(value = "/seekerInfoAjax.action")
	public String SeekerInfo(@RequestParam("seekerNickName") String seekerNickName, Model model)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		SeekerDTO dto = dao.SeekerInfo(seekerNickName);
		model.addAttribute("dto", dto);
		
		return "SeekerInfo";
	}
	
	// 구인자 마이페이지 → 회사 정보 페이지 요청(리스트)
	@RequestMapping(value = "/companylist.action")
	public String CompanyList(Model model, HttpSession session)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			System.out.println("p_id:"+p_id);
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			model.addAttribute("list", dao.companyList(p_id));
			
			result = "/poster/CompanyList";
		}
		
		return result;
	}
	
	// 구인자 마이페이지 → 회사 정보 페이지 → 회사 추가 버튼 companyinsertform.action
	@RequestMapping(value = "/companyinsertform.action")
	public String CompanyInsertForm(HttpSession session, Model model)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			result = "/poster/CompanyInsertForm";
		}
		
		return result;
	}
	
	// 구인자 마이페이지 → 회사 정보 페이지 → 회사 추가
	@RequestMapping(value = "/companyinsert.action", method = RequestMethod.POST)
	public String CompanyInsert(HttpSession session, Model model, PosterCompanyDTO dto)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			PosterDTO poster = dao.posterMypage(p_id);
			model.addAttribute("loginId", poster.getLogin_id());
			
			// 법정동 주소 획득 → 지역 번호 가져오기
			String location_id = dao.searchLocation(dto.getExtraAddr());
			System.out.println("location_id:"+location_id);
			dto.setLocation_id(Integer.parseInt(location_id));
			
			// 회사 추가
			dao.CompanyInsert(dto);
			
			// 회사 정보 추가
			// 있어야 할 정보 : 구인자 정보 번호, 회사 번호
			
			
			// 구인자 정보 번호 획득 
			System.out.println("p_info_id:"+poster.getPi_id());
			dto.setPi_id(poster.getPi_id());
			
			// 회사 번호 획득
			int c_id = dao.searchCompanyId(dto.getPostaddr());
			System.out.println("c_id:"+c_id);
			dto.setC_id(c_id);
			
			// 회사 정보 추가
			dao.CompanyInfoInsert(dto);
			
			
			result = "redirect:companylist.action";
		}
		
		return result;
	}
	
	// 구인자 회사 정보 수정 폼 요청
	@RequestMapping(value = "/companyupdateform.action")
	public String CompanyUpdateForm(int c_id, HttpSession session,Model model)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			
			PosterCompanyDTO company = dao.searchCompanyList(c_id);
			
			model.addAttribute("company", company);
			
			result = "/poster/CompanyUpdateForm";
		}
		
		
		return result;
	}
	
	// 구인자 회사 정보 수정
	@RequestMapping(value = "/companyupdate.action", method = RequestMethod.POST)
	public String CompanyUpdate(HttpSession session, PosterCompanyDTO dto)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			// 법정동 주소 → 지역 번호 획득
			String location_id = dao.searchLocation(dto.getExtraAddr());
			System.out.println("location_id:"+location_id);
			dto.setLocation_id(Integer.parseInt(location_id));
			
			dao.CompanyUpdate(dto);
			dao.CompanyInfoUpdate(dto);
			
			result = "redirect:companylist.action";
		}
		
		return result;
	}
	
	// 구인자 회사 삭제 companydelete.action?c_id
	@RequestMapping(value = "/companydelete.action")
	public String CompanyDelete(int c_id)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		dao.CompanyDelete(c_id);
		
		result = "redirect:companylist.action";
		
		return result;
	}
	
	// 구인자 제안 완료된 공고 리스트 페이지 요청 offerlist.action
	@RequestMapping(value = "/offerendlist.action")
	public String OfferEndList(Model model, HttpSession session)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			
			model.addAttribute("list", dao.OfferEndList(p_id));
			
			result = "/poster/OfferEndList";
		}
		
		return result;
	}
	
	// 구인자 공고 작성 폼 요청
	@RequestMapping(value = "/postinginsertform.action")
	public String PostingInsertForm(HttpSession session, Model model)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			PosterDTO dto = dao.posterMypage(p_id);
			model.addAttribute("loginId", dto.getLogin_id());
			model.addAttribute("categoryList", dao.categoryList());
			model.addAttribute("genderList", dao.genderList());
			model.addAttribute("openstatusList", dao.openStatusList());
			model.addAttribute("companyList", dao.companyList(p_id));
			
			result = "/poster/PostingInsertForm";
		}
		
		return result;
	}
	
	// 구인자 공고 작성
	@RequestMapping(value = "/insertposting.action", method = RequestMethod.POST)
	public String PostingInsert(HttpSession session, PostingDTO dto)
	{
		IPosterDAO dao = sqlsession.getMapper(IPosterDAO.class);
		
		String result = "";
		
		int p_id;
		
		// 세션 정보 확인
		if (session.getAttribute("poster") == null)
			result = "redirect:logout.action";
		else
		{
			p_id = (int)session.getAttribute("poster");
			
			// 구인자 정보 번호 얻기
			int pi_id = dao.searchPIID(p_id);
			
			// 구인자 회사 정보 번호 얻기
			int pci_id = dto.getPci_id();
			
			// 구인자 회사 번호 얻기
			int c_id = dao.searchCId(p_id, pci_id);
			
			// 구인자 회사 지역 번호 얻기
			int location_id = dao.searchLocationId(pi_id, c_id);
			dto.setLocation_id(location_id);
			
			dao.PostingInsert(dto);
			
			result = "redirect:jobpostingstatus.action";
		}
		
		return result;
	}
	
	

}
