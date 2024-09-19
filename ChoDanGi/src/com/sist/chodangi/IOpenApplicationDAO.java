package com.sist.chodangi;

import java.util.ArrayList;

public interface IOpenApplicationDAO
{
//	public ArrayList<OpenApplicationDTO> list();
	public ArrayList<OpenApplicationDTO> list(int s_id);
	public int add(OpenApplicationDTO dto);
	public int remove(int id);
}
