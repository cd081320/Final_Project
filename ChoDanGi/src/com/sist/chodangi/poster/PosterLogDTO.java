package com.sist.chodangi.poster;

public class PosterLogDTO
{
	private int id;						// 로그 번호
	private int p_id;					// 구인자 로그 번호
	private String last_access_date;	// 구인자가 마지막으로 접속한 날
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getP_id()
	{
		return p_id;
	}
	public void setP_id(int p_id)
	{
		this.p_id = p_id;
	}
	public String getLast_access_date()
	{
		return last_access_date;
	}
	public void setLast_access_date(String last_access_date)
	{
		this.last_access_date = last_access_date;
	}
	
	
}
