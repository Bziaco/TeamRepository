package com.mycompany.mymatch.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/information")
public class InfoController {
	
	@RequestMapping("/info")
	public String faqForm(){
		return "information/info";
	}

}