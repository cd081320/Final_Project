package com.sist.chodangi.seeker;

public class SeekerHistoryDTO
{
	private int posting_id;			// 공고번호
	private String title;			// 공고제목
	private String company_name;	// 업체이름
	private String work_start_time;	// 공고 근무 시작시간
	private String work_end_time;	// 공고 근무 종료시간

	
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public int getPosting_id()
	{
		return posting_id;
	}
	public void setPosting_id(int posting_id)
	{
		this.posting_id = posting_id;
	}
	public String getCompany_name()
	{
		return company_name;
	}
	public void setCompany_name(String company_name)
	{
		this.company_name = company_name;
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
}
