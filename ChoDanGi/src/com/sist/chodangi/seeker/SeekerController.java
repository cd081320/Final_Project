package com.sist.chodangi.seeker;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sist.chodangi.common.FileSaveDTO;
import com.sist.chodangi.common.ICategoryDAO;
import com.sist.chodangi.common.IFileSaveDAO;
import com.sist.chodangi.common.ILocationDAO;
import com.sist.chodangi.common.IOpenApplicationDAO;
import com.sist.chodangi.common.IPostingInfoDAO;

@Controller
public class SeekerController
{
	@Autowired
	private SqlSession sqlSession;
	private String projectPath = System.getProperty("user.dir");
	
	// 구직자 회원가입 폼 요청 페이지
	@RequestMapping(value = "seekersignupform.action")
	public String seekerSignupForm(Model model, HttpSession session)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			// 지역 리스트 보내주기
			ILocationDAO locationDAO = sqlSession.getMapper(ILocationDAO.class);
			model.addAttribute("list1", locationDAO.topList());
			
			// 분야 리스트 보내주기
			ICategoryDAO categoryDAO = sqlSession.getMapper(ICategoryDAO.class);
			model.addAttribute("categoryList", categoryDAO.list());
			
			result = "/seeker/SignupForm";
		}
		
		return result;
	}
	
	// 구직자 회원가입 요청 페이지
	@RequestMapping(value = "seekersignup.action")
	public String seekerSignup(SeekerDTO seeker, HttpServletRequest request)
	{
		String result = "";
		String[] categoryArr = request.getParameterValues("category"); 
		
		ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
		
		// 회원 정보 db 저장
		seekerDAO.addSeeker(seeker);
		seekerDAO.addSeekerInfo(seeker);

		// 선택한 여러 카테고리 정보 저장
		if (categoryArr != null)
		{
				for (String category : categoryArr) 
				{
					SeekerCategoryDTO dto = new SeekerCategoryDTO();
					
					dto.setS_id(seeker.getId());
					dto.setCategory_id(Integer.parseInt(category));
					
					seekerDAO.addSeekerCategory(dto);
				}
		}
		
		result = "redirect:loginform.action";
		
		return result;
	}
	
	@RequestMapping(value = "seekerloginajax.action")
	public @ResponseBody String seekerLoginAjax(SeekerDTO seeker, HttpSession session)
	{
		String result = "";
		ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
		
		int s_id = seekerDAO.login(seeker);
		
		if (s_id != 0)
		{
			// 로그인 성공
			// 세션에 구직자 번호 저장
			session.setAttribute("seeker", s_id);	
		}
		
		result = String.valueOf(s_id);
		
		return result;
	}
	
	// 구직자 로그인 요청 페이지
	@RequestMapping(value = "seekerlogin.action")
	public String SeekerLogin(SeekerDTO seeker, HttpSession session)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			// 로그인 성공
			result = "redirect:seekermypage.action";
		}
		
		return result;
	}
	
	// 구직자 아이디 찾기 폼 요청 페이지
	@RequestMapping(value = "seekerfindidform.action")
	public String seekerFindIdForm()
	{
		String result = "";
		
		result = "/seeker/FindIdForm";
		
		return result;
	}
	
	// 구직자 비밀번호 변경 폼 요청 페이지
	@RequestMapping(value = "seekerchangepwform.action")
	public String seekerChangePwForm()
	{
		String result = "";
		
		result = "/seeker/ChangePwForm";
		
		return result;
	}
	
	// 구직자 아이디 중복체크 ajax
	@RequestMapping(value = "seekeridcheck.action")
	public @ResponseBody String seekerIdCheck(String login_id)
	{
		String result = "";
		
		ISeekerDAO dao = sqlSession.getMapper(ISeekerDAO.class);
		
		result = String.valueOf(dao.searchLoginId(login_id));
		
		return result;
	}
	
	// 구직자 닉네임 중복체크 ajax
	@RequestMapping(value = "seekernicknamecheck.action")
	public @ResponseBody String seekerNicknameCheck(String nickname)
	{
		String result = "";
		
		ISeekerDAO dao = sqlSession.getMapper(ISeekerDAO.class);
		
		result = String.valueOf(dao.searchNickname(nickname));
		
		return result;
	}
	
	// 회원가입 시 필요한 지역 리스트 가져오는 ajax
	@RequestMapping(value = "locationajax.action")
	public String locationAjax(int id, Model model)
	{
		String result = "";
		
		ILocationDAO dao = sqlSession.getMapper(ILocationDAO.class);
		
		model.addAttribute("list", dao.subList(id));
		
		result = "LocationAjax";
		
		return result;
	}
	
	// 구직자 메인페이지
	@RequestMapping(value = "seekermainpage.action")
	public String seekerMainPage()
	{
		return "redirect:seekermypage.action";
	}
	
	
	// 구직자 마이페이지
	@RequestMapping(value = "seekermypage.action")
	public String seekerMyPage(HttpSession session, Model model)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			// seeker 정보 얻기
			int s_id = (int)session.getAttribute("seeker");
			
			ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
			
			model.addAttribute("dto", seekerDAO.searchById(s_id));
			
			// 사진 정보 가져오기
			ISeekerPhotoDAO photoDAO = sqlSession.getMapper(ISeekerPhotoDAO.class);
			SeekerPhotoDTO photo = photoDAO.search(s_id);
			// 가져올 사진이 있다면
			if (photo != null)
				model.addAttribute("photo", photo);
			
			
			result = "/seeker/MyPage";
		}
		
		return result;
	}
	
	
	// 구직자 개인 사진 변경 ajax
	@RequestMapping(value = "seekerprofileimageupload.action")
	public @ResponseBody String seekerprofileimageupload(HttpSession session, @RequestParam("file") MultipartFile file)
	{
		String result = "";
		
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		System.out.println(file);
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			int s_id = (int)session.getAttribute("seeker");
			
			ISeekerPhotoDAO seekerPhotoDAO = sqlSession.getMapper(ISeekerPhotoDAO.class);
			IFileSaveDAO fileSaveDAO = sqlSession.getMapper(IFileSaveDAO.class);
			
			if (seekerPhotoDAO.search(s_id) != null)
			{
				// 사진이 이미 존재한다면
				SeekerPhotoDTO dto = seekerPhotoDAO.search(s_id);
				String originFileName = dto.getPath() + dto.getFile_name();
				FileSaveDTO fsdto = new FileSaveDTO();
				fsdto.setId(dto.getFile_id()); 
				fsdto.setName(fileName);
				
				// 사진 경로 변경
				fileSaveDAO.modify(fsdto);

				// 실제 사진 저장
				File newFile = new File(projectPath + dto.getPath() + fileName);
				try
				{
					file.transferTo(newFile);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
				
				// 기존 사진 삭제
				File originFile = new File(projectPath + originFileName);
				originFile.delete();
				
				// 결과 전송
				result = dto.getPath() + fileName;
			}
			else
			{
				// 사진이 존재하지 않다면
				FileSaveDTO fsdto = new FileSaveDTO();
				fsdto.setFile_location_id(FileSaveDTO.SEEKER_PROFILE_PHOTO);
				fsdto.setName(fileName);
				
				// 사진 경로 추가
				int file_id = fileSaveDAO.add(fsdto);
				SeekerPhotoDTO dto = new SeekerPhotoDTO();
				dto.setS_id(s_id);
				dto.setFile_id(file_id);
				seekerPhotoDAO.add(dto);
				
				dto = seekerPhotoDAO.search(s_id);
				
				// 실제 사진 저장
				File newFile = new File(projectPath + dto.getPath() + fileName);
				try
				{
					file.transferTo(newFile);
				} catch (Exception e)
				{
					e.printStackTrace();
				}
				
				// 결과 전송
				result = dto.getPath() + fileName;
			}
		}
		
		return result;
	}
	
	
	// 구직자 개인정보 변경 폼
	@RequestMapping(value = "seekermypageupdateform.action")
	public String seekerMyPageUpdateForm(HttpSession session, Model model)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			int s_id = (int)session.getAttribute("seeker");
			
			ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
			
			model.addAttribute("dto", seekerDAO.searchById(s_id));
			
			result = "seeker/MypageUpdateForm";
		}
		
		return result;
	}
	
	
	// 구직자 개인정보 변경
	@RequestMapping(value = "seekermypageupdate.action")
	public String seekerMyPageUpdate(HttpSession session, SeekerDTO dto)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
			
			seekerDAO.modify(dto);
			
			result = "redirect:seekermypage.action";
		}
		
		return result;
	}
	
	
	// 구직자 스케쥴러
	@RequestMapping(value = "scheduler.action")
	public String scheduler(HttpSession session, Model model)
	{
		String result = "";
		int s_id = 0;
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			s_id = (int)session.getAttribute("seeker");
			
			// 내 오픈 지원서 리스트
			IOpenApplicationDAO oaDAO = sqlSession.getMapper(IOpenApplicationDAO.class);
			
			model.addAttribute("oaList", oaDAO.list(s_id));			
			result = "/seeker/Scheduler";
			
			// 최종 수락된 지원/제안 리스트
		}
		
		return result;
	}
	
	
	// 구직자 공고리스트
	@RequestMapping(value = "postinglist.action")
	public String postingList(Model model, HttpSession session)
	{
		String result = "";
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			// 전체 공고 받아오기
			// -> 모집 마감시간이 지나지 않은 공고만
			IPostingInfoDAO dao = sqlSession.getMapper(IPostingInfoDAO.class);
			
			model.addAttribute("postingList", dao.list());
					
			result = "seeker/PostingList";
		}
		
		return result;
	}
	
	
	// 구직자 비밀번호 변경
	@RequestMapping(value = "seekerpwupdate.action")
	public @ResponseBody String seekerPwUpdate(HttpSession session, String cur_pw, String login_pw)
	{
		int s_id;
		String result = "";
		
		s_id = (int)session.getAttribute("seeker");
		ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
		
		result = String.valueOf(seekerDAO.updatePw(s_id, cur_pw, login_pw));
		
		return result;
	}
	
	// 구직자 지원서 현황
	@RequestMapping(value = "oastatus.action")
	public String OAStatus(HttpSession session, Model model)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else 
		{
			int s_id = (int)session.getAttribute("seeker");
			
			ISeekerDAO seekerDAO = sqlSession.getMapper(ISeekerDAO.class);
			
			model.addAttribute("nickname", seekerDAO.nickname(s_id));
			// 지원/제안 리스트 저장
			// 공고제목, 마감시간, 시작시간, 종료시간, 근무 위치, 매칭 현황, 구인자 정보, 업체 정보
			ISeekerStatusDAO ssDAO = sqlSession.getMapper(ISeekerStatusDAO.class);

			// 지원 리스트 저장
			model.addAttribute("appList", ssDAO.appList(s_id));
			
			// 제안 리스트 저장
			model.addAttribute("offList", ssDAO.offList(s_id));
			
			result = "seeker/OAStatus";
		}
		
		return result;
	}
	
	// 구직자 제안 수락
	@RequestMapping(value = "seekeracceptoffer.action")
	public @ResponseBody String seekerAcceptOffer(int id)
	{
		String result = "";
		
		ISeekerStatusDAO ssDAO = sqlSession.getMapper(ISeekerStatusDAO.class);
		int updateResult = ssDAO.modifyOffState(id, 2);
		result = String.valueOf(updateResult);
		
		return result;
	}
	
	// 구직자 제안 거절
	@RequestMapping(value = "seekerdeclineoffer.action")
	public @ResponseBody String seekerDeclineOffer(int id)
	{
		String result = "";
		
		ISeekerStatusDAO ssDAO = sqlSession.getMapper(ISeekerStatusDAO.class);
		int updateResult = ssDAO.modifyOffState(id, 3);
		result = String.valueOf(updateResult);
		
		return result;
	}
	
	// 구직자 지원 취소
	// 응답이 없음
	@RequestMapping(value = "seekercancelapplication.action")
	public @ResponseBody String seekerCancelApplication(HttpSession session, PostingApplicationDTO dto)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			return result;

		IPostingApplicationDAO dao = sqlSession.getMapper(IPostingApplicationDAO.class);
		int id = dao.search(dto);
	
		// 지원 삭제
		dao.remove(id);
		
		result = "success";
		
		return result;
	}
	
	
	// 구직자 공고 지원
	@RequestMapping(value = "seekerapplication.action")
	public String seekerApplication(HttpSession session, PostingApplicationDTO dto)
	{
		String result = "";
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "redirect:logout.action";
		else
		{
			int s_id = (int)session.getAttribute("seeker");
			
			IPostingApplicationDAO dao = sqlSession.getMapper(IPostingApplicationDAO.class);
			
			dto.setS_id(s_id);

			// POSTING_APPLICATION INSERT
			dao.add(dto);
			
			result = "redirect:postinglist.action";
		}
		
		return result;
	}
	
	
	// 구직자 즐겨찾기 추가
	@ResponseBody
	@RequestMapping(value = "seekerbookmarkadd.action")
	public String seekerBookmarkAdd(HttpSession session, int posting_id, String alias)
	{
		String result = "";
		
		
		// 세션 정보 확인
		if (session.getAttribute("seeker") == null)
			result = "fause";
		else
		{
			IPostingBookmarkDAO PBdao = sqlSession.getMapper(IPostingBookmarkDAO.class);
			int s_id = (int)session.getAttribute("seeker");
			PostingBookmarkDTO dto = new PostingBookmarkDTO();
			dto.setId(posting_id);
			dto.setPosting_id(posting_id);
			dto.setS_id(s_id);
			dto.setAlias(alias);
			PBdao.add(dto);
			
			result = "true";
		}
		
		return result;
	}
	
	
	// 구직자 즐겨찾기 삭제
	@ResponseBody
	@RequestMapping(value = "seekerbookmarkremove.action")
	public String seekerBookmarkRemove(HttpSession session, int id)
	{
		String result = "";
		if (session.getAttribute("seeker") == null)
			result = "false";
		else
		{
			IPostingBookmarkDAO PBdao = sqlSession.getMapper(IPostingBookmarkDAO.class);
			PBdao.remove(id);
			result = "true";
		}
		
		return result;
	}
}
