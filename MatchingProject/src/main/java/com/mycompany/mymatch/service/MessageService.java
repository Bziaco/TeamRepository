package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.MessageDao;
import com.mycompany.mymatch.dto.Message;

@Component
public class MessageService {
	@Autowired
	private MessageDao messageDao;
	
	public List<Message> getMessageList(String mid, String chatter) {
		List<Message> list = messageDao.selectMessage(mid, chatter); 
		return list;
	}
	
	public int messageSend(Message message) {
		int row = messageDao.insert(message);
		return row;
	}
}
