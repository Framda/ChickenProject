package com.kosateam2.chicken.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/chicken")
	public String chicken() {
		log.info("in login page");
		return "home";
	}
	
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		String loginResult = "";
	
		if(mid.equals("admin")) {
			if(mpassword.equals("iot12345")) {
				loginResult = "success";
			} else {
				loginResult = "wrongMpassword";
			}
		} else {
			loginResult = "wrongMid";
		}
		
		session.setAttribute("loginResult", loginResult);
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginResult");
		return "redirect:/";
	}
}
