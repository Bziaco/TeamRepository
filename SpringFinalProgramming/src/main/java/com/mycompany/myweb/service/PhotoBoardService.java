package com.mycompany.myweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myweb.dao.photoBoardDao;
import com.mycompany.myweb.dto.PhotoBoard;

@Component
public class PhotoBoardService {
	public static final int WRITE_SUCCESS = 0;
	public static final int WRITE_FAIL = 1;
	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	@Autowired
	private photoBoardDao photoboardDao;
	
	
	public List<PhotoBoard> list(int pageNo, int rowsPerPage){
		return photoboardDao.selectByPage(pageNo, rowsPerPage);
	}
	public int write(PhotoBoard photoBoard){
		int row = photoboardDao.insert(photoBoard);
		return WRITE_SUCCESS;
	}
	public int modify(PhotoBoard photoBoard){
		int row = photoboardDao.update(photoBoard);
		if(row == 0 ) { return WRITE_FAIL; }
		return WRITE_SUCCESS;
	}
	public int remove(int bno){
		int row = photoboardDao.delete(bno);
		if(row == 0 ) { return WRITE_FAIL; }
		return WRITE_SUCCESS;
	}
	public PhotoBoard info(int bno){
		return photoboardDao.selectByBno(bno);
	}
	public int getCount(){
		return photoboardDao.count();
	}
}
