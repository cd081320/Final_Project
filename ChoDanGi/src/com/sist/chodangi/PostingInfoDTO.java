package com.sist.chodangi;

public class PostingInfoDTO
{
	private String title;			// 제목
	private String c_name;			// 카테고리 이름
	private String work_content;	// 근무 내용
	private String l_name;			// 지역 이름
	private String hourly_wage;		// 시급
	private String gender;			// 성별
	private String posting_date;	// 작성일자
	private String work_start_time;	// 근무 시작 시간
	private String work_end_time;	// 근무 종료 일자
	private String closing_time;	// 마감 일자
	private String postaddr;		// 우편 번호
	private String company_name;	// 회사명
	private String roadaddr;		// 도로명주소
	private String company_location;// 회사 상세 주소
	private int headcount;			// 조회수
	private int id;					// 공고 아이디
	
	public String getCompany_location()
	{
		return company_location;
	}
	public void setCompany_location(String company_location)
	{
		this.company_location = company_location;
	}
	public String getRoadaddr()
	{
		return roadaddr;
	}
	public void setRoadaddr(String roadaddr)
	{
		this.roadaddr = roadaddr;
	}
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getCompany_name()
	{
		return company_name;
	}
	public void setCompany_name(String company_name)
	{
		this.company_name = company_name;
	}
	public String getPostaddr()
	{
		return postaddr;
	}
	public void setPostaddr(String postaddr)
	{
		this.postaddr = postaddr;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getC_name()
	{
		return c_name;
	}
	public void setC_name(String c_name)
	{
		this.c_name = c_name;
	}
	public String getWork_content()
	{
		return work_content;
	}
	public void setWork_content(String work_content)
	{
		this.work_content = work_content;
	}
	public String getL_name()
	{
		return l_name;
	}
	public void setL_name(String l_name)
	{
		this.l_name = l_name;
	}
	public String getHourly_wage()
	{
		return hourly_wage;
	}
	public void setHourly_wage(String hourly_wage)
	{
		this.hourly_wage = hourly_wage;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getPosting_date()
	{
		return posting_date;
	}
	public void setPosting_date(String posting_date)
	{
		this.posting_date = posting_date;
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
	public String getClosing_time()
	{
		return closing_time;
	}
	public void setClosing_time(String closing_time)
	{
		this.closing_time = closing_time;
	}
	public int getHeadcount()
	{
		return headcount;
	}
	public void setHeadcount(int headcount)
	{
		this.headcount = headcount;
	} 
	
	
}
