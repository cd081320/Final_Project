package com.sist.chodangi;

public class JobPostingStatusDTO
{
	private String postingId; 		// 공고 아이디
	private String title;         	// 공고 제목
	private String closingTime;   	// 공고 마감 시간
	private String workStartTime; 	// 근무 시작 시간
	private String workEndTime;   	// 근무 종료 시간
	private String locationName;  	// 근무지 위치 이름
	private int count;            	// 지원자 수
	private int headcount;        	// 모집 인원 수
	private String openStatus;    	// 공고 상태
	private int hourlyWage;			// 시급
	private String companyName;		// 회사이름
	private String workContent;		// 공고 내용
	private String categoryName;	// 분야이름
	private String nickName;      // 구직자 닉네임
	
	
	public String getNickName()
	{
		return nickName;
	}
	public void setNickName(String nickName)
	{
		this.nickName = nickName;
	}
	public String getPostingId()
	{
		return postingId;
	}
	public void setPostingId(String postingId)
	{
		this.postingId = postingId;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getClosingTime()
	{
		return closingTime;
	}
	public void setClosingTime(String closingTime)
	{
		this.closingTime = closingTime;
	}
	public String getWorkStartTime()
	{
		return workStartTime;
	}
	public void setWorkStartTime(String workStartTime)
	{
		this.workStartTime = workStartTime;
	}
	public String getWorkEndTime()
	{
		return workEndTime;
	}
	public void setWorkEndTime(String workEndTime)
	{
		this.workEndTime = workEndTime;
	}
	public String getLocationName()
	{
		return locationName;
	}
	public void setLocationName(String locationName)
	{
		this.locationName = locationName;
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
	public String getOpenStatus()
	{
		return openStatus;
	}
	public void setOpenStatus(String openStatus)
	{
		this.openStatus = openStatus;
	}
	public int getHourlyWage()
	{
		return hourlyWage;
	}
	public void setHourlyWage(int hourlyWage)
	{
		this.hourlyWage = hourlyWage;
	}
	public String getCompanyName()
	{
		return companyName;
	}
	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}
	public String getWorkContent()
	{
		return workContent;
	}
	public void setWorkContent(String workContent)
	{
		this.workContent = workContent;
	}
	public String getCategoryName()
	{
		return categoryName;
	}
	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}
	
	
}
