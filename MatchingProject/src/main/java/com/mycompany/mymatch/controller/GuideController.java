package com.mycompany.mymatch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.service.GuideService;

@Controller
@RequestMapping("resist")
public class GuideController {
	@Autowired
	private GuideService guideService;
	
	
	@RequestMapping("guideResist")
	public String home() {
	    return "resist/guideResist";
	   }
	
	@RequestMapping(value = "/resist", method = RequestMethod.GET)
	public String resistForm() {
		return "guide/resistForm";
	}

	@RequestMapping(value = "/resist", method = RequestMethod.POST)
	public String write(Guide guide, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		try{
			int result = guideService.join(guide);
			return "redirect:/guide/resist";
		} catch(Exception e){
			model.addAttribute("guide", guide);
			return "guide/resistComplete";
		}
	}
	
}
