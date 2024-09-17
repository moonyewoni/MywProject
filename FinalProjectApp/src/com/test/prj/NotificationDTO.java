package com.test.prj;

public class NotificationDTO
{
	// 초기 초대 수락 알림
	String id;
	String user_name;
	String noti_date;
	String group_name;
	
	
	
	
	
	// getter / setter
	public String getUser_name()
	{
		return user_name;
	}
	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getNoti_date()
	{
		return noti_date;
	}
	public void setNoti_date(String noti_date)
	{
		this.noti_date = noti_date;
	}
	public String getGroup_name()
	{
		return group_name;
	}
	public void setGroup_name(String group_name)
	{
		this.group_name = group_name;
	}
	
	
	
	
}
