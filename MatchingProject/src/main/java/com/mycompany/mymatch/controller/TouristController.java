package com.mycompany.mymatch.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Tourist;
import com.mycompany.mymatch.dto.TouristRequest;
import com.mycompany.mymatch.service.TouristService;

@Controller
@RequestMapping("/tourist")
public class TouristController {

	@Autowired
	public TouristService touristService;
	
	@RequestMapping("/requestMatchingTourist")
	public String requestMatchingTourist(TouristRequest touristRequest){
		touristService.requestMatchingTourist(touristRequest);
		return "tourist/requestMatchingTourist";
	}
	
	@RequestMapping("/receiveMatchingTourist")
	public String receiveMatchingTourist(TouristRequest touristRequest, Model model){
		List<Tourist> list = touristService.receiveMatchingTourist(touristRequest);
		model.addAttribute("list", list);
		return "tourist/receiveMatchingTourist";
	}
}
