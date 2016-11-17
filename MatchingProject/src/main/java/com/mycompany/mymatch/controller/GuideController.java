package com.mycompany.mymatch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.service.GuideService;

@Controller
@RequestMapping("bestGuide")
public class GuideController {
	@Autowired
	public GuideService guideService;
	
	
	@RequestMapping("bestGuideList")
	public String home() {
	    return "bestGuide/bestGuideList";
	   }
	
}
