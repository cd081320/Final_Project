package com.sist.chodangi.seeker;

public class SeekerPhotoDTO
{
	private int id;				// 프로필 사진 번호
	private int s_id;			// 구직자 번호
	private int file_id;		// 파일 번호
	
	private String path;		// 파일 경로
	private String file_name;	// 파일 이름
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getS_id()
	{
		return s_id;
	}
	public void setS_id(int s_id)
	{
		this.s_id = s_id;
	}
	public int getFile_id()
	{
		return file_id;
	}
	public void setFile_id(int file_id)
	{
		this.file_id = file_id;
	}
	public String getPath()
	{
		return path;
	}
	public void setPath(String path)
	{
		this.path = path;
	}
	public String getFile_name()
	{
		return file_name;
	}
	public void setFile_name(String file_name)
	{
		this.file_name = file_name;
	}
}
