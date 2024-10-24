package com.sist.chodangi.seeker;

public interface IPostingBookmarkDAO
{
	// 추가
	public int add(PostingBookmarkDTO dto);
	
	// 제거
	public int remove(int id);
	
	// 찾기
	public int search(PostingBookmarkDTO dto);
}
