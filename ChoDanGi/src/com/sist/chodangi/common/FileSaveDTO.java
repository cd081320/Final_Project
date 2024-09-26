package com.sist.chodangi.common;

public class FileSaveDTO
{
	private int id;						// 파일 저장 번호
	private int file_location_id;		// 파일 저장 위치 번호
	private String name;				// 파일 제목
	
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public int getFile_location_id()
	{
		return file_location_id;
	}
	public void setFile_location_id(int file_location_id)
	{
		this.file_location_id = file_location_id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
}
