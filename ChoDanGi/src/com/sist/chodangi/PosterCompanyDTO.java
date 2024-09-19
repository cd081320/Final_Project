package com.sist.chodangi;

public class PosterCompanyDTO
{
	private int c_id;				// 회사 번호
	private int pci_id;				// 회사 정보 번호
	private int pi_id;				// 구인자 정보 번호
	
	private int location_id;		// 지역 번호
	
	private String name;			// 회사 이름
	private String location; 		// 회사 상세 위치
	private String details;			// 회사 상세 정보
	private String company_date;	// 회사 등록 일자
	private String business_id;		// 사업자 등록 번호
	private String postaddr;		// 회사 우편번호
	private String extraAddr;		// 회사 xx동
	
	
	public int getC_id()
	{
		return c_id;
	}
	public void setC_id(int c_id)
	{
		this.c_id = c_id;
	}
	public int getPci_id()
	{
		return pci_id;
	}
	public void setPci_id(int pci_id)
	{
		this.pci_id = pci_id;
	}
	public int getPi_id()
	{
		return pi_id;
	}
	public void setPi_id(int pi_id)
	{
		this.pi_id = pi_id;
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
	public int getLocation_id()
	{
		return location_id;
	}
	public void setLocation_id(int location_id)
	{
		this.location_id = location_id;
	}
	public String getDetails()
	{
		return details;
	}
	public void setDetails(String details)
	{
		this.details = details;
	}
	public String getCompany_date()
	{
		return company_date;
	}
	public void setCompany_date(String company_date)
	{
		this.company_date = company_date;
	}
	public String getBusiness_id()
	{
		return business_id;
	}
	public void setBusiness_id(String business_id)
	{
		this.business_id = business_id;
	}
	public String getPostaddr()
	{
		return postaddr;
	}
	public void setPostaddr(String postaddr)
	{
		this.postaddr = postaddr;
	}
	public String getExtraAddr()
	{
		return extraAddr;
	}
	public void setExtraAddr(String extraAddr)
	{
		this.extraAddr = extraAddr;
	}
	
	
}
