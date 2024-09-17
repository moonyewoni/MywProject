package com.test.prj;

import java.util.UUID;

public class GroupDTO
{

	private String id, creation_id, open_date, name, introduction, root, count, user_id
				 , creation_date, group_id, content, type_id, match_id, signup_id, answer_id, question_id, memberCount, end_date
				 , question, answer, answer_date;
	
	public String getQuestion()
	{
		return question;
	}

	public void setQuestion(String question)
	{
		this.question = question;
	}

	public String getAnswer()
	{
		return answer;
	}

	public void setAnswer(String answer)
	{
		this.answer = answer;
	}

	public String getAnswer_date()
	{
		return answer_date;
	}

	public void setAnswer_date(String answer_date)
	{
		this.answer_date = answer_date;
	}

	public String getEnd_date()
	{
		return end_date;
	}

	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}

	public String getMemberCount()
	{
		return memberCount;
	}

	public void setMemberCount(String memberCount)
	{
		this.memberCount = memberCount;
	}

	private String[] answers;
	private String[] questionIds;

	public String[] getQuestionIds()
	{
		return questionIds;
	}

	public void setQuestionIds(String[] questionIds)
	{
		this.questionIds = questionIds;
	}

	public String getAnswer_id()
	{
		return answer_id;
	}

	public void setAnswer_id(String answer_id)
	{
		this.answer_id = answer_id;
	}

	public String[] getAnswers()
	{
		return answers;
	}

	public void setAnswers(String[] answers)
	{
		this.answers = answers;
	}

	public String getQuestion_id()
	{
		return question_id;
	}

	public void setQuestion_id(String question_id)
	{
		this.question_id = question_id;
	}

	public String getMatch_id()
	{
		return match_id;
	}

	public void setMatch_id(String match_id)
	{
		this.match_id = match_id;
	}

	public String getSignup_id()
	{
		return signup_id;
	}

	public void setSignup_id(String signup_id)
	{
		this.signup_id = signup_id;
	}

	public String getType_id()
	{
		return type_id;
	}

	public void setType_id(String type_id)
	{
		this.type_id = type_id;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getGroup_id()
	{
		return group_id;
	}

	public void setGroup_id(String group_id)
	{
		this.group_id = group_id;
	}

	public String getCreation_date()
	{
		return creation_date;
	}

	public void setCreation_date(String creation_date)
	{
		this.creation_date = creation_date;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getCreation_id()
	{
		return creation_id;
	}

	public void setCreation_id(String creation_id)
	{
		this.creation_id = creation_id;
	}

	public String getOpen_date()
	{
		return open_date;
	}

	public void setOpen_date(String open_date)
	{
		this.open_date = open_date;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getIntroduction()
	{
		return introduction;
	}

	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
	}

	public String getRoot()
	{
		return root;
	}

	public void setRoot(String root)
	{
		this.root = root;
	}

	public String getCount()
	{
		return count;
	}

	public void setCount(String count)
	{
		this.count = count;
	}

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	
	public void generateUniqueId()
	{
		// this.id = UUID.randomUUID().toString();

		UUID uuid = UUID.randomUUID();
		this.answer_id = uuid.toString().substring(0, 8);
	}

	
	
}

