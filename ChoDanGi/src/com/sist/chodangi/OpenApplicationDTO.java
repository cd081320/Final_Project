package com.sist.chodangi;

public class OpenApplicationDTO
{
	// 오픈지원서 번호, 구직자 번호, 지역번호 
	private int id, s_id, location_id;
	// 지원서 마감 시간, 근무 시작 시간, 근무 종료 시간, 작성 일자, 조회수
	private String closing_date, start_date, end_date, create_date, view_count;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public int getLocation_id()
	{
		return location_id;
	}
	public void setLocation_id(int location_id)
	{
		this.location_id = location_id;
	}
	public String getClosing_date()
	{
		return closing_date;
	}
	public void setClosing_date(String closing_date)
	{
		this.closing_date = closing_date;
	}
	public String getStart_date()
	{
		return start_date;
	}
	public void setStart_date(String start_date)
	{
		this.start_date = start_date;
	}
	public String getEnd_date()
	{
		return end_date;
	}
	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}
	public String getCreate_date()
	{
		return create_date;
	}
	public void setCreate_date(String create_date)
	{
		this.create_date = create_date;
	}
	public String getView_count()
	{
		return view_count;
	}
	public void setView_count(String view_count)
	{
		this.view_count = view_count;
	}
}
