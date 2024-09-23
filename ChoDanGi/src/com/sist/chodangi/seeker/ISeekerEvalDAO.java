package com.sist.chodangi.seeker;

import java.util.ArrayList;

public interface ISeekerEvalDAO
{
	// 평가 항목 리스트
	public ArrayList<SeekerEvalDTO> list();
	
	// 평가결과 추가
	public int add(SeekerEvalDTO s);
}
