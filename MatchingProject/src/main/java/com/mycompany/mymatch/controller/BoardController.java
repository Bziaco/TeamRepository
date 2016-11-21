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
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	public BoardService boardService;
	
	@RequestMapping("/boardList")
	public String boardList(Model model) {
		logger.info("boardList");
		List<Board> list = boardService.getList(1, 8);
		
		model.addAttribute("list", list);
		return "board/boardList";
	}
	
	@RequestMapping("/write")
	public String write(Board board, HttpSession session) {
		String mid = (String) session.getAttribute("login");
		board.setMid(mid);
		boardService.write(board);
		return "board/write";
	}
	
	@RequestMapping("/delete")
	public String delete(int bno) {
		boardService.delete(bno);
		return "board/delete";
	}

	@RequestMapping("/getBoard")
	public String getBoard(int bno, Model model) {
		Board board = boardService.getBoard(bno);
		model.addAttribute("board", board);
		return "board/getBoard";
	}
}
