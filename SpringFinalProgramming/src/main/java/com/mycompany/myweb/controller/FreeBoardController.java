package com.mycompany.myweb.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myweb.dto.FreeBoard;
import com.mycompany.myweb.service.FreeBoardService;

@Controller
@RequestMapping("/freeboard")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService;

	@RequestMapping("/list")
	// 페이지 넘버가 넘어오지 않으면 디폴드 값인 1을 반환해라.
	public String list(String pageNo, Model model, HttpSession session) {
		int intPageNo = 1;
		// 클라이언트에도 존재하지 않는 경우
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			// 세션에도 없는 경우
			if (pageNo != null) {
				intPageNo = Integer.parseInt(pageNo);
			}
		} else {
			intPageNo = Integer.parseInt(pageNo);
		}
		session.setAttribute("pageNo", String.valueOf(intPageNo));

		int rowsPerPage = 10; // 게시물을 나타내는 갯수
		int pagesPerGroup = 5; // 한번에 나타나는 페이지수

		// 전체 페이지수
		int totalBoardNo = freeBoardService.getCount();
		// 105페이지 일경우 나머지 5를 처리해주는 식을 더한것
		int totalPageNo = totalBoardNo / rowsPerPage + ((totalBoardNo % rowsPerPage != 0) ? 1 : 0);
		// 전체 그룹갯수
		int totalGroupNo = (totalPageNo / pagesPerGroup) + ((totalPageNo % pagesPerGroup != 0) ? 1 : 0);

		// 현재 그룹번호
		int groupNo = (intPageNo - 1) / pagesPerGroup + 1;
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if (groupNo == totalGroupNo) {
			endPageNo = totalPageNo;
		}

		List<FreeBoard> list = freeBoardService.list(intPageNo, rowsPerPage);

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

		return "freeboard/list";

	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "freeboard/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(FreeBoard freeBoard, HttpSession session) {
		String mid = (String) session.getAttribute("login");
		freeBoard.setBwriter(mid);
		int result = freeBoardService.write(freeBoard);
		if (result == FreeBoardService.WRITE_FAIL) {
			return "freeboard/write";
		} else {
			return "redirect:/freeboard/list";
		}
	}

	@RequestMapping("/info")
	public String info(int bno, Model model) {
		FreeBoard freeBoard = freeBoardService.info(bno);
		freeBoard.setBhitcount(freeBoard.getBhitcount() + 1);
		freeBoardService.modify(freeBoard);
		model.addAttribute("freeboard", freeBoard);
		return "freeboard/info";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyFrom(int bno, Model model) {
		FreeBoard freeBoard = freeBoardService.info(bno);
		model.addAttribute("freeboard", freeBoard);
		return "freeboard/modify";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(FreeBoard freeBoard) {
		// 디비에 잇는 hitcount를 가져와야 한다. 그래야 조회수가 0으로 수정이 안됨
		FreeBoard dbFreeBoard = freeBoardService.info(freeBoard.getBno());
		freeBoard.setBhitcount(dbFreeBoard.getBhitcount());
		freeBoardService.modify(freeBoard);

		return "redirect:/freeboard/list";
	}

	@RequestMapping("/remove")
	public String remove(int bno) {
		freeBoardService.remove(bno);
		return "redirect:/freeboard/list";

	}
}
