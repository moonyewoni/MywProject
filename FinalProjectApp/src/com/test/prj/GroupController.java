package com.test.prj;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@Controller
public class GroupController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 그룹 아이콘 저장할 절대경로 지정
	String PATH = "C:\\FinalStudy\\FinalApp02\\WebContent\\images\\img\\icon";
	
	@RequestMapping(value = "/grouplist.action", method = RequestMethod.GET)
	public String groupList(Model model, HttpSession session)
	{
		String result = "";
		
		String user_id = (String) session.getAttribute("user_id");
		

	    if (user_id == null)
	    {
	    	result = "redirect:loginform.action";
			return result;
	    }
	    
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		ArrayList<GroupDTO> list = new ArrayList<GroupDTO>();
		
		list = dao.list();
		
		for (GroupDTO dto : list)
		{
			String group_id = dto.getId();
			String memberCount = dao.groupMemberCount(group_id);
			dto.setMemberCount(memberCount);
		}
		
		GroupDTO dtoActive = dao.activeGroupId();
		String activeGroup_id = dtoActive.getGroup_id();
		String activeCount = dtoActive.getCount();
		
		GroupDTO dtoLarge = dao.largeGroupId();
		String largeGroup_id = dtoLarge.getGroup_id();
		String largeCount = dtoLarge.getCount();
		
		// 회원이 속한 그룹 코드 전달
		IPersonalDAO daoPersonal = sqlSession.getMapper(IPersonalDAO.class);
		ArrayList<GroupDTO> findGroup = daoPersonal.findGroup(user_id);
		
		
		model.addAttribute("findGroup", findGroup);
		model.addAttribute("largeGroup", dao.groupInformation(largeGroup_id));
		model.addAttribute("largeCount", largeCount);
		model.addAttribute("activeGroup", dao.groupInformation(activeGroup_id));
		model.addAttribute("activeCount", activeCount);
		model.addAttribute("count", dao.count());
		model.addAttribute("list", list);
		model.addAttribute("creationList", dao.creationList());
		model.addAttribute("creationCount", dao.creationCount());
		model.addAttribute("recentList", dao.recentList());
		
		
		result = "/WEB-INF/view/GroupList.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/searchgroup.action", method = RequestMethod.GET)
	public String searchGroup(Model model, HttpServletRequest request)
	{
		String result = "";
		
		String name = request.getParameter("keyword");
		
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		ArrayList<GroupDTO> resultList = new ArrayList<GroupDTO>();
		
		resultList = dao.searchGroupResult(name);
		
		model.addAttribute("count", dao.groupNameCount(name));
		model.addAttribute("resultList", resultList);
		
		
		result = "/WEB-INF/view/SearchGroup.jsp";
		
		
		
		return result;
	}
	
	@RequestMapping("/groupnamecount.action")
	public String groupNameCount(Model model, String name)
	{
		String result = "";
		
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		result = "/WEB-INF/view/GroupNameCountAjax.jsp?count=" + dao.groupNameCount(name);
		//System.out.println(dao.groupNameCount(name));
		

		return result;
	}
	
	
	@RequestMapping(value = "/groupcreationform.action", method = RequestMethod.GET)
	public String groupCreationForm(Model model, HttpSession session)
	{
		String result = "";
		
		String user_id = (String) session.getAttribute("user_id");

	    if (user_id == null)
	    {
	    	result = "redirect : loginform.action";
			return result;
	    }
		
	    
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		model.addAttribute("count", dao.creationGroupCount(user_id));
		model.addAttribute("nextGCId", dao.nextGTId());
		model.addAttribute("nextGMId", dao.nextGMId());
		
		result = "/WEB-INF/view/GroupCreationForm.jsp";
		
		
		
		return result;
	}
	
	@RequestMapping(value = "/groupcreationList.action", method = RequestMethod.GET)
	public String groupCreationList(Model model, HttpSession session)
	{
		String result = "";
		
		String user_id = (String) session.getAttribute("user_id");

	    if (user_id == null)
	    {
	    	result = "redirect:loginform.action";
			return result;
	    }
		
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		ArrayList<GroupDTO> creationList = dao.creationList();
		System.out.println(user_id);

		String creation_id = dao.creationGroupId(user_id);
		System.out.println(creation_id);
		if (creation_id != null)
		{
			model.addAttribute("groupConstructor",dao.groupConstructor(user_id, creation_id));
			
		}
		else
		{
			System.out.println("creation_id가 null");
	        model.addAttribute("groupConstructor", null);
		}
		
		//System.out.println(dao.groupConstructor(user_id, creation_id));
		model.addAttribute("user_id", user_id);
		model.addAttribute("list", creationList);
		model.addAttribute("count", dao.creationCount());
		
		result = "/WEB-INF/view/GroupCreationList.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/groupcreationinsert.action", method = RequestMethod.POST)
    public String groupCreationInsert(GroupDTO dto, HttpServletRequest request, Model model, HttpSession session, GroupInviteDTO dtoInvite) throws IOException
    {
	      String result = "";
	      String user_id = (String)session.getAttribute("user_id");
	      
	      if (user_id == null)
	       {
	           throw new IllegalArgumentException("User ID is missing from session.");
	       }
	      
	      dto.setUser_id(user_id);
	      
	      IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
	      
	      
	      // 파일 생성 및 저장(예원)
	      MultipartRequest multi = new MultipartRequest(request, PATH, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
	      String saveFileName = "";
	      String root = "";
	      String temp = "";
	      
	      saveFileName = multi.getFilesystemName("file");
	      
	      if (saveFileName != null)
	      {
	         File f = new File(PATH);
	         
	         if (!f.exists())
	            f.mkdir();
	         
	         File file = new File(f, saveFileName);
	         
	         if (!file.exists())
	         file.createNewFile();
	         
	         root = file.getAbsolutePath().replace("C:\\FinalStudy\\FinalApp02\\WebContent", "");
	         
	         dto.setRoot(root);
	      }
	    
	    String id = multi.getParameter("id");
	    String name = multi.getParameter("name");
	    String introduction = multi.getParameter("introduction");
	    String match_id = multi.getParameter("match_id");
	    String type_id = multi.getParameter("type_id");
	    String group_id = multi.getParameter("group_id");

	    dto.setId(multi.getParameter("id"));
	    dto.setName(multi.getParameter("name"));
	    dto.setIntroduction(multi.getParameter("introduction"));
	    dto.setMatch_id(multi.getParameter("match_id"));
	    dto.setType_id(multi.getParameter("type_id"));
	    dto.setGroup_id(multi.getParameter("group_id"));
		dao.creationAdd(dto);
		dao.matchAdd(dto);
		
		//System.out.println(dtoInvite.getCreate_id());
		
		// 초기 초대 INSERT
		dtoInvite.generateUniqueId();
		dtoInvite.setReception_id(dto.getMatch_id());
		dtoInvite.setCreate_id(dto.getId());
		dtoInvite.setWhether_id("SW01");
		dao.preinviteAdd(dtoInvite);
	
		
		result = "redirect:groupcreationList.action";
		
		
		return result;
	}
	
	@RequestMapping(value = "/groupsignupquestionform.action", method = RequestMethod.GET)
	public String groupSignupQuestionForm(HttpServletRequest request, Model model)
	{
		String result = "";
		
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		String group_id = request.getParameter("group_id");
		
		
		model.addAttribute("nextGMId", dao.nextGMId());
		model.addAttribute("nextSUId", dao.nextSUId());
		model.addAttribute("question", dao.questionForm(group_id));
		
		result = "/WEB-INF/view/GroupSignupQuestionForm.jsp";
		
		
		return result;
	}
	
	@RequestMapping(value = "/groupsignupinsert.action", method = RequestMethod.POST)
	public String groupSignupInsert(Model model, HttpSession session, GroupDTO dto)
	{
	    String result = "";
	    String user_id = (String) session.getAttribute("user_id");

	    if (user_id == null)
	    {
	        throw new IllegalArgumentException("User ID is missing from session.");
	    }

	    IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
	    

	    dto.setUser_id(user_id);
	    dao.matchAdd(dto);
	    dao.signupAdd(dto);
	    
	    String[] answers = dto.getAnswers();
	    String[] questionIds = dto.getQuestionIds();
	
    	for (int i = 0; i < answers.length; i++)
		{
    		dto.generateUniqueId();
    		
    		dto.setContent(answers[i]);
    		dto.setQuestion_id(questionIds[i]);
			
    		dao.answerAdd(dto);
		}

		result = "redirect:grouplist.action";
		
		return result;
		 
	}
	
	@RequestMapping(value = "/groupinvite.action", method = RequestMethod.GET)
	public String GroupInvite(Model model, HttpSession session, HttpServletRequest request, GroupDTO dto)
	{
	    String result = "";

	    String user_id = (String) session.getAttribute("user_id");

	    if (user_id == null)
	    {
	        result = "redirect:loginform.action";
	        return result;
	    }

	    IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
	    IPersonalDAO daoPersonal = sqlSession.getMapper(IPersonalDAO.class);

	    String outgoing_id = request.getParameter("matchId");
	    String typeId = request.getParameter("typeId");
	    String create_id = dao.creationGroupIdmatch(outgoing_id);

	    if (create_id != null)
	    {
	        int creationGroupMemberCount = dao.creationGroupMemberCount(create_id);
	        model.addAttribute("creationGroupMemberCount", creationGroupMemberCount);
	    }

	    ArrayList<GroupDTO> findGroup = daoPersonal.findGroup(user_id);
	    String group_id = dao.searchGRId(outgoing_id);

	    // 초대 합류 관련 이미 그룹원인 경우 체크
	    if ("GJ02".equals(typeId))
	    {  // 수정: .equals 사용
	        boolean isAlreadyInGroup = false;

	        for (GroupDTO groupDTO : findGroup)
	        {
	            if (groupDTO.getGroup_id().equals(group_id))
	            {
	                isAlreadyInGroup = true;
	                break;
	            }
	        }

	        if (isAlreadyInGroup)
	        {
	            // 이미 그룹에 속해 있는 경우 처리
	            result = "redirect:grouplist.action";
	            return result;
	        }

	        // 초대 합류 거절을 누른 사람 처리
	        dto.setGroup_id(group_id);
	        dto.setUser_id(user_id);
	        int inviteRefuseCount = dao.inviteRefuseCount(dto);
	        System.out.println("inviteRefuseCount: " + inviteRefuseCount);  

	        if (inviteRefuseCount != 0)
	        {
	            result = "redirect:grouplist.action";
	            return result;
	        }
	    }
	    else
	    {
	        // 초기 초대 관련 이미 그룹원인 경우 체크
	        String creation_id = dao.creationGroupIdmatch(outgoing_id);
	        System.out.println("creation_id: " + creation_id);  

	        dto.setCreation_id(creation_id);
	        dto.setUser_id(user_id);
	        int preInviteResponseCount = dao.preInviteResponseCount(dto);

	        if (preInviteResponseCount != 0)
	        {
	            result = "redirect:groupcreationList.action";
	            return result;
	        }
	    }

	    result = "/WEB-INF/view/GroupInvite.jsp";
	    return result;
	}
	// 초기초대
   @RequestMapping(value = "/grouppreinvitewhetherinsert.action", method = RequestMethod.GET)
   public String GroupPreInviteController(Model model, GroupInviteDTO dtoInvite, GroupDTO dto, HttpServletRequest request, HttpSession session ) 
   {
	   	String result = "";
		
		
		String user_id = (String)session.getAttribute("user_id");
		
		if (user_id == null)
		{
			result = "redirect : loginform.action";
			return result;
		}
		
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		String outgoing_id = request.getParameter("matchId");
		String type_id = request.getParameter("typeId");
		String whether_id = request.getParameter("response");
		String create_id = dao.creationGroupIdmatch(outgoing_id);
		int creationGroupMemberCount = dao.creationGroupMemberCount(create_id);
		
		// GR_MATCH INSERT
		dto.setUser_id(user_id);
		String gmId = dao.nextGMId();
		dto.setMatch_id(gmId);
		dto.setGroup_id("");
		dto.setType_id(type_id);
		dao.matchAdd(dto);
		
		// GR_PREINVITE INSERT
		dtoInvite.generateUniqueId();
		dtoInvite.setReception_id(gmId);
		dtoInvite.setCreate_id(create_id);
		dtoInvite.setWhether_id(whether_id);
		dao.preinviteAdd(dtoInvite);
		
		//System.out.println(dao.creationGroupMemberCount(create_id));
			
		// TBL_GROUP INSERT
		if ( creationGroupMemberCount == 5)
		{
			String group_id = dao.nextGRId();
			dto.setGroup_id(group_id);
			System.out.println(dto.getGroup_id());
			dto.setCreation_id(create_id);
			System.out.println(dto.getCreation_id());
			dao.groupAdd(dto);
			
			String updateGroup_id = dao.searchGroupId(dto);
			
			dto.setGroup_id(updateGroup_id);
			dao.groupIdUpdate(dto);
			
		}
		

		
		result = "redirect:groupcreationList.action";
		
		return result;
		

   
   }
	@RequestMapping(value = "/groupinvitewhetherinsert.action", method = RequestMethod.GET)		// groupinvitewhetherinsert.action?gmId=GM01&gjId=GJ01 (초대받은 사람이 수락/거절 누르는 액션 → 개인페이지)
	public String GroupInviteWhetherInsert(Model model, GroupInviteDTO dtoInvite, GroupDTO dto, HttpServletRequest request, HttpSession session)
	{
		String result = "";
		
		
		String user_id = (String)session.getAttribute("user_id");
		
		if (user_id == null)
		{
			result = "redirect : loginform.action";
			return result;
		}
		
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		
		

		
		String outgoing_id = request.getParameter("matchId");
		String type_id = request.getParameter("typeId");
		String whether_id = request.getParameter("response");
		
		String group_id = dao.searchGRId(outgoing_id);

		// 현재 사용자가 이미 속한 그룹인지 확인
		
		// GR_MATCH INSERT
		dto.setUser_id(user_id);
		String gmId = dao.nextGMId();
		dto.setMatch_id(gmId);
		dto.setGroup_id(group_id);
		dto.setType_id(type_id);
		dao.matchAdd(dto);
		//System.out.println(user_id);
		//System.out.println(gmId);
		//System.out.println(group_id);
		//System.out.println(type_id);
		
		// GR_INVITE INSERT
		dtoInvite.generateUniqueId();
		dtoInvite.setUser_id(user_id);
		dtoInvite.setGroup_id(group_id);
		//System.out.println(gmId);
		dtoInvite.setReception_id(gmId);
		//System.out.println(outgoing_id);
		dtoInvite.setOutgoing_id(outgoing_id);
		dtoInvite.setGroup_id(group_id);
		dtoInvite.setWhether_id(whether_id);
		dao.inviteAdd(dtoInvite);
		
		
		
		result = "redirect:grouplist.action";
		
		
	
		return result;
	}
	
	// 9.10 김세연
	@RequestMapping("/momentnamecount.action")
	public String momentNameCount(Model model, @RequestParam("name") String name, @RequestParam("group_id") String group_id)
	{
		String result = "";
		
		//System.out.println(group_id);
		IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);
		result = "/WEB-INF/view/MomentNameCountAjax.jsp?count=" + dao.momentNameCount(name, group_id);
		//System.out.println(dao.momentNameCount(name, group_id));
		

		return result;
	}
	
	@RequestMapping(value = "/searchmoment.action", method = RequestMethod.GET)
	public String searchMoment(Model model, @RequestParam("name") String name, @RequestParam("group_id") String group_id) 
	{
	    String result = "";

	    //System.out.println(group_id);
	    IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);

	    ArrayList<MomentDTO> resultList = dao.searchMomentResult(name, group_id);
	    
	    model.addAttribute("count", dao.momentNameCount(name, group_id));
	    model.addAttribute("resultList", resultList);

	    result = "/WEB-INF/view/SearchMoment.jsp";
	    return result;
	}
	
	@RequestMapping(value = "/signupdecision.action", method = RequestMethod.GET)
	public String signupDecision(Model model, HttpServletRequest request) 
	{
	    String result = "";

	    String group_id = request.getParameter("group_id");
	    IGroupDAO dao = sqlSession.getMapper(IGroupDAO.class);

	    ArrayList<GroupDTO> answerList = dao.signupAnswers(group_id);
	    
	    model.addAttribute("answerList", answerList);

	    result = "/WEB-INF/view/SignupDecision.jsp";
	    return result;
	}
	
	
	
	
	
	
}
