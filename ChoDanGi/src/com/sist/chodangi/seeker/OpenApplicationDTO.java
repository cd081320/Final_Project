package com.sist.chodangi.seeker;

public class OpenApplicationDTO
{
	
	private int id;					// 오픈지원서 번호
	private int s_id;				// 구직자 번호
	private int location_id; 		// 지역번호 
	private String closing_date;	// 지원서 마감 시간
	private String start_date;		// 근무 시작 시간
	private String end_date;		// 근무 종료 시간
	private String create_date;		// 작성 일자
	private String view_count;		// 조회수
	private String name;			// 구직자 이름
	private String tel;				// 전화번호
	private String email;			// 이메일
	private boolean offerd;			// 제안여부
	
	

	public boolean isOfferd()
	{
		return offerd;
	}
	public void setOfferd(boolean offerd)
	{
		this.offerd = offerd;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
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
