package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.MessageDao;
import com.mycompany.mymatch.dto.Message;

@Component
public class MessageService {
	public static final int WRITE_SUCESS=0;
	public static final int WRITE_FAIL=1;
	
	@Autowired
	private MessageDao messageDao;
	
	public int write(Message message) {
		messageDao.insert(message);
		return WRITE_SUCESS;
	}
	
	public List<Message> readmessage(String mid) {
		List<Message> ms= messageDao.selectBymto(mid);
		return ms;
	}
	
}
