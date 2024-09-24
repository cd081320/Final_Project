package com.sist.chodangi.seeker;

public interface IPostingApplicationDAO
{
	public int add(PostingApplicationDTO dto);
	public int search(PostingApplicationDTO dto);
	public int remove(int id);
}
