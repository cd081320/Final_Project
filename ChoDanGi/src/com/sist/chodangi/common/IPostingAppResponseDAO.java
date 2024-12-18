package com.sist.chodangi.common;

import org.apache.ibatis.annotations.Param;

public interface IPostingAppResponseDAO
{
	public static int NOANSWER = 1;
	public static int FINISHED = 100;
	public static int NOT_FINISHED = 101;
	
	// 공고지원응답 추가
	public int add(PostingAppResponseDTO dto);
	
	// 공고지원응답 상태 변화
	public int modify(@Param(value = "id") int id,@Param(value = "status_id") int status_id);
	
	// 아이디로 전체 값 검색
	public PostingAppResponseDTO search(int id);
}
