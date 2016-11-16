package com.mycompany.mymatch.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/member")
public class TestController {
	
	@RequestMapping("/matching")
	public String matchingForm(){
		return "member/matching";
	}
	
	@RequestMapping("/bestGuide")
	public String bestGuideForm(){
		return "member/bestGuide";
	}
	
	@RequestMapping("/resistration")
	public String resistrationForm(){
		return "member/resistration";
	}
	
	@RequestMapping("/faq")
	public String faqForm(){
		return "member/faq";
	}

}
