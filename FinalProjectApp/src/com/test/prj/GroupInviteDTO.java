package com.test.prj;

import java.util.UUID;

public class GroupInviteDTO
{
	private String id, reception_id, outgoing_id, group_id, invite_date, acception_date, whether_id, alarm_check_date, create_id, user_id;

	public String getUser_id()
	{
		return user_id;
	}

	public void setUser_id(String user_id)
	{
		this.user_id = user_id;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getReception_id()
	{
		return reception_id;
	}

	public void setReception_id(String reception_id)
	{
		this.reception_id = reception_id;
	}

	public String getOutgoing_id()
	{
		return outgoing_id;
	}

	public void setOutgoing_id(String outgoing_id)
	{
		this.outgoing_id = outgoing_id;
	}

	public String getGroup_id()
	{
		return group_id;
	}

	public void setGroup_id(String group_id)
	{
		this.group_id = group_id;
	}

	public String getInvite_date()
	{
		return invite_date;
	}

	public void setInvite_date(String invite_date)
	{
		this.invite_date = invite_date;
	}

	public String getAcception_date()
	{
		return acception_date;
	}

	public void setAcception_date(String acception_date)
	{
		this.acception_date = acception_date;
	}

	public String getWhether_id()
	{
		return whether_id;
	}

	public void setWhether_id(String whether_id)
	{
		this.whether_id = whether_id;
	}

	public String getAlarm_check_date()
	{
		return alarm_check_date;
	}

	public void setAlarm_check_date(String alarm_check_date)
	{
		this.alarm_check_date = alarm_check_date;
	}

	public String getCreate_id()
	{
		return create_id;
	}

	public void setCreate_id(String create_id)
	{
		this.create_id = create_id;
	}
	
	public void generateUniqueId()
	{
		// this.id = UUID.randomUUID().toString();

		UUID uuid = UUID.randomUUID();
		this.id = uuid.toString().substring(0, 8);
	}

}
