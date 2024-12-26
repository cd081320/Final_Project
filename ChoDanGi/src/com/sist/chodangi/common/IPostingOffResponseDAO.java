package com.sist.chodangi.common;

public interface IPostingOffResponseDAO
{
	// 추가
	public int add(PostingOffResponseDTO dto);
	
	// 상태값 변경
	public int modify(PostingOffResponseDTO dto);
	
	// 
}
