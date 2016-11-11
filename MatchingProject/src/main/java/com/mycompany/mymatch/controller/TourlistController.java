package com.mycompany.mymatch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Tourlist;
import com.mycompany.mymatch.service.TourlistService;

@Controller
@RequestMapping("home")
public class TourlistController {
	
	@Autowired
	private TourlistService tourlistService;
	
	@RequestMapping(value = "/resist/tourlist", method = RequestMethod.GET)
	public String resistForm() {
		return "tourlist/resistForm";
	}

	@RequestMapping(value = "/resist/tourlist", method = RequestMethod.POST)
	public String write(Tourlist tourlist, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		try{
			int result = tourlistService.join(tourlist);
			return "redirect:/guide/resist";
		} catch(Exception e){
			model.addAttribute("tourlist", tourlist);
			return "guide/resistComplete";
		}
	}
}
