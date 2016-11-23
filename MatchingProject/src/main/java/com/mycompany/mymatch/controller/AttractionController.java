package com.mycompany.mymatch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Attraction;
import com.mycompany.mymatch.service.AttractionService;

@Component
@RequestMapping("/attraction")
public class AttractionController {
	
	@Autowired
	private AttractionService attractionService;
	
	@RequestMapping("/attractionList")
	public String attractionList(){
		return "attraction/attractionList";
	}
	
	@RequestMapping("/attraction")
	public String info(int ano, Model model) {
		Attraction attraction = attractionService.info(ano);
		model.addAttribute("attraction", attraction);
		return "attraction/attractionList";
	}

}
