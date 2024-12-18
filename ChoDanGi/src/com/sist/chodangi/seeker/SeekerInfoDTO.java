package com.sist.chodangi.seeker;

public class SeekerInfoDTO
{
	// 구직자 본인의 닉네임 및 종합 평가정보 등 구인자가 한눈에 필요로 하는 정보들
	private int p_application_id;	// 공고 지원 아이디
	private int par_id;				// 공고 지원 응답 아이디
	private int s_id;
	private int status_id;
	private String nickname;
	private double score;
	private String state;			// 상태
	private String response_date;	// 응답 일자
	
	
	
	public int getPar_id()
	{
		return par_id;
	}
	public void setPar_id(int par_id)
	{
		this.par_id = par_id;
	}
	public int getStatus_id()
	{
		return status_id;
	}
	public void setStatus_id(int status_id)
	{
		this.status_id = status_id;
	}
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
	public String getResponse_date()
	{
		return response_date;
	}
	public void setResponse_date(String response_date)
	{
		this.response_date = response_date;
	}
	public int getP_application_id()
	{
		return p_application_id;
	}
	public void setP_application_id(int p_application_id)
	{
		this.p_application_id = p_application_id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public double getScore()
	{
		return score;
	}
	public void setScore(double score)
	{
		this.score = score;
	}
	
	
}
