package org.Lee.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class MainPageController {

	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model)  throws Exception  {
        		
		
		return "/MainPage";
	}
	

	
}
