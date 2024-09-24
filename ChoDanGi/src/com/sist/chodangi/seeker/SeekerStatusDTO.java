package com.sist.chodangi.seeker;

public class SeekerStatusDTO
{
	private int par_id;				// 공고 지원 응답 번호
	private int por_id;				// 공고 제안 응답 번호
	private int c_id;				// 회사 번호
	private int p_id;				// 공고 번호
	private int s_id;				// 구직자 번호
	private int status_id;			// 공고 상태 번호
	private int count;				// 조회수
	private int headcount;			// 모집인원
	private int hourly_wage;		// 시급
	private String title;			// 제목
	private String closing_time;	// 마감 시간
	private String work_start_time;	// 시작 시간
	private String work_end_time;	// 종료 시간
	private String location_name;	// 지역 이름
	private String state;			// 상태
	private String company_name;	// 회사명
	

	public int getStatus_id()
	{
		return status_id;
	}

	public void setStatus_id(int status_id)
	{
		this.status_id = status_id;
	}

	public int getS_id()
	{
		return s_id;
	}

	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}

	public int getPar_id()
	{
		return par_id;
	}

	public void setPar_id(int par_id)
	{
		this.par_id = par_id;
	}

	public int getPor_id()
	{
		return por_id;
	}

	public void setPor_id(int por_id)
	{
		this.por_id = por_id;
	}

	public int getHourly_wage()
	{
		return hourly_wage;
	}

	public void setHourly_wage(int hourly_wage)
	{
		this.hourly_wage = hourly_wage;
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

	public int getC_id()
	{
		return c_id;
	}

	public void setC_id(int c_id)
	{
		this.c_id = c_id;
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

	public String getState()
	{
		return state;
	}

	public void setState(String state)
	{
		this.state = state;
	}

}
