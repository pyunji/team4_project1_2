/*
 * API call Test용 컨트롤러입니다.
 */

//package com.mycompany.webapp.controller;
//
//import java.security.Principal;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.Iterator;
//import java.util.List;
//import java.util.concurrent.Callable;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//import java.util.concurrent.Future;
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
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.mycompany.webapp.service.EventService;
//import com.mycompany.webapp.vo.Event;
//import com.mycompany.webapp.vo.EventResult;
//
//@Controller
//@RequestMapping("/event")
//public class EventRedisTestController {
//	@Autowired
//	private RedisTemplate<String, String> redisTemplate;
//	//static int count = 0;
//	
//	private static final Logger logger = LoggerFactory.getLogger(EventRedisTestController.class);
//	
//	@Resource private EventService eventService;
//	private ExecutorService executorsService = Executors.newFixedThreadPool(1);
//	
//	@RequestMapping("/detail/{eventNo}")
//	public String eventDetail(Model model, @PathVariable int eventNo) {
//		Event event = eventService.SearchEventInfo(eventNo);
//		Date tempDate = event.getIssueDate();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		String issueDate= format.format(tempDate);
//		String title = event.getTitle();
//		model.addAttribute("issueDate",issueDate);
//		model.addAttribute("title",title);
//		model.addAttribute("eventNo",eventNo);
//		return "event/eventDetail";
//	}
//	
//
//	@GetMapping("/coupondownload/oracle")
//	// 다른 쓰레드에서 실행되는 환경을 맞춰야 하기 때문에 따로 빼줌
//	public void testOracle() throws Exception {
//		for(int i = 0; i < 10000; i++) {
//		String testId = "oracleTestUser" + i;
//		couponDownloadOracleTest(testId, i);
//		}
//	}
//	//9589951600ns
//	//2306890500ns
//	@GetMapping("/coupondownload/redis")
//	public void testRedis() throws Exception {
//		for(int i = 0; i < 10000; i++) {
//		String testId = "redisTestUser" + i;
//		couponDownloadRedisTest(testId, i);
//		}
//	}
//	
////	@GetMapping("/coupondownload/oracle")
//	public void couponDownloadOracleTest (String testId, int i) throws Exception {
//		int eventNo = 1;
//		
//		Event event = eventService.checkCount(eventNo);
//		
//			logger.info("> "+ i +"번째 참여");
//			logger.info(testId);
//			EventResult eventResult = eventService.checkbeforehistory(eventNo,testId);
//			
//			if(eventResult != null) {
//				logger.info("이미 참여");
//				return;
//			}else {
//				//Queue에 들어가기 전에 count를 확인하는 부분
//				int currCount = event.getCount();
//				int limitCount = event.getLimitCount();
//				
//				
//				if(currCount>=limitCount) {
//					logger.info("이벤트 종료");
//					return;
//				}
//				
//				Callable<Integer> task = new Callable<Integer>() {
//					@Override
//					public Integer call() throws Exception {
//						int queueCount = event.getCount();
//						int queuelimitCount = event.getLimitCount();
//						
//						if(queueCount < queuelimitCount) {
//							eventService.addWinner(eventNo, testId,currCount+1);
//							return eventService.increaseCount(eventNo);
//						} else {
//							return 0;
//						}
//					}
//				};
//				
//				Future<Integer> future = executorsService.submit(task);
//				
//				// 이벤트 처리가 완료될 때 까지 대기상태가 되게 된다.
//				int result = future.get();
//				
//				if (result == 1) {
//					logger.info("당첨");
//					return;
//				} else {
//					logger.info("이벤트 종료");
//					return;
//				}
//			}
//	}
//	
//	public void couponDownloadRedisTest (String testId, int i) throws Exception {
//		ValueOperations<String, String> vops = redisTemplate.opsForValue();
//		int eventNo = 1;
//		
//		/*Event event = eventService.checkCount(eventNo);
//		int eventLimit = event.getLimitCount();*/
//		int eventLimit = 5000;
//		String countKey = "Event"+":"+eventNo;
//		String participantYnKey = "EventParticipant"+":"+eventNo+":"+testId;
//	
//		logger.info("> "+ i +"번째 참여자");
//		logger.info(testId);
//		
//		int countValue = vops.get(countKey)!=null?Integer.parseInt(vops.get(countKey)):0;
//		String participantYnValue = vops.get(participantYnKey)!=null?vops.get(participantYnKey):"N";
//		if(countValue>eventLimit) {
//			logger.info("이벤트 종료");
//			return;
//		}else {
//			if(participantYnValue.equals("N")) {
//				vops.increment(countKey, 1);
//				vops.set(participantYnKey,"Y");
//				eventService.addWinner(eventNo, testId, countValue);
//				logger.info("당첨");
//				return;
//			}else {
//				logger.info("이미 참여");
//				return;
//			}
//		}
//		
//	}
//	
//	
//	
//}
