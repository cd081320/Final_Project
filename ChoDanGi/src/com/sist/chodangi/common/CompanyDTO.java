package com.sist.chodangi.common;

public class CompanyDTO
{
	private int id;				// 업체번호
	private int location_id;	// 지역번호
	private String name;		// 업체명
	private String location;	// 근무위치
	private String details;		// 업체상세내용
	private String postaddr;	// 우편번호
	private String roadaddr;	// 도로명주소
	
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getLocation_id()
	{
		return location_id;
	}
	public void setLocation_id(int location_id)
	{
		this.location_id = location_id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getLocation()
	{
		return location;
	}
	public void setLocation(String location)
	{
		this.location = location;
	}
	public String getDetails()
	{
		return details;
	}
	public void setDetails(String details)
	{
		this.details = details;
	}
	public String getPostaddr()
	{
		return postaddr;
	}
	public void setPostaddr(String postaddr)
	{
		this.postaddr = postaddr;
	}
	public String getRoadaddr()
	{
		return roadaddr;
	}
	public void setRoadaddr(String roadaddr)
	{
		this.roadaddr = roadaddr;
	}
}
