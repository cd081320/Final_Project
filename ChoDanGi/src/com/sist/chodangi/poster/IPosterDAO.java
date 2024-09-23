package com.sist.chodangi.poster;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.sist.chodangi.common.CategoryDTO;
import com.sist.chodangi.common.GenderDTO;
import com.sist.chodangi.seeker.SeekerDTO;

public interface IPosterDAO
{
	// 아이디 중복성 검사
	public int search(String posterId);
	
	// 구인자 로그인
	public int login(PosterDTO dto);
	
	// 구인자 추가
	public int addPoster(PosterDTO dto);
	
	// 구인자 정보 추가
	public int addPosterInfo(PosterDTO dto);
	
	// 구인자 공고 현황(구직자 지원한) 리스트
	public ArrayList<PosterStatusDTO> appList(int p_id);
	
	// 구인자 공고 현황(직접 제안한) 리스트
	public ArrayList<PosterStatusDTO> offList(int p_id);
		
	// 구인자 마이페이지 리스트
	public PosterDTO posterMypage(int p_id);
	
	// 구인자 마이페이지 3년 이내 채용 완료한 공고 리스트
	public ArrayList<JobPostingStatusDTO> endPostingList(int p_id);
	
	// 구인자 마이페이지 3년 이내 채용 완료한 공고 리스트에 해당하는 구직자 정보
	public SeekerDTO SeekerInfo(String seekerNickName);

	// 구인자 마이페이지 수정 전 비밀번호 검사 ajax
	public int pwdCheckAjax(PosterDTO dto);
	
	// 구인자 마이페이지 비밀번호 수정 ajax
	public int changePwdAjax(@Param("login_pw") String login_pw, @Param("p_id") int p_id);
	
	// 구인자 정보 마이페이지 수정
	public int posterMyPageUpdate(PosterDTO dto);
	
	// 구인자 회사 리스트
	public ArrayList<PosterCompanyDTO> companyList(int p_id);
	
	// 구인자 회사 위치 번호 찾기
	public String searchLocation(@Param("extraAddr") String extraAddr);
	
	// 구인자 회사 추가
	public int CompanyInsert(PosterCompanyDTO dto);
	
	// 구인자 회사 정보 추가
	public int CompanyInfoInsert(PosterCompanyDTO dto);
	
	// 구인자 회사 번호 찾기
	public int searchCompanyId(@Param("postaddr") String postaddr);
	
	// 구인자 회사 업데이트 폼 리스트 가져오기
	public PosterCompanyDTO searchCompanyList(@Param("c_id") int c_id);
	
	// 구인자 회사 업데이트 
	public int CompanyUpdate(PosterCompanyDTO dto);
	
	// 구인자 회사 정보 업데이트
	public int CompanyInfoUpdate(PosterCompanyDTO dto);
	
	// 구인자 회사 정보 삭제
	public int CompanyDelete(int c_id);
	
	// 구인자 로그아웃 → 구인자 로그 인서트
	public int PosterLogInsert(PosterLogDTO dto);
	
	// 구인자 마이페이지 3년 이내 제안 완료된 공고 리스트 가져오기
	public ArrayList<OfferEndListDTO> OfferEndList(int p_id);
	
	// 구인자 공고 작성 시 희망 분야 가져오기
	public ArrayList<CategoryDTO> categoryList();
	
	// 구인자 공고 작성 시 희망 성별 가져오기
	public ArrayList<GenderDTO> genderList();
	
	// 구인자 공고 작성 시 공개 여부 가져오기
	public ArrayList<OpenStatusDTO> openStatusList();
	
	// 구인자 공고 작성 시 구인자 회사 리스트 가져오기
	public ArrayList<PosterCompanyDTO> posterCompanyList(@Param("p_id") int p_id);
	
	// 구인자 공고 작성
	public int PostingInsert(PostingDTO dto);
	
	// 구인자 정보 번호 얻기
	public int searchPIID(@Param("p_id") int p_id);
	
	// 구인자 회사 번호 얻기
	public int searchCId(@Param("p_id") int p_id, @Param("pci_id") int pci_id);
	
	// 구인자 회사 지역 번호 얻기
	public int searchLocationId(@Param("pi_id") int pi_id, @Param("c_id") int c_id);
		
	
}
