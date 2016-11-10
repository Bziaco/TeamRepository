package com.mycompany.myweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myweb.dto.PhotoBoard;
import com.mycompany.myweb.service.PhotoBoardService;

@Controller
@RequestMapping("/photoboard")
public class PhotoBoardController {
	@Autowired
	private PhotoBoardService photoBoardService;
	
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

		int rowsPerPage = 8; // 게시물을 나타내는 갯수
		int pagesPerGroup = 5; // 한번에 나타나는 페이지수

		// 전체 페이지수
		int totalBoardNo = photoBoardService.getCount();
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

		List<PhotoBoard> list = photoBoardService.list(intPageNo, rowsPerPage);

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

		return "photoboard/list";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		return "photoboard/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(PhotoBoard photoBoard, HttpSession session) {
		try{
			String mid = (String) session.getAttribute("login");
			photoBoard.setBwriter(mid);
			
			photoBoard.setOriginalfile(photoBoard.getPhoto().getOriginalFilename());
			String savedfile = new Date().getTime() + photoBoard.getPhoto().getOriginalFilename();
			//실제 파일을 저장하는 코드
			String realpath = session.getServletContext().getRealPath("/WEB-INF/photo/" + savedfile);
			photoBoard.getPhoto().transferTo(new File(realpath));
			//
			photoBoard.setSavedfile(savedfile);     
			//파일의 종류를 얻는 코드
			photoBoard.setMimetype(photoBoard.getPhoto().getContentType());
			
			int result = photoBoardService.write(photoBoard);
			
			return "redirect:/photoboard/list";
		}catch(Exception e){
			e.printStackTrace();
			return "photoboard/write";
		}
	}
	
	@RequestMapping("/showPhoto")
	public void showPhoto(String savedfile,HttpServletRequest request, HttpServletResponse response){
		try{
			String fileName = savedfile;
			
			//브라우저에서 보여 주지 않고 강제다운로드 시키기 위한 코드
			/*
			
			fileName = URLEncoder.encode(fileName,"UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");  //보여주지말고 그냥 다운로드해라
			 */
			
			//파일확장명을 동적으로 알려주는 코드
			String mimeType = request.getServletContext().getMimeType(fileName);
			response.setContentType(mimeType);
			
			OutputStream os = response. getOutputStream();
			String filePath = request.getServletContext().getRealPath("/WEB-INF/photo/" + fileName);  //동적으로 경로를 얻어줌
			InputStream is = new FileInputStream(filePath);
			
			byte[] values = new byte[1024];
			int byteNum = -1;
			while((byteNum = is.read(values)) != -1) {
				os.write(values, 0, byteNum);
			}
			os.flush();
			
			is.close();
			os.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/info")
	public String info(int bno, Model model) {
		PhotoBoard photoBoard = photoBoardService.info(bno);
		photoBoard.setBhitcount(photoBoard.getBhitcount() + 1);
		photoBoardService.modify(photoBoard);
		model.addAttribute("photoboard", photoBoard);
		return "photoboard/info";
	}
}
