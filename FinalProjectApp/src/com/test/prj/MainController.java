package com.test.prj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController
{
	@RequestMapping(value = "main.action", method = RequestMethod.GET)
	public String main()
	{
		String result = "/WEB-INF/view/Main.jsp";

		return result;
	}

}
