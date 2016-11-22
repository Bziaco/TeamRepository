package com.mycompany.mymatch.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.TourlistDao;
import com.mycompany.mymatch.dto.Tourist;

@Component
public class TouristService {

	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	public static final int JOIN_SUCCESS = 0;
	public static final int JOIN_FAIL = 1;
	
	@Autowired
	private TourlistDao touristDao;
	
	public int join(Tourist tourist) {
		touristDao.insert(tourist);
		return JOIN_SUCCESS;
	}
}
