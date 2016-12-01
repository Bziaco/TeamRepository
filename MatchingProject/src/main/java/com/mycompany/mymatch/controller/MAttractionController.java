package com.mycompany.mymatch.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Attraction;
import com.mycompany.mymatch.service.AttractionService;

@Component
@RequestMapping("")
public class MAttractionController {
	
	@Autowired
	public AttractionService attractionService;
	
	
	@RequestMapping("/MgetAttractionlist")
	public String attractionList(String pageNo, String keyword, Model model, HttpSession session) {
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
		
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
		
		int totalBoardNo = 0;
		List<Attraction> list = null;
		if(keyword == null || keyword.equals("")) {
			totalBoardNo = attractionService.getCount();
			list = attractionService.getList(intPageNo, rowsPerPage);
		} else {
			totalBoardNo = attractionService.getCountKeyword(keyword);
			list = attractionService.getListKeyword(keyword, intPageNo, rowsPerPage);
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

		return "attraction/MgetAttractionlist";
	}
	
	
	
//--------------------------------------------------------------------------------------------------------------------------------------	
	
	@RequestMapping("/getAttraction")
	public String getAttraction(int ano, Model model) {
		Attraction attraction = attractionService.getAttraction(ano);
		model.addAttribute("attraction", attraction);
		return "attraction/getAttraction";
	}
	
//----------저장되어있는 사진의 타입을 읽어서 보낸다 ----------------------------------------------------------------------------------------------------------------------------	
	
	
	
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






