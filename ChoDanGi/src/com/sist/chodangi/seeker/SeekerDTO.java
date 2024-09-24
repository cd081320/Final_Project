package com.sist.chodangi.seeker;

public class SeekerDTO
{
	
	private int id;				// 식별 아이디
	private int gender_id;		// 성별코드
	private int location_id;	// 지역코드
	private String login_id;	// 로그인 아이디
	private String login_pw;	// 로그인 비밀번호
	private String nickname;	// 닉네임
	private String name;		// 이름
	private String tel;			// 전화번호
	private String email;		// 이메일
	private String ssn_front;	// 주민번호 앞자리
	private String addr_detail;	// 상세 주소
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getGender_id()
	{
		return gender_id;
	}
	public void setGender_id(int gender_id)
	{
		this.gender_id = gender_id;
	}
	public int getLocation_id()
	{
		return location_id;
	}
	public void setLocation_id(int location_id)
	{
		this.location_id = location_id;
	}
	public String getLogin_id()
	{
		return login_id;
	}
	public void setLogin_id(String login_id)
	{
		this.login_id = login_id;
	}
	public String getLogin_pw()
	{
		return login_pw;
	}
	public void setLogin_pw(String login_pw)
	{
		this.login_pw = login_pw;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
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
	public String getSsn_front()
	{
		return ssn_front;
	}
	public void setSsn_front(String ssn_front)
	{
		this.ssn_front = ssn_front;
	}
	public String getAddr_detail()
	{
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail)
	{
		this.addr_detail = addr_detail;
	}
}
