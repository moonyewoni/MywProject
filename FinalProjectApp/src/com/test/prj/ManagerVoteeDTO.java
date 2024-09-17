package com.test.prj;

import java.util.UUID;

public class ManagerVoteeDTO
{
	private String id, vote_id, votee_id, vote_whether, alarm_outgoing_date, alarm_check_date;

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getVote_id()
	{
		return vote_id;
	}

	public void setVote_id(String vote_id)
	{
		this.vote_id = vote_id;
	}

	public String getVotee_id()
	{
		return votee_id;
	}

	public void setVotee_id(String votee_id)
	{
		this.votee_id = votee_id;
	}

	public String getVote_whether()
	{
		return vote_whether;
	}

	public void setVote_whether(String vote_whether)
	{
		this.vote_whether = vote_whether;
	}

	public String getAlarm_outgoing_date()
	{
		return alarm_outgoing_date;
	}

	public void setAlarm_outgoing_date(String alarm_outgoing_date)
	{
		this.alarm_outgoing_date = alarm_outgoing_date;
	}

	public String getAlarm_check_date()
	{
		return alarm_check_date;
	}

	public void setAlarm_check_date(String alarm_check_date)
	{
		this.alarm_check_date = alarm_check_date;
	}

	
	// 임의 랜덤 ID
	public void generateUniqueId()
	{
		//this.id = UUID.randomUUID().toString();
		
		UUID uuid = UUID.randomUUID();  
		this.id = uuid.toString().substring(0, 8);
	}

}
