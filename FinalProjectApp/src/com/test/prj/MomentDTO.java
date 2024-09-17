/*====================
	MomentDTO.java
====================*/

package com.test.prj;

public class MomentDTO
{
	private String moment_id, moment_name;
	private String group_id, group_name;
	private String phase_id, phase;
	
	private String participant_id, participant_name;
	
	private String creation_date;
	private String plan_end_date;
	
	private String note;
	
	private int parti_num;
	private int min_participant;
	
	private String max_participant;
	
	private String member_id, member_name;
	
	private String participant_date;
	
	private String year, month, day, time;
	
	private String date_id, place_id;
	
	private String date_name;
	
	private String place_name, detail_id;
	
	private String user_id;
	
	private String survey_id, survey_response_id, survey_type_id;
	
	private String impossible_date, response, others;

	private String nonactive_type_id, nonactive_date;

	private String vote_id, vote_response_id;
	private String vote_select_id;
	
	public String getVote_select_id()
	{
		return vote_select_id;
	}
	public void setVote_select_id(String vote_select_id)
	{
		this.vote_select_id = vote_select_id;
	}
	public String getVote_id()
	{
		return vote_id;
	}
	public void setVote_id(String vote_id)
	{
		this.vote_id = vote_id;
	}
	public String getVote_response_id()
	{
		return vote_response_id;
	}
	public void setVote_response_id(String vote_response_id)
	{
		this.vote_response_id = vote_response_id;
	}
	public String getNonactive_type_id()
	{
		return nonactive_type_id;
	}
	public void setNonactive_type_id(String nonactive_type_id)
	{
		this.nonactive_type_id = nonactive_type_id;
	}
	public String getNonactive_date()
	{
		return nonactive_date;
	}
	public void setNonactive_date(String nonactive_date)
	{
		this.nonactive_date = nonactive_date;
	}
	public String getImpossible_date()
	{
		return impossible_date;
	}
	public void setImpossible_date(String impossible_date)
	{
		this.impossible_date = impossible_date;
	}
	public String getResponse()
	{
		return response;
	}
	public void setResponse(String response)
	{
		this.response = response;
	}
	public String getOthers()
	{
		return others;
	}
	public void setOthers(String others)
	{
		this.others = others;
	}
	public String getSurvey_id()
	{
		return survey_id;
	}
	public void setSurvey_id(String survey_id)
	{
		this.survey_id = survey_id;
	}
	public String getSurvey_response_id()
	{
		return survey_response_id;
	}
	public void setSurvey_response_id(String survey_response_id)
	{
		this.survey_response_id = survey_response_id;
	}
	public String getSurvey_type_id()
	{
		return survey_type_id;
	}
	public void setSurvey_type_id(String survey_type_id)
	{
		this.survey_type_id = survey_type_id;
	}
	public String getMax_participant()
	{
		return max_participant;
	}
	public void setMax_participant(String max_participant)
	{
		this.max_participant = max_participant;
	}
	public String getUser_id()
	{
		return user_id;
	}
	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}
	public String getDate_name()
	{
		return date_name;
	}
	public void setDate_name(String date_name)
	{
		this.date_name = date_name;
	}
	public String getDetail_id()
	{
		return detail_id;
	}
	public void setDetail_id(String detail_id)
	{
		this.detail_id = detail_id;
	}
	public String getPlace_name()
	{
		return place_name;
	}
	public void setPlace_name(String place_name)
	{
		this.place_name = place_name;
	}
	public String getDate_id()
	{
		return date_id;
	}
	public void setDate_id(String date_id)
	{
		this.date_id = date_id;
	}
	public String getPlace_id()
	{
		return place_id;
	}
	public void setPlace_id(String place_id)
	{
		this.place_id = place_id;
	}
	public String getYear()
	{
		return year;
	}
	public void setYear(String year)
	{
		this.year = year;
	}
	public String getMonth()
	{
		return month;
	}
	public void setMonth(String month)
	{
		this.month = month;
	}
	public String getDay()
	{
		return day;
	}
	public void setDay(String day)
	{
		this.day = day;
	}
	public String getTime()
	{
		return time;
	}
	public void setTime(String time)
	{
		this.time = time;
	}
	public String getParticipant_date()
	{
		return participant_date;
	}
	public void setParticipant_date(String participant_date)
	{
		this.participant_date = participant_date;
	}
	public String getMember_id()
	{
		return member_id;
	}
	public void setMember_id(String member_id)
	{
		this.member_id = member_id;
	}
	public String getMember_name()
	{
		return member_name;
	}
	public void setMember_name(String member_name)
	{
		this.member_name = member_name;
	}
	public String getMoment_id()
	{
		return moment_id;
	}
	public void setMoment_id(String moment_id)
	{
		this.moment_id = moment_id;
	}
	public String getMoment_name()
	{
		return moment_name;
	}
	public void setMoment_name(String moment_name)
	{
		this.moment_name = moment_name;
	}
	public String getGroup_id()
	{
		return group_id;
	}
	public void setGroup_id(String group_id)
	{
		this.group_id = group_id;
	}
	public String getGroup_name()
	{
		return group_name;
	}
	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}
	public String getPhase_id()
	{
		return phase_id;
	}
	public void setPhase_id(String phase_id)
	{
		this.phase_id = phase_id;
	}
	public String getPhase()
	{
		return phase;
	}
	public void setPhase(String phase)
	{
		this.phase = phase;
	}
	public String getParticipant_id()
	{
		return participant_id;
	}
	public void setParticipant_id(String participant_id)
	{
		this.participant_id = participant_id;
	}
	public String getParticipant_name()
	{
		return participant_name;
	}
	public void setParticipant_name(String participant_name)
	{
		this.participant_name = participant_name;
	}
	public String getCreation_date()
	{
		return creation_date;
	}
	public void setCreation_date(String creation_date)
	{
		this.creation_date = creation_date;
	}
	public String getPlan_end_date()
	{
		return plan_end_date;
	}
	public void setPlan_end_date(String plan_end_date)
	{
		this.plan_end_date = plan_end_date;
	}
	public String getNote()
	{
		return note;
	}
	public void setNote(String note)
	{
		this.note = note;
	}
	public int getParti_num()
	{
		return parti_num;
	}
	public void setParti_num(int parti_num)
	{
		this.parti_num = parti_num;
	}
	public int getMin_participant()
	{
		return min_participant;
	}
	public void setMin_participant(int min_participant)
	{
		this.min_participant = min_participant;
	}
	
	
	
	
	
	
}
