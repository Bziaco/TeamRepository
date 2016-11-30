package com.mycompany.mymatch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Schedule;
import com.mycompany.mymatch.service.ScheduleService;

@Component
@RequestMapping("/schedule")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	public ScheduleService scheduleService;
	
	@RequestMapping("/scheduleList")
	public String scheduleList(String pageNo, String keyword, Model model, HttpSession session) {
		logger.info("scheduleList");
		
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
		
		int rowsPerPage = 5;
		int pagesPerGroup = 5;
		
		int totalBoardNo = 0;
		List<Schedule> list = null;
		if(keyword == null || keyword.equals("")) {
			totalBoardNo = scheduleService.getCount();
			list = scheduleService.getList(intPageNo, rowsPerPage);
		} else {
			totalBoardNo = scheduleService.getCountKeyword(keyword);
			list = scheduleService.getListKeyword(keyword, intPageNo, rowsPerPage);
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

		return "schedule/scheduleList";
	}

//--------------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping("/write")
	public String write(Schedule schedule, HttpSession session) {
		String mid = (String) session.getAttribute("login");
		schedule.setMid(mid);
		scheduleService.write(schedule);
		return "schedule/write";
	}

	
//--------------------------------------------------------------------------------------------------------------------------------------	

	
	@RequestMapping("/delete")
	public String delete(int sno) {
		scheduleService.delete(sno);
		return "schedule/delete";
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------
	
	
	@RequestMapping("/getSchedule")
	public String getSchedule(int sno, Model model) {
		Schedule schedule = scheduleService.getSchedule(sno);
		model.addAttribute("schedule", schedule);
		return "schedule/getSchedule";
	}
	
	
//--------------------------------------------------------------------------------------------------------------------------------------	
	
	
	@RequestMapping("/update")
	public String update(Schedule schedule) {
		scheduleService.update(schedule);
		return "schedule/update";
	}
}
