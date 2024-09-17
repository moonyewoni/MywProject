package com.test.prj;

import java.util.ArrayList;

public interface INotificationDAO
{
	public ArrayList<NotificationDTO> findPreInviteNoti(String user_id);
	
	public int deletepreInviteNoti(String id);
}
