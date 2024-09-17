package com.test.prj;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "admin.action", method = RequestMethod.GET)
	public String admin(Model model)
	{
		String result = "/WEB-INF/view/Admin.jsp";
		
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		
		// 현재 이용자 수 불러오기
		int countUser = dao.countUser();
		
		// 신규 이용자 불러오기
		int countNewUser = dao.countNewUser();
		
		// 현재 그룹 수 불러오기
		int countGroup = dao.countGroup();
		
		// 신규 그룹 불러오기
		int countNewGroup = dao.countNewGroup();
		
		// 총 모먼트 불러오기
		int countMoment = dao.countMoment();
		
		// 신규 모먼트 불러오기
		int countNewMoment = dao.countNewMoment();
		
		// 모먼트 페이즈 별 숫자 불러오기
		int[] countPhaseMoment = dao.countPhaseMoment();
		
		// 최근 7일간의 그룹 수 불러오기
		ArrayList<AdminDTO> countGroupChange = dao.countGroupChange();
		// 최근 7일간의 모먼트 수 불러오기 
		ArrayList<AdminDTO> countMomentChange = dao.countMomentChange();
		// 최근 7일간의 유저 수 불러오기
		ArrayList<AdminDTO> countUserChange = dao.countUserChange();
		
		//남녀 수 각각 불러오기
		int[] countGender = dao.countGender();
		
		// 웹 어플리케이션 그룹 리스트 불러오기
		ArrayList<GroupDTO> groupList = dao.groupList();
		
		model.addAttribute("countUser", countUser);
		model.addAttribute("countNewUser", countNewUser);
		model.addAttribute("countGroup", countGroup);
		model.addAttribute("countNewGroup", countNewGroup);
		model.addAttribute("countMoment", countMoment);
		model.addAttribute("countNewMoment", countNewMoment);
		model.addAttribute("countPhaseMoment", countPhaseMoment);
		model.addAttribute("countGroupChange", countGroupChange);
		model.addAttribute("countMomentChange", countMomentChange);
		model.addAttribute("countUserChange", countUserChange);
		model.addAttribute("countGender", countGender);
		model.addAttribute("groupList", groupList);
		
		
		
		
		return result;
	}

}
