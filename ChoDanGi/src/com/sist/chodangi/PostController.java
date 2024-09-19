package com.sist.chodangi;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PostController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 매개변수를 등록하는 과정에서 매개변수 목록(인자 리스트)에 적혀있는
	// 클래스의 객체 정보는 스프링이 제공한다.
	
	// 사용자 요청 주소와 메소드를 매핑하는 과정 필요
	// 『RequestMapping(value ="요청주소", method = 정송방식)』
	// 이 때, 전송 방식은 폼을 이용한 submit 액션인 경우만 POST
	// 나머지 전송 방식은 GET 으로처리한다.
	
	@RequestMapping(value="/postlist.action", method = RequestMethod.GET)
	public String postList(Model model)
	{
		IPostDAO dao = sqlSession.getMapper(IPostDAO.class);
		
		model.addAttribute("list", dao.list());
		
		return "/WEB-INF/view/PostList.jsp";
	}
}
