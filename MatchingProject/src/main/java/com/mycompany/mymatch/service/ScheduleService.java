package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.GuideScheduleDao;
import com.mycompany.mymatch.dao.ScheduleDao;
import com.mycompany.mymatch.dto.GuideSchedule;
import com.mycompany.mymatch.dto.Schedule;


@Component
public class ScheduleService {	
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private GuideScheduleDao guideScheduleDao;
	
	public void write(Schedule schedule) {
		scheduleDao.insert(schedule);
	}
	
	public List<Schedule> getList(int pageNo, int rowsPerPage) {
		List<Schedule> list = scheduleDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	
	public List<Schedule> getListKeyword(String keyword, int pageNo, int rowsPerPage) {
		List<Schedule> list = scheduleDao.selectKeywordByPage(keyword, pageNo, rowsPerPage);
		return list;
	}	
	
	public int delete(int sno) {
		int row = scheduleDao.delete(sno);
		return row;
	}
	
	public Schedule getSchedule(int sno) {
		Schedule schedule = scheduleDao.selectBySno(sno);
		return schedule;
	}
	
	public int update(Schedule schedule) {
		int row = scheduleDao.update(schedule);
		return row;
	}
	
	public int getCount() {
		return scheduleDao.count();
	}
	
	public int getCountKeyword(String keyword) {
		return scheduleDao.countKeyword(keyword);
	}	
	
	public void addGuideSchedule(GuideSchedule guideSchedule) {
		guideScheduleDao.insert(guideSchedule);
	}
	
	
	public void cancelGuideSchedule(GuideSchedule guideSchedule) {
		guideScheduleDao.delete(guideSchedule);
	}

	public boolean isGuideRequest(String gid, int sno) {
		GuideSchedule guideSchedule = guideScheduleDao.selectByGidSno(gid, sno);
		if(guideSchedule != null) return true;
		else return false;
	}
		
}
