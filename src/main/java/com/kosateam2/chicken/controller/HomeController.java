package com.kosateam2.chicken.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String HomeController() {
		log.info("log in page");
		
		return "home";
	}
}
