package com.sist.chodangi;

public class PostingDTO
{
	private int id;					// 공고 번호
	private int pci_id;				// 구인자 업체 정보 번호
	private int location_id;		// 지역 번호
	private int category_id;		// 분야 번호
	private int gender_id;			// 성별 번호
	private int public_status_id;	// 공개 여부 번호
	private String title;			// 제목
	private int hourly_wage;		// 시급
	private String closing_time;	// 모집 마감 시간
	private String work_start_time;	// 근무 시작 시간
	private String work_end_time;	// 근무 종료 시간
	private String posting_date;	// 작성일자
	private String work_content;	// 근무내용
	private int view_count;			// 조회수
	private int headcount;			// 모집인원수
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getPci_id()
	{
		return pci_id;
	}
	public void setPci_id(int pci_id)
	{
		this.pci_id = pci_id;
	}
	public int getLocation_id()
	{
		return location_id;
	}
	public void setLocation_id(int location_id)
	{
		this.location_id = location_id;
	}
	public int getCategory_id()
	{
		return category_id;
	}
	public void setCategory_id(int category_id)
	{
		this.category_id = category_id;
	}
	public int getGender_id()
	{
		return gender_id;
	}
	public void setGender_id(int gender_id)
	{
		this.gender_id = gender_id;
	}
	public int getPublic_status_id()
	{
		return public_status_id;
	}
	public void setPublic_status_id(int public_status_id)
	{
		this.public_status_id = public_status_id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public int getHourly_wage()
	{
		return hourly_wage;
	}
	public void setHourly_wage(int hourly_wage)
	{
		this.hourly_wage = hourly_wage;
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
	public String getPosting_date()
	{
		return posting_date;
	}
	public void setPosting_date(String posting_date)
	{
		this.posting_date = posting_date;
	}
	public String getWork_content()
	{
		return work_content;
	}
	public void setWork_content(String work_content)
	{
		this.work_content = work_content;
	}
	public int getView_count()
	{
		return view_count;
	}
	public void setView_count(int view_count)
	{
		this.view_count = view_count;
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
