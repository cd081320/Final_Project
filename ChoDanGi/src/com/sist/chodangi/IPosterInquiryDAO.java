package com.sist.chodangi;

import java.util.ArrayList;

public interface IPosterInquiryDAO
{
	// 신고 유형 리스트
	public ArrayList<PosterInquiryDTO> list();
	
	// 신고내용 추가
	public int add(PosterInquiryDTO p);

	// 신고 내용 리스트
	public ArrayList<PosterInquiryDTO> list2();
	
	// 신고유형 상세보기
	public PosterInquiryDTO p_search(PosterInquiryDTO dto);
	
	// 신고내용 답변
	public int answer(PosterInquiryDTO p);
	
	// 신고상태 업데이트
	public int status_update(PosterInquiryDTO p);
}
