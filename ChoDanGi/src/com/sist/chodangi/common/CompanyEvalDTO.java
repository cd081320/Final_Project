package com.sist.chodangi.common;

public class CompanyEvalDTO
{
	private String name;		// 평가제목
	private int score;			// 평가점수
	private int posting_id;		// 공고번호
	private int c_id;			// 회사번호
	private int s_id;			// 구직자번호
	private int evaluation_id;	// 평가번호
	
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
	public int getPosting_id()
	{
		return posting_id;
	}
	public void setPosting_id(int posting_id)
	{
		this.posting_id = posting_id;
	}
	public int getC_id()
	{
		return c_id;
	}
	public void setC_id(int c_id)
	{
		this.c_id = c_id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public int getEvaluation_id()
	{
		return evaluation_id;
	}
	public void setEvaluation_id(int evaluation_id)
	{
		this.evaluation_id = evaluation_id;
	}
	
	
}
