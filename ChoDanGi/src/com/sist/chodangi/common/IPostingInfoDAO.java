package com.sist.chodangi.common;

import java.util.ArrayList;

public interface IPostingInfoDAO
{
	public PostingInfoDTO info(PostingInfoDTO dto);
	// 구직자에게 보여줄 공고 리스트
	public ArrayList<PostingInfoDTO> list();
}
