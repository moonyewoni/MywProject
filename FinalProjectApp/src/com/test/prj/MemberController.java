/*============================
 	MemberController.java
============================*/

package com.test.prj;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/memberinsertform.action")
	public String MemberInsertForm(Model model)
	{
		String result = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		model.addAttribute("findList", dao.findList());
		
		result = "/WEB-INF/view/MemberInsertForm.jsp";
		
		return result;
	}
	
	@RequestMapping("/memberidcount.action")
	public String memberIdCount(String my_id)
	{
		String result = null;
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		result = "/WEB-INF/view/MyIdCountAjax.jsp?count=" + dao.idCount(my_id);
		
		return result;
	}
	
	@RequestMapping("/membernamecount.action")
	public String memberNameInsert(String user_name)
	{
		String result = null;
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		result = "/WEB-INF/view/NameCountAjax.jsp?count=" + dao.nameCount(user_name);
		
		return result;
	}
	
	@RequestMapping(value = "/memberinsert.action", method = RequestMethod.POST)
	public String userInsert(MemberDTO dto)
	{
		String result = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);

		int count = dao.userCount();
		
		String user_id = String.format("US0%s", count + 1);
		dto.setUser_id(user_id);
		dao.addUser(dto.getUser_id());
		
		dao.addUserInformation(dto);
		
		result = "redirect:main.action";
		
		return result;
	}
	
	/*
	@RequestMapping("/group.action")
	public String momentList(Model model, String group_id)
	{
		String result = null;
		group_id = "GR01";
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("count", dao.count(group_id));
		model.addAttribute("list", dao.list(group_id));
		
		result = "/WEB-INF/view/Group.jsp";
		
		return result;
	}
	
	
	
	@RequestMapping("/momentoperform.action")
	public String MomentOperForm(Model model, String group_id)
	{
		String result = null;
		group_id = "GR01";
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("countMember", dao.countMember(group_id));
		result = "/WEB-INF/view/MomentOperForm.jsp";
		
		return result;
	}
	
	@RequestMapping("/momentdateinsert.action")
	public String momentDateInsert(Model model, String year, String month, String day, String time)
	{
		String result = null;
		MemberDTO dto = new MemberDTO();
		
		day = day.trim();
		day = day.replace("%20", "");
		
		if (day.equals("-1"))
			day = "";
		
		if (time.equals("-1"))
			time = "";
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);

		int count = dao.countDate();
		String date_id = String.format("MD0%s", count + 1);
		
		dto.setDate_id(date_id);
		dto.setYear(year);
		dto.setMonth(month);
		dto.setDay(day);
		dto.setTime(time);
	  
		dao.addDate(dto);
		
		model.addAttribute("date_id", dto.getDate_id());
		model.addAttribute("year", dto.getYear());
		model.addAttribute("month", dto.getMonth());
		model.addAttribute("day", dto.getDay());
		model.addAttribute("time", dto.getTime());
		
		result = "/WEB-INF/view/MomentDateAjax.jsp";
		
		return result;
	}
	
	@RequestMapping("/momentplaceinsert.action")
	public String momentPlaceInsert(Model model, String place_name, String detail_id)
	{
		String result = null;
		MemberDTO dto = new MemberDTO();
		
		if (detail_id.equals("1"))
			detail_id = "ML01";
		else if (detail_id.equals("2"))
			detail_id = "ML02";
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		int count = dao.countPlace();
		String place_id = String.format("MP0%s", count + 1);
		
		dto.setPlace_id(place_id);
		dto.setPlace_name(place_name);
		dto.setDetail_id(detail_id);
		
		dao.addPlace(dto);
		
		model.addAttribute("place_id", dto.getPlace_id());
		model.addAttribute("place_name", dto.getPlace_name());
		
		result = "/WEB-INF/view/MomentPlaceAjax.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value = "/studentinsert.action", method = RequestMethod.POST)
	public String studentInsert(StudentDTO s)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.add(s);
		
		result = "redirect:studentlist.action";
		
		return result;
	}
	
	@RequestMapping(value = "/studentupdateform.action", method = RequestMethod.GET)
	public String studentUpdateForm(String sid, Model model)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("search", dao.search(sid));
		
		result = "/WEB-INF/view/StudentUpdateForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/studentupdate.action", method = RequestMethod.POST)
	public String studentUpdate(StudentDTO s)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.modify(s);
		
		result = "redirect:studentlist.action";
		
		return result;
	}
	
	@RequestMapping("/studentdelete.action")
	public String studentDelete(String sid)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.remove(sid);
		
		result = "redirect:studentlist.action";
		
		return result;
	}
	*/
}
