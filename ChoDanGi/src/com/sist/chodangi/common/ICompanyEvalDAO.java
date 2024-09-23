package com.sist.chodangi.common;

import java.util.ArrayList;

public interface ICompanyEvalDAO
{
	// 평가 항목 리스트
	public ArrayList<CompanyEvalDTO> list();
	
	// 평가결과 추가
	public int add(CompanyEvalDTO c);
}
