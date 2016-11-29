package com.mycompany.mymatch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Matching;
import com.mycompany.mymatch.service.MatchingService;

@Controller
@RequestMapping("/matching") 
public class MatchingController {  
	@Autowired
	public MatchingService matchingService;
	
	/*@RequestMapping("/matchList")
	public String List() {
		return "matching/matchList";
	}
	@RequestMapping("/tourList")
	public String tourList(HttpSession session, Model model) {
		String gid = (String) session.getAttribute("login");
		List<Member> list = matchingService.getMatchingToureList(gid);
		model.addAttribute("list", list);
		return "matching/tourList";
	}
	
	@RequestMapping("/guideList")
	public String guideList(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		List<Member> list = matchingService.getMatchingGuideList(mid);
		model.addAttribute("list", list);
		return "matching/guideList";
	}*/
	
//-------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping("/matchList")
	public String matchList(String pageNo, String keyword, Model model, HttpSession session) {
		
		int intPageNo = 1;
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			if(pageNo != null) {
				intPageNo = Integer.parseInt(pageNo);
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}
		session.setAttribute("pageNo", String.valueOf(intPageNo));
		
		int rowsPerPage = 3;
		int pagesPerGroup = 5;
		
		int totalBoardNo = 0;
		List<Matching> list = null;
		if(keyword == null || keyword.equals("")) {
			totalBoardNo = matchingService.getCount();
			list = matchingService.getList(intPageNo, rowsPerPage);
		} else {
			totalBoardNo = matchingService.getCountKeyword(keyword);
			list = matchingService.getListKeyword(keyword, intPageNo, rowsPerPage);
		}
		
		int totalPageNo = (totalBoardNo/rowsPerPage) + ((totalBoardNo%rowsPerPage!=0)?1:0);
		int totalGroupNo = (totalPageNo/pagesPerGroup) + ((totalPageNo%pagesPerGroup!=0)?1:0);
		
		int groupNo = (intPageNo-1)/pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNo) { endPageNo = totalPageNo; }
		
		model.addAttribute("pageNo", intPageNo);
		model.addAttribute("rowsPerPage", rowsPerPage);
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalBoardNo", totalBoardNo);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("list", list);
		model.addAttribute("keyword", keyword);

		return "matching/matchList";
	}

//--------------------------------------------------------------------------------------------------------------------------------------

	
	
	@RequestMapping("/getMatching")
	public String getMatching(String gid, Model model) {
		Matching matching = matchingService.getMatching(gid);
		model.addAttribute("matching", matching);
		return "matching/getMatching";
	}
	
	
//--------------------------------------------------------------------------------------------------------------------------------------	

	

}



