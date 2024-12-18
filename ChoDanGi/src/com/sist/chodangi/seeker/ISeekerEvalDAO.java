package com.sist.chodangi.seeker;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestParam;

public interface ISeekerEvalDAO
{
	// 평가 항목 리스트
	public ArrayList<SeekerEvalDTO> list();
	
	// 평가결과 추가
	public int add(SeekerEvalDTO s);
}
