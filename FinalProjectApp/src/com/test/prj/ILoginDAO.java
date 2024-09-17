package com.test.prj;

public interface ILoginDAO
{
	public MemberDTO login(MemberDTO member);
	
	public MemberDTO loginAdmin(MemberDTO member);
}
