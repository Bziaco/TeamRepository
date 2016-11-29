package com.mycompany.mymatch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.service.BoardService;

@Component
@RequestMapping("/schedule")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	public BoardService boardService;
	
	@RequestMapping("/boardList")
	public String boardList(String pageNo, String keyword, Model model, HttpSession session) {
		logger.info("boardList");
		
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
		List<Board> list = null;
		if(keyword == null || keyword.equals("")) {
			totalBoardNo = boardService.getCount();
			list = boardService.getList(intPageNo, rowsPerPage);
		} else {
			totalBoardNo = boardService.getCountKeyword(keyword);
			list = boardService.getListKeyword(keyword, intPageNo, rowsPerPage);
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

		return "schedule/boardList";
	}

//--------------------------------------------------------------------------------------------------------------------------------------
	
	@RequestMapping("/write")
	public String write(Board board, HttpSession session) {
		String mid = (String) session.getAttribute("login");
		board.setMid(mid);
		boardService.write(board);
		return "board/write";
	}

	
//--------------------------------------------------------------------------------------------------------------------------------------	

	
	@RequestMapping("/delete")
	public String delete(int bno) {
		boardService.delete(bno);
		return "board/delete";
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------
	
	
	@RequestMapping("/getBoard")
	public String getBoard(int bno, Model model) {
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "board/getBoard";
	}
	
	
//--------------------------------------------------------------------------------------------------------------------------------------	
	
	
	@RequestMapping("/update")
	public String update(Board board) {
		boardService.update(board);
		return "board/update";
	}
}
