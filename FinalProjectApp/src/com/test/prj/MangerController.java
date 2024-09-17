package com.test.prj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MangerController
{
	@Autowired
	private SqlSession sqlSession;
	
	/*
	@RequestMapping(value = "/grouppage.action", method = RequestMethod.GET)
	public String groupPage(Model model, String user_id)
	{
		if (user_id == null)
		{
			user_id = "US08";
		}
		
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

		GroupMemberDTO dto = new GroupMemberDTO();
		//dto = dao.searchId(user_id, group_id);
		int managerCount = dao.managerCount(dto.getGroup_id());
		
		ArrayList<GroupMemberDTO> group = new ArrayList<GroupMemberDTO>();
		group = dao.managerList(dto.getGroup_id());
		
		ManagerVoteDTO vote = new ManagerVoteDTO();
		vote.setId("MV03");
		vote.setGroup_id(dto.getGroup_id());
		dao.voteAdd(vote);
		
		ArrayList<GroupMemberDTO> voteeList = new ArrayList<GroupMemberDTO>();
		voteeList = dao.voteList(dto.getGroup_id());
		
		for (GroupMemberDTO member : voteeList)
		{
			ManagerVoteeDTO votee = new ManagerVoteeDTO();
			
			votee.generateUniqueId();
			votee.setVote_id(vote.getId());
			votee.setVotee_id(member.getMatch_id());
			
			dao.voteeAdd(votee);
		}
		
		model.addAttribute("group_id", dto.getGroup_id());
		model.addAttribute("vote_id", vote.getId());
		model.addAttribute("match_id", dto.getMatch_id());
		model.addAttribute("managerCount", managerCount);
		model.addAttribute("managerList", group);
		
		return "/WEB-INF/view/GroupPage.jsp";
		
	}
	*/
	
	@RequestMapping(value = "/managervote.action", method = RequestMethod.GET)
	public String managerList(Model model,
							 @RequestParam("group_id") String group_id, 
							 @RequestParam("vote_id") String vote_id,
							 @RequestParam("match_id") String match_id ) 
	{ 
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		
		ArrayList<GroupMemberDTO> candidates = dao.voteList(group_id);
	
		model.addAttribute("candidates", candidates);
		model.addAttribute("group_id", group_id);
		model.addAttribute("vote_id", vote_id);
		model.addAttribute("match_id", match_id);
		
		return "/WEB-INF/view/ManagerVote.jsp";
	}
	
	
	@RequestMapping(value = "/managervotefin.action", method = RequestMethod.POST)
	public String managerVoteFin(Model model, GroupMemberDTO dto, ManagerVoterDTO voter) 
	{	
		/*
	    String group_id = request.getParameter("group_id");
	    String vote_id = request.getParameter("vote_id");
	    String voter_id = request.getParameter("voter_id");
	    String selectedMatch_id = request.getParameter("selectedMatch_id");
	    */
	    
		/*
	    System.out.println(dto.getGroup_id());
	    System.out.println(voter.getVote_id());
	    System.out.println(voter.getVoter_id());
	    System.out.println(dto.getMatch_id());
	    System.out.println(dto.getSelectedMatch_id());
	    */
		
	    IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);

	    //ManagerVoterDTO voter = new ManagerVoterDTO();
	    voter.setId(dao.nextVoterId());
	    //voter.setVote_id(vote_id); 
	    //voter.setVoter_id(voter_id); 
	    voter.setSelected_id(dao.searchSelectedId(dto));
	    //dao.searchSelectedId(dto);  
	    
	    /*
	    System.out.println(voter.getSelected_id());
	    System.out.println(dto.getGmvote_id());
	    */
	    
	    dao.voterAdd(voter);
	    
	    //ArrayList<ManagerVoterDTO> voters = new ArrayList<ManagerVoterDTO>();
	    //해당 vote_id 에 대한 voter_id 값 담기
	    // model.addAttribute("voters", voter);

	    
	    model.addAttribute("voter_id", voter.getVoter_id());
	    model.addAttribute("group_id", dto.getGroup_id());

	    
	    // return "redirect:group.action?group_id=" + dto.getGroup_id();
	    
	    return "/WEB-INF/view/voteResult.jsp";
	    
	}
	
	@RequestMapping(value = "/votestatus.action", method = RequestMethod.GET)
	public String managerVoteStatus(Model model,
			 				 	   @RequestParam("vote_id") String vote_id,
			 				 	   @RequestParam("memberTotalCount") String memberTotalCount)
	{
		
		IManagerDAO dao = sqlSession.getMapper(IManagerDAO.class);
		
		// 투표 참여자 수 현황 보기
		int voterCount = dao.voterCount(vote_id);
		
		model.addAttribute("voterCount", voterCount);
		model.addAttribute("memberTotalCount", memberTotalCount);
		
		return "/WEB-INF/view/voteStatus.jsp";
		
	}

	
}
