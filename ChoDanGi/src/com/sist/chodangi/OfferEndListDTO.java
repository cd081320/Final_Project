package com.sist.chodangi;

public class OfferEndListDTO
{
	private String title;		 		// 공고 제목
	private String company_name;		// 회사 이름
	private String location_name;		// 지역 이름
	private String category_name;		// 분야 이름
	private String hourly_wage;			// 시급
	private String work_start_time;		// 근무 시작 시간
	private String wokr_end_time;		// 근무 종료 시간
	private String seeker_nickname;		// 구직자 닉네임
	
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getCompany_name()
	{
		return company_name;
	}
	public void setCompany_name(String company_name)
	{
		this.company_name = company_name;
	}
	public String getLocation_name()
	{
		return location_name;
	}
	public void setLocation_name(String location_name)
	{
		this.location_name = location_name;
	}
	public String getCategory_name()
	{
		return category_name;
	}
	public void setCategory_name(String category_name)
	{
		this.category_name = category_name;
	}
	public String getHourly_wage()
	{
		return hourly_wage;
	}
	public void setHourly_wage(String hourly_wage)
	{
		this.hourly_wage = hourly_wage;
	}
	public String getWork_start_time()
	{
		return work_start_time;
	}
	public void setWork_start_time(String work_start_time)
	{
		this.work_start_time = work_start_time;
	}
	public String getWokr_end_time()
	{
		return wokr_end_time;
	}
	public void setWokr_end_time(String wokr_end_time)
	{
		this.wokr_end_time = wokr_end_time;
	}
	public String getSeeker_nickname()
	{
		return seeker_nickname;
	}
	public void setSeeker_nickname(String seeker_nickname)
	{
		this.seeker_nickname = seeker_nickname;
	}
	
	
}
