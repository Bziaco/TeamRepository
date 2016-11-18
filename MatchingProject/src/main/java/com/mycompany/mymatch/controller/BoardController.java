package com.mycompany.mymatch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.service.BoardService;

@Component
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	

}
