package com.test.prj;

import java.util.UUID;

public class ManagerVoterDTO
{
	private String id, vote_id, voter_id, selected_id, voter_date;
	
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

	public String getVoter_id()
	{
		return voter_id;
	}

	public void setVoter_id(String voter_id)
	{
		this.voter_id = voter_id;
	}

	public String getSelected_id()
	{
		return selected_id;
	}

	public void setSelected_id(String selected_id)
	{
		this.selected_id = selected_id;
	}

	public String getVoter_date()
	{
		return voter_date;
	}

	public void setVoter_date(String voter_date)
	{
		this.voter_date = voter_date;
	}


	// 임의 랜덤 ID
	public void generateUniqueId()
	{
		// this.id = UUID.randomUUID().toString();

		UUID uuid = UUID.randomUUID();
		this.id = uuid.toString().substring(0, 8);
	}
	
}
