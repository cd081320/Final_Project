package com.sist.chodangi;

import java.util.ArrayList;

public interface ISeekerInquiryDAO
{
	// 신고 유형 리스트
	public ArrayList<SeekerInquiryDTO> list();
	
	// 신교 내용 추가
	public int add(SeekerInquiryDTO s);
	
	// 관리자 시점 신고 리스트
	public ArrayList<SeekerInquiryDTO> list2();
	
	// 신고유형 상세보기
	public SeekerInquiryDTO search(SeekerInquiryDTO dto);
	
	// 신고내용 답변
	public int answer(SeekerInquiryDTO s);
	
	// 신고상태 업데이트
	public int status_update(SeekerInquiryDTO s);
}
