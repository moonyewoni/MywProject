package com.test.prj;

public class AdminDTO
{
	// 레코드 수
	int num_records;
	
	// 최근 일주일 날짜
	String generated_date;

	public int getNum_records()
	{
		return num_records;
	}

	public void setNum_records(int num_records)
	{
		this.num_records = num_records;
	}

	public String getGenerated_date()
	{
		return generated_date;
	}

	public void setGenerated_date(String generated_date)
	{
		this.generated_date = generated_date;
	}
	
	
	
	
}
