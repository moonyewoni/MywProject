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
public class PersonalController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="personal.action", method = RequestMethod.GET )
	public String PersonalLoad(Model model,HttpSession session)
	{
		String result = "";
		
		IPersonalDAO dao = sqlSession.getMapper(IPersonalDAO.class);
		
		// 유저 아이디를 받아 개인페이지에 표기할 정보들 받아오
		
		String user_id = (String)session.getAttribute("user_id");
		
		// 유저의 정보(이름, 생일) 가져오기
		MemberDTO userinfo = dao.findInfo(user_id);
		
		// 그룹리스트 가져오기
		ArrayList<GroupDTO> groupList= dao.findGroup(user_id);
		
		// 모먼트 리스트 가져오기
		ArrayList<MomentDTO> momentList = dao.findMoment(user_id);
		
		// 가장 최근 모먼트 가져오기
		MomentDTO recentMoment = dao.findRecent(user_id);
		
		// 가장 가까운 다음 모먼트 가져오기
		MomentDTO nextMoment = dao.findNext(user_id);
		
		// 빌딩 중인 모먼트 가져오기
		ArrayList<MomentDTO> buildingMoment = dao.findBuilding(user_id);
		
		//모먼트 서머리 가져오기
		ArrayList<MomentDTO> summaryMoment = dao.findSummary(user_id);
		
		
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("groupList", groupList);
		model.addAttribute("momentList", momentList);
		model.addAttribute("recentMoment", recentMoment);
		model.addAttribute("nextMoment", nextMoment);
		model.addAttribute("buildingMoment", buildingMoment);
		model.addAttribute("summaryMoment", summaryMoment);
		
		result = "/WEB-INF/view/Personal.jsp";
		
		return result;
	}
	
	@RequestMapping(value="personalcalendar.action", method = RequestMethod.GET )
	public String PersonalCalendarLoad(Model model,HttpSession session)
	{
		
		IPersonalDAO dao = sqlSession.getMapper(IPersonalDAO.class);
		String user_id = (String)session.getAttribute("user_id");
		
		// 모먼트 리스트 가져오기
		ArrayList<MomentDTO> momentList = dao.findMoment(user_id);
		
		model.addAttribute("momentList", momentList);
		return "/WEB-INF/view/PersonalCalendar.jsp";
	}
	
}
