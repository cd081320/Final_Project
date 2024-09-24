package com.sist.chodangi.seeker;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface ISeekerStatusDAO
{
	public ArrayList<SeekerStatusDTO> appList(int s_id);
	public ArrayList<SeekerStatusDTO> offList(int s_id);
	public int modifyOffState(@Param(value = "id") int por_id, @Param(value = "status_id") int status_id);
	public int modifyAppState(@Param(value = "id") int par_id, @Param(value = "status_id") int status_id);
	
	// 지원 취소 시
	// POSTING_APPLICATION 데이터 삭제를 위한 공고 지원 번호 얻어내기
	public int getP_application_id(int id);
	// POSTING_APP_RESPONSE 데이터 삭제
	public int removePAR(int id);
	// POSTING_APPLICATION 데이터 삭제
	public int removePA(int p_id);
	// POSTING_APP_RESPONSE 데이터 확인
	public int searchPAR(int id);
	
}
