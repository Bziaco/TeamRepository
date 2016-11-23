package com.mycompany.mymatch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Tourist;
import com.mycompany.mymatch.service.TouristService;

@Controller
@RequestMapping("tourist")
public class TouristController {
	
	@Autowired
	public TouristService touristService;

	
	@RequestMapping(value="/touristResist", method=RequestMethod.POST)
	public String touristResist(Tourist tourist, Model model, HttpSession session){
		String strResult = "success";
		String mid = (String) session.getAttribute("login");
		tourist.setTid(mid); 
		
		System.out.println("tid:" + tourist.getTid());
		System.out.println("tlocal : " + tourist.getTlocal());
		System.out.println("tintro : " + tourist.getTintro());
		System.out.println("tintro : " + tourist.getTstartdate());
		System.out.println("tintro : " + tourist.getTenddate());
		
		if(tourist.getTintro() != null && tourist.getTlocal() != null && tourist.getTstartdate() != null && tourist.getTenddate() != null){
			int result = touristService.join(tourist);
		} else {
			strResult = "false";
		}
		model.addAttribute("result", strResult);
		return "tourist/touristResist";
	}
}
