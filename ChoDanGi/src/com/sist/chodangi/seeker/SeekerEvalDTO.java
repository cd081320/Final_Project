package com.sist.chodangi.seeker;

public class SeekerEvalDTO
{
	private String name;		// 이름
	private int score;			// 점수
	private int posting_id;		// 공고번호
	private int p_id;			// 구인자 번호
	private int s_id;			// 구직자 번호
	private int item_id;		// 항목 번호
	
	
	public int getPosting_id()
	{
		return posting_id;
	}
	public void setPosting_id(int posting_id)
	{
		this.posting_id = posting_id;
	}
	public int getP_id()
	{
		return p_id;
	}
	public void setP_id(int p_id)
	{
		this.p_id = p_id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public int getItem_id()
	{
		return item_id;
	}
	public void setItem_id(int item_id)
	{
		this.item_id = item_id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
	
	
}
