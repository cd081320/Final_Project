/*
 * IAdminDAO.java
 */
package com.sist.chodangi.admin;

public interface IAdminDAO
{
	public int login(AdminDTO admin);
	
	public int headcount(AdminDTO admin);
	
	public int change_headcount(AdminDTO admin);
}
