package com.mycompany.mymatch.controller;

import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.dto.GuideRequest;
import com.mycompany.mymatch.service.GuideService;
import com.mycompany.mymatch.service.MatchingService;

@Controller
@RequestMapping("/guide")
public class GuideController {
	@Autowired
	public GuideService guideService;
	@Autowired
	public MatchingService matchingService;
	
	
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
	
	@RequestMapping("/guideList")
	public String guideList() {
		return "guide/guideList";
	}
	
	@RequestMapping("/getList")
	public String getList(String gid, Model model) {
		Guide guide = guideService.getList(gid);
		model.addAttribute("guide", guide);
		return "guide/getList";
	}
	
	@RequestMapping("/findGuide")
	public String findGuide(String glocal, Model model) {
		List<Guide> list= guideService.findGuide(glocal);
		for(Guide guide : list) {
			guide.setCount(matchingService.countByGid(guide.getGid())); 
		}	
		list.sort(new Comparator<Guide>() {
			@Override
			public int compare(Guide o1, Guide o2) {
				return Integer.compare(o2.getCount(), o1.getCount());
			}
		});	
		model.addAttribute("list", list);
		return "guide/findGuide";
	}
	
	@RequestMapping("/requestMatchingGuide")
	public String requestMatchingGuide(GuideRequest guideRequest){
		guideService.requestMatchingGuide(guideRequest);
		return "guide/requestMatchingGuide";
	}
	
	@RequestMapping("/receiveMatchingGuide")
	public String receiveMatchingGuide(GuideRequest guideRequest, Model model){
		List<Guide> list = guideService.receiveMatchingGuide(guideRequest);
		model.addAttribute("list", list);
		return "guide/receiveMatchingGuide";
	}
}
