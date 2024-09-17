package com.test.prj;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NotificationController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="notification.action", method = RequestMethod.GET )
	public String notificationSummary(Model model,HttpSession session)
	{
		String result = "/WEB-INF/view/NotificationSummary.jsp";
		
		String user_id = (String)session.getAttribute("user_id");
		int notiCount = 0;

		INotificationDAO dao = sqlSession.getMapper(INotificationDAO.class);
		
		// 개설 초대 관련 알림
		/* 개설자가 상대방에게 초대를 보낸 후 상대방이 수락하면 받게되는 알림 */
		ArrayList<NotificationDTO> preInviteNoti = dao.findPreInviteNoti(user_id);
		
		
		
		
		
		
		
		// 알림 갯수 체크
		notiCount += preInviteNoti.size();
		
		
		model.addAttribute("preInviteNoti", preInviteNoti);
		
		
		model.addAttribute("notiCount", notiCount);
		
		return result;
	}
	
	
	@RequestMapping(value="notidelete.action", method = RequestMethod.GET )
	public String notificationDelete(@RequestParam("del_id") String del_id, Model model)
	{
		
		INotificationDAO dao = sqlSession.getMapper(INotificationDAO.class);
		
		
		System.out.println(del_id);
		model.addAttribute("result",dao.deletepreInviteNoti(del_id) ); 
		
		return "/WEB-INF/view/NotiAjax.jsp";
	}
}
