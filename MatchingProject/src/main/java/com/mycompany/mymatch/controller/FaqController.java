package com.mycompany.mymatch.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/faq")
public class FaqController {
	
	@RequestMapping("/faqList")
	public String faqForm(){
		return "faq/faqList";
	}

}
