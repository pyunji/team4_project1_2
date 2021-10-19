package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.EventDao;
import com.mycompany.webapp.dao.EventResultDao;
import com.mycompany.webapp.vo.Event;
import com.mycompany.webapp.vo.EventResult;

@Service
public class EventService {
	@Resource private EventDao eventDao;
	@Resource private EventResultDao eventResultDao;
	
	public Event SearchEventInfo(int eventNo) {
		return eventDao.selectByEventNo(eventNo);
	}
	
	
	public Event checkCount(int eventNo) {
		return eventDao.selectCount(eventNo);
	}
	
	//EventTable에서 eventNo에 해당하는 Count를 증가시키기 위한 메서드 
	public int increaseCount(int eventNo) {
		return eventDao.updateCount(eventNo);
	}
	
	public EventResult checkbeforehistory(int eventNo, String memberId) {
		return eventResultDao.selectByEventNoNRank(eventNo,memberId);
	}
	
	public int addWinner(int eventNo, String memberId, int rank) {
		return eventResultDao.insertEventResult(eventNo, memberId, rank);
	}
	
}
