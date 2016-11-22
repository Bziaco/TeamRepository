package com.mycompany.mymatch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.service.GuideService;


@Component
@RequestMapping("/guide")
public class GuideController {
	@Autowired
	public GuideService guideService;

	
	@RequestMapping(value="/guideResist", method=RequestMethod.POST)
	public String guideResist(Guide guide, Model model, HttpSession session){
		String strResult = "success";
		String mid = (String) session.getAttribute("login");
		guide.setGid(mid); 
		
		System.out.println("gmid:" + guide.getGid());
		System.out.println("glocal : " + guide.getGlocal());
		System.out.println("gintro : " + guide.getGintro());
		
		if(guide.getGintro() != null && guide.getGlocal() != null){
			int result = guideService.join(guide);
		} else {
			strResult = "false";
		}
		model.addAttribute("result", strResult);
		return "guide/guideResist";
	}
}
