package com.mycompany.mymatch.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.GuideSchedule;
import com.mycompany.mymatch.dto.Matching;
import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.service.MatchingService;

@Controller
@RequestMapping("/matching") 
public class MatchingController {  
	@Autowired
	public MatchingService matchingService;
	
	@RequestMapping("/tourList")
	public String tourList(HttpSession session, Model model) {
		String gid = (String) session.getAttribute("login");
		List<GuideSchedule> list = matchingService.getGuideSchedule(gid);
		model.addAttribute("list", list);
		return "matching/tourList";
	}
	
	@RequestMapping("/guideList")
	public String guideList(HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		List<Member> list = matchingService.getMatchingGuideList(mid);
		model.addAttribute("list", list);
		return "matching/guideList";
	}
	
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
		List<Matching> list = matchingService.getMatching(gid);
		for(Matching matching : list){
			System.out.println(matching.getGid());
			System.out.println(matching.getBdate());
			System.out.println(matching.getBtitle());
			
		}
		
		model.addAttribute("list", list);
		
		return "matching/getMatching";
	}
	
	
//--------------------------------------------------------------------------------------------------------------------------------------	

	@RequestMapping("/getPhoto")
	public void getPhoto(String savedfile, HttpServletRequest request, HttpServletResponse response) {
		try {
			String fileName = savedfile;

			String mimeType = request.getServletContext().getMimeType(fileName);
			response.setContentType(mimeType);
			
			OutputStream os = response.getOutputStream();
			String filePath = request.getServletContext().getRealPath("/resources/img/" + fileName);
			InputStream is = new FileInputStream(filePath);
			byte[] values = new byte[1024];
			int byteNum = -1;
			while((byteNum = is.read(values)) != -1) {
				os.write(values, 0, byteNum);
			}
			os.flush();
			is.close();
			os.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}



