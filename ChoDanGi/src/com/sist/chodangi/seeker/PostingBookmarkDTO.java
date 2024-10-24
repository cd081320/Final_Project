package com.sist.chodangi.seeker;

public class PostingBookmarkDTO
{
	private int id;				// 
	private int posting_id;		// 공고 아이디
	private int s_id;			// 구직자 아이디
	private String alias;		// 즐겨찾기 별칭
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getPosting_id()
	{
		return posting_id;
	}
	public void setPosting_id(int posting_id)
	{
		this.posting_id = posting_id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public String getAlias()
	{
		return alias;
	}
	public void setAlias(String alias)
	{
		this.alias = alias;
	}
}
