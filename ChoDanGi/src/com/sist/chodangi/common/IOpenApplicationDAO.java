package com.sist.chodangi.common;

import java.util.ArrayList;

import com.sist.chodangi.seeker.OpenApplicationDTO;

public interface IOpenApplicationDAO
{
//	public ArrayList<OpenApplicationDTO> list();
	public ArrayList<OpenApplicationDTO> list(int s_id);
	public int add(OpenApplicationDTO dto);
	public int remove(int id);
}
