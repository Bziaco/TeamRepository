package com.mycompany.mymatch.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.dto.Message;
import com.mycompany.mymatch.service.MemberService;
import com.mycompany.mymatch.service.MessageService;


@Component
@RequestMapping("/message")
public class MessageController {
	@Autowired
	public MemberService memberService;
	@Autowired
	public MessageService messageService;
	
	@RequestMapping(value="/messageList")
	public String messageList(String mto, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		List<Message> list = messageService.getMessageList(mid, mto);
		Member midMember = memberService.getMember(mid);
		Member mtoMember = memberService.getMember(mto);
		for(Message message : list) {
			if(message.getMfrom().equals(mid)) {
				message.setMfromPhoto(midMember.getSavedfile());
			} else if(message.getMfrom().equals(mto)) {
				message.setMfromPhoto(mtoMember.getSavedfile());
			}
		}
		model.addAttribute("list", list);
		return "message/messageList";
	}
	
	@RequestMapping(value="/messageSend")
	public String messageSend(Message message, HttpSession session, Model model) {
		String mid = (String) session.getAttribute("login");
		message.setMfrom(mid);
		messageService.messageSend(message);
		return messageList(message.getMto(), session, model);
	}
}