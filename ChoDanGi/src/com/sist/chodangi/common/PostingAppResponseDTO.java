package com.sist.chodangi.common;

public class PostingAppResponseDTO
{
	private int id;					// 공고지원응답 id
	private int status_id;			// 현 상태 id
	private int p_application_id;	// 공고 지원 id
	private int p_id;				// 구인자 id
	private String response_date;	// 응답 일시(일시분)
	private String state;			// 현 상태
	
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getStatus_id()
	{
		return status_id;
	}
	public void setStatus_id(int status_id)
	{
		this.status_id = status_id;
	}
	public int getP_application_id()
	{
		return p_application_id;
	}
	public void setP_application_id(int p_application_id)
	{
		this.p_application_id = p_application_id;
	}
	public int getP_id()
	{
		return p_id;
	}
	public void setP_id(int p_id)
	{
		this.p_id = p_id;
	}
	public String getResponse_date()
	{
		return response_date;
	}
	public void setResponse_date(String response_date)
	{
		this.response_date = response_date;
	}
}
