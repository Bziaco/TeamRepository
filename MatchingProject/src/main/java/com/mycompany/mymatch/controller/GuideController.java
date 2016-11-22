package com.mycompany.mymatch.controller;

import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.service.GuideService;
import com.mycompany.mymatch.service.MatchingService;

@Controller
@RequestMapping("/guide")
public class GuideController {
	@Autowired
	public GuideService guideService;
	@Autowired
	public MatchingService matchingService;
	
	
	@RequestMapping("/guideList")
	public String guideList() {
		return "guide/guideList";
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
	
	
}
