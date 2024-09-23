package com.sist.chodangi.poster;

public class PosterDTO
{
	private int p_id;						// 구인자 번호
	private int pi_id;						// 구인자 정보 번호
	private int gender_id;					// 성별 번호
	private String login_id;				// 구인자 아이디
	private String login_pw;				// 구인자 비밀번호
	private String name;					// 구인자 이름
	private String tel;						// 구인자 전화번호
	private String email;					// 구인자 이메일
	private String ssn_front;				// 구인자 주민번호 앞자리
	
	
	public int getGender_id()
	{
		return gender_id;
	}
	public void setGender_id(int gender_id)
	{
		this.gender_id = gender_id;
	}
	public String getSsn_front()
	{
		return ssn_front;
	}
	public void setSsn_front(String ssn_front)
	{
		this.ssn_front = ssn_front;
	}
	public int getP_id()
	{
		return p_id;
	}
	public void setP_id(int p_id)
	{
		this.p_id = p_id;
	}
	
	public int getPi_id()
	{
		return pi_id;
	}
	public void setPi_id(int pi_id)
	{
		this.pi_id = pi_id;
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

}
