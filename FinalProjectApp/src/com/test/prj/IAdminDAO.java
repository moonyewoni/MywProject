package com.test.prj;

import java.util.ArrayList;

public interface IAdminDAO
{
	public int countUser();
	
	public int countNewUser();
	
	public int countGroup();
	
	public int countNewGroup();
	
	public int countMoment();
	
	public int countNewMoment();
	
	public int[] countPhaseMoment();
	
	public ArrayList<AdminDTO> countGroupChange();
	
	public ArrayList<AdminDTO> countMomentChange();
	
	public ArrayList<AdminDTO> countUserChange();
	
	public int[] countGender();
	
	public ArrayList<GroupDTO> groupList();
	
}
