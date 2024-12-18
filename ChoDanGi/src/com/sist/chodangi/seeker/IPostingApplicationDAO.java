package com.sist.chodangi.seeker;

import java.util.ArrayList;
import org.springframework.web.bind.annotation.RequestParam;

public interface IPostingApplicationDAO
{
	public int add(PostingApplicationDTO dto);
	public int search(PostingApplicationDTO dto);
	public ArrayList<PostingApplicationDTO> searchByPosting(@RequestParam int posting_id);
	public int remove(int id);
	
	// 해당 공고 작성 구인자 아이디 찾기
	public int searchPId(int posting_id);
}
