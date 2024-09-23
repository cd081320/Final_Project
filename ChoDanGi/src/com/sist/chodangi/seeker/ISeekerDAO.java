/*
 * ISeekerDAO.java
 */
package com.sist.chodangi.seeker;

import org.apache.ibatis.annotations.Param;

public interface ISeekerDAO
{
	public int login(SeekerDTO dto);
	public SeekerDTO searchById(int s_id);
	public int searchLoginId(String login_id);
	public int searchNickname(String nickname);
	public int addSeeker(SeekerDTO dto);
	public int addSeekerInfo(SeekerDTO dto);
	public int addSeekerCategory(SeekerCategoryDTO dto);
	public int updatePw(@Param("s_id") int s_id, @Param("cur_pw") String cur_pw, @Param("login_pw") String login_pw);
	public String nickname(int s_id);
}
