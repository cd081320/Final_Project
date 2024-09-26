package com.sist.chodangi.seeker;

public interface ISeekerPhotoDAO
{
	public int add(SeekerPhotoDTO dto);
	public SeekerPhotoDTO search(int s_id);
	public int modify(SeekerPhotoDTO dto);
	public int remove(int s_id);
}
