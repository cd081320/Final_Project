/*
 * 구직자가 끝낸 알바에 관한 DAO
 */
package com.sist.chodangi.seeker;

import java.util.ArrayList;

public interface ISeekerHistoryDAO
{
	// 완료 목록
	public ArrayList<SeekerHistoryDTO> list(int s_id);
}
