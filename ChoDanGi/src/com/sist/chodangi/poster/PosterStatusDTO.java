package com.sist.chodangi.poster;

public class PosterStatusDTO
{
	private int por_id;						// 공고 제안 응답 번호
	private int par_id;						// 공고 지원 응답 번호
	private int p_id;						// 공고 번호
	private String title;					// 공고 제목
	private String closing_time;			// 공고 마감시간
	private String work_start_time;			// 근무 시작시간
	private String work_end_time;			// 근무 종료시간
	private String location_name;			// 근무지 위치
	private int count;						// 지원자 수
	private int headcount;					// 모집인원수
	private String state;					// 공개여부(공개/비공개)
	private int hourly_wage;				// 시급
	private String company_name;			// 회사명
	
	
	public int getPor_id()
	{
		return por_id;
	}
	public void setPor_id(int por_id)
	{
		this.por_id = por_id;
	}
	public int getPar_id()
	{
		return par_id;
	}
	public void setPar_id(int par_id)
	{
		this.par_id = par_id;
	}
	public int getP_id()
	{
		return p_id;
	}
	public void setP_id(int p_id)
	{
		this.p_id = p_id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getClosing_time()
	{
		return closing_time;
	}
	public void setClosing_time(String closing_time)
	{
		this.closing_time = closing_time;
	}
	public String getWork_start_time()
	{
		return work_start_time;
	}
	public void setWork_start_time(String work_start_time)
	{
		this.work_start_time = work_start_time;
	}
	public String getWork_end_time()
	{
		return work_end_time;
	}
	public void setWork_end_time(String work_end_time)
	{
		this.work_end_time = work_end_time;
	}
	public String getLocation_name()
	{
		return location_name;
	}
	public void setLocation_name(String location_name)
	{
		this.location_name = location_name;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
	public int getHeadcount()
	{
		return headcount;
	}
	public void setHeadcount(int headcount)
	{
		this.headcount = headcount;
	}
	public String getState()
	{
		return state;
	}
	public void setState(String state)
	{
		this.state = state;
	}
	public int getHourly_wage()
	{
		return hourly_wage;
	}
	public void setHourly_wage(int hourly_wage)
	{
		this.hourly_wage = hourly_wage;
	}
	public String getCompany_name()
	{
		return company_name;
	}
	public void setCompany_name(String company_name)
	{
		this.company_name = company_name;
	}
	
}
