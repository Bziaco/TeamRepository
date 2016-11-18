package com.mycompany.mymatch.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.service.BoardService;

@Component
@RequestMapping("/board")
public class BoardController {
	@Autowired
	public BoardService boardService;
	
	@RequestMapping("/boardList")
	public String board() {
	    return "board/boardList";
	}
	
	@RequestMapping("/write")
	public String write(Board board, HttpSession session) {
		String mid = (String) session.getAttribute("login");
		board.setMid(mid);
		boardService.write(board);
		return "board/write";
	}

}
