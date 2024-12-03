package com.sist.chodangi.common;

public interface IPostingAppResponseDAO
{
	// 공고지원응답 추가
	public int add(PostingAppResponseDTO dto);
	
	// 공고지원응답 상태 변화
	public int modify(int status_id);
	
	// 아이디 검색
	
	// 아이디로 전체 값 검색
	public PostingAppResponseDTO search(int id);
}
