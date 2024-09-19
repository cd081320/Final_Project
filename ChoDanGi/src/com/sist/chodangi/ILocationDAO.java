package com.sist.chodangi;
/*
 * ILocationDAO.java
 */

import java.util.ArrayList;

public interface ILocationDAO
{
	// 해당 id의 하위 지역 리스트
	// ex) 1(서울시) -> 2, 종로구 / 3, 중구 / 4, 용산구 ...
	public ArrayList<LocationDTO> subList(Integer id);
	
	// 최상위 지역 리스트
	public ArrayList<LocationDTO> topList();
}
