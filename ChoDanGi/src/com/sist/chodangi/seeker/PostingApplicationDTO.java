package com.sist.chodangi.seeker;

public class PostingApplicationDTO
{
	private int id;			// 공고 지원 번호
	private int s_id;		// 구직자 번호
	private int posting_id;	// 공고 번호
	
	private String application_date;	// 공고 지원 일자

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

	public int getPosting_id()
	{
		return posting_id;
	}

	public void setPosting_id(int posting_id)
	{
		this.posting_id = posting_id;
	}

	public String getApplication_date()
	{
		return application_date;
	}

	public void setApplication_date(String application_date)
	{
		this.application_date = application_date;
	}
	
	
}
