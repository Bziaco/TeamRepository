package com.mycompany.mymatch.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.GuideDao;
import com.mycompany.mymatch.dao.GuideScheduleDao;
import com.mycompany.mymatch.dao.MatchingDao;
import com.mycompany.mymatch.dao.MemberDao;
import com.mycompany.mymatch.dao.ScheduleDao;
import com.mycompany.mymatch.dto.Guide;
import com.mycompany.mymatch.dto.GuideSchedule;
import com.mycompany.mymatch.dto.Matching;
import com.mycompany.mymatch.dto.Member;
import com.mycompany.mymatch.dto.Schedule;

@Component
public class MatchingService {
	
	@Autowired
	private MatchingDao matchingDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ScheduleDao scheduleDao;
	
	@Autowired
	private GuideScheduleDao guideScheduleDao;
	
//---------------------------------------------------------
	@Autowired
	private GuideDao guideDao;
	
	public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	
	public int modify(Matching matching){
		int row = matchingDao.update(matching);
		if(row == 0){ return MODIFY_FAIL; }
		return MODIFY_SUCCESS;
	}
	
	public int remove(int matchno){
		int row = matchingDao.delete(matchno);
		if(row == 0) { return REMOVE_FAIL; }
		return REMOVE_SUCCESS;
	}
	
	public Matching info(int matchno){
		return matchingDao.selectByMatch(matchno);
	}
	

	public List<GuideSchedule> getGuideSchedule(String gid) {
		List<GuideSchedule> list = guideScheduleDao.selectByGid(gid);
		for(GuideSchedule guideSchedule : list) {
			Schedule schedule = scheduleDao.selectBySno(guideSchedule.getSno());
			guideSchedule.setSchedule(schedule);
			Member member = memberDao.selectByMid(schedule.getMid());
			guideSchedule.setTourist(member);
		}
		return list;
	}
//--추가----------------------------------------------------------------------------------------
	
	public List<GuideSchedule> getTouristSchedule(String mid) {
		List<GuideSchedule> list = guideScheduleDao.selectByMid(mid);
		for(GuideSchedule guideSchedule : list) {
			Schedule schedule = scheduleDao.selectBySno(guideSchedule.getSno());
			guideSchedule.setSchedule(schedule);
			Guide guide = guideDao.selectByGid(guideSchedule.getGid());
			guideSchedule.setGuide(guide);
		}
		return list;
	}
	
	
	
	
//---------------------------------------------------------------------------------------------------------------------------	

	
	
	public int countByGid(String gid) {
		return matchingDao.countByGid(gid);
	}
	
	public List<Matching> getList(int pageNo, int rowsPerPage) {
		List<Matching> list = matchingDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}

	public List<Matching> getListKeyword(String keyword, int pageNo, int rowsPerPage) {
		List<Matching> list = matchingDao.selectKeywordByPage(keyword, pageNo, rowsPerPage);
		return list;
	}
	
	public int getCountKeyword(String keyword) {
		return matchingDao.countKeyword(keyword);
	}
	
	public int getCount() {
		return matchingDao.count();
	}
	
	public List<Matching> getMatching(String gid) {
		List<Matching> list = matchingDao.selectByGid(gid);
		return list;
	}
	
	
}
