package com.mycompany.mymatch.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.mymatch.dao.MatchingDao;
import com.mycompany.mymatch.dao.MemberDao;
import com.mycompany.mymatch.dto.Attraction;
import com.mycompany.mymatch.dto.Board;
import com.mycompany.mymatch.dto.Matching;
import com.mycompany.mymatch.dto.Member;

@Component
public class MatchingService {
	/*public static final int MODIFY_SUCCESS = 0;
	public static final int MODIFY_FAIL = 1;
	
	public static final int REMOVE_SUCCESS = 0;
	public static final int REMOVE_FAIL = 1;
	
	@Autowired
	private MatchingDao matchingDao;
	
	@Autowired
	private MemberDao memberDao;
	
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
	

	public List<Member> getMatchingToureList(String gid) {
		List<Matching> list = matchingDao.selectByGid(gid);
		List<Member> matchingTourList = new ArrayList<Member>();
		for(Matching matching : list) {
			Member member = memberDao.selectByMid(matching.getMid());
			member.setMmatchingdate(matching.getMatchdate());
			matchingTourList.add(member);
		}
		return matchingTourList;
	}

	public List<Member> getMatchingGuideList(String mid) {
		List<Matching> list = matchingDao.selectByMid(mid);
		
		List<Member> matchingGuideList = new ArrayList<Member>();
		for(Matching matching : list) {
			Member member = memberDao.selectByMid(matching.getGid());
			member.setMmatchingdate(matching.getMatchdate());
			matchingGuideList.add(member);
		}
		
		return matchingGuideList;
	}
	*/
	public int countByGid(String gid) {
		return matchingDao.countByGid(gid);
	}
	
//---------------------------------------------------------------------------------------------------------------------------
	@Autowired
	private MatchingDao matchingDao;
	
	
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
	
	public Matching getMatching(String gid) {
		Matching matching = matchingDao.selectByGid(gid);
		return matching;
	}
	
	
}
