package com.sist.chodangi.common;

public class PostingOffResponseDTO
{
	private int id;					// 공고제안응답 id
	private int status_id;			// 현 상태 id
	private int offer_id;			// 공고 제안 id
	private int s_id;				// 구직자 id
	private String response_date;	// 응답 일시(일시분)
	private String state;			// 현 상태

	
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
	public int getOffer_id()
	{
		return offer_id;
	}
	public void setOffer_id(int offer_id)
	{
		this.offer_id = offer_id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public String getResponse_date()
	{
		return response_date;
	}
	public void setResponse_date(String response_date)
	{
		this.response_date = response_date;
	}
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
}
