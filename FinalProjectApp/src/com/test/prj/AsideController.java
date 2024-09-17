package com.test.prj;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class AsideController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="header.action", method = RequestMethod.GET )
	public String headerLoad(Model model,HttpSession session)
	{
		String result = "";
		
		IPersonalDAO dao = sqlSession.getMapper(IPersonalDAO.class);
		
		// 유저 아이디를 받아 개인페이지에 표기할 정보들 받아오
		
		String user_id = (String)session.getAttribute("user_id");
		
		// 유저의 정보(이름, 생일) 가져오기
		MemberDTO userinfo = dao.findInfo(user_id);
		
		
		
		model.addAttribute("userinfo", userinfo);
		
		result = "/WEB-INF/view/Header.jsp";
		
		return result;
	}
	
	@RequestMapping(value="aside.action", method = RequestMethod.GET )
	public String asideLoad(Model model,HttpSession session)
	{
		String result = "";
		
		IPersonalDAO dao = sqlSession.getMapper(IPersonalDAO.class);
		
		// 유저 아이디를 받아 개인페이지에 표기할 정보들 받아오
		
		String user_id = (String)session.getAttribute("user_id");
		
		
		// 그룹리스트 가져오기
		ArrayList<GroupDTO> groupList= dao.findGroup(user_id);
		
		// 모먼트 리스트 가져오기
		ArrayList<MomentDTO> momentList = dao.findMoment(user_id);
		
		
		
		
		
		
		model.addAttribute("groupList", groupList);
		model.addAttribute("momentList", momentList);
		
		result = "/WEB-INF/view/Aside.jsp";
		
		return result;
	}
}
