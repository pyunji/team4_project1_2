//package com.mycompany.webapp.controller;
//
//import java.security.Principal;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//
//import javax.annotation.Resource;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.data.redis.core.ValueOperations;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.mycompany.webapp.service.EventService;
//import com.mycompany.webapp.vo.Event;
//
//@Controller
//@RequestMapping("/event")
//public class EventRedisController {
//	@Autowired
//	private RedisTemplate<String, String> redisTemplate;
//	
//	private static final Logger logger = LoggerFactory.getLogger(EventRedisController.class);
//	
//	@Resource private EventService eventService;
//	
//	@RequestMapping("/detail/{eventNo}")
//	public String eventDetail(Model model, @PathVariable int eventNo) {
//		// 이벤트 번호로 이벤트 정보를 가져온다
//		Event event = eventService.SearchEventInfo(eventNo);
//		int limitCount = event.getLimitCount();
//		Date tempDate = event.getIssueDate();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		String issueDate= format.format(tempDate);
//		String title = event.getTitle();
//		logger.info("limitCount = " + limitCount);
//		// 이벤트 객체에 담겨있는 limitCount를 request 범위에 저장한다
//		model.addAttribute("limitCount", limitCount);
//		model.addAttribute("issueDate",issueDate);
//		model.addAttribute("title",title);
//		model.addAttribute("eventNo",eventNo);
//		return "event/eventDetail";
//	}
//
//	
//	/*
//	 * count와 참여자 목록 정보를 redis를 사용하여 저장
//	 */
//	@PostMapping("/coupondownload")
//	public String couponDownloadRedisTest (int eventNo, int limitCount, Principal principal) throws Exception {
//		
//		// Redis에서 제공하는 String 타입에 해당하는 명령어를 수행하는 인터페이스
//		ValueOperations<String, String> vops = redisTemplate.opsForValue();
//		// 사용자 아이디
//		String mid = principal.getName();
//		// 카운트 키
//		String countKey = "Event"+":"+eventNo + ":" + "count";
//		// 참여 여부
//		String participantYnKey = "Event"+":"+eventNo+":"+"Participant"+":"+mid;
//	
//		logger.info("> 참여자");
//		logger.info(mid);
//		
//		// 현재 쿠폰 발급 카운트를 가져온다 (아직 값이 없으면 0으로 초기화한다)
//		int countValue = vops.get(countKey)!=null?Integer.parseInt(vops.get(countKey)):0;
//		// 회원의 참여 여부를 가져온다 아직 값이 없으면 N으로 초기화한다.
//		String participantYnValue = vops.get(participantYnKey)!=null?vops.get(participantYnKey):"N";
//		
//		// 남은 쿠폰이 없을 경우
//		if(countValue>limitCount) {
//			logger.info("이벤트 종료");
//			return "event/fail";
//		}else {
//			// 참여한 회원인 경우
//			if(participantYnValue.equals("N")) {
//				// 쿠폰 발급 카운트 1 증가시킴
//				vops.increment(countKey, 1);
//				// 참여 여부 표시
//				vops.set(participantYnKey,"Y");
//				// 당첨자 정보 저장
//				eventService.addWinner(eventNo, mid, countValue);
//				logger.info("당첨");
//				return "event/success";
//			}else {
//				logger.info("이미 참여");
//				return "event/already";
//			}
//		}
//		
//	}
//	
//	
//	
//}
