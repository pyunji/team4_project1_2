//package com.mycompany.webapp.controller;
//
//import java.security.Principal;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.concurrent.Callable;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//import java.util.concurrent.Future;
//
//import javax.annotation.Resource;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.mycompany.webapp.service.EventService;
//import com.mycompany.webapp.vo.Event;
//import com.mycompany.webapp.vo.EventResult;
//
//@Controller
//@RequestMapping("/event")
//public class EventController {
//	
//	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
//	
//	@Resource private EventService eventService;
//	private ExecutorService executorsService = Executors.newFixedThreadPool(1);
//	
//	
//	//Event 상세페이지 - mapping url => eventNo가 필요
//	@RequestMapping("/detail/{eventNo}")
//	public String eventDetail(Model model, @PathVariable int eventNo) {
//		
//		//eventNo로 event정보조회
//		Event event = eventService.SearchEventInfo(eventNo);
//		Date tempDate = event.getIssueDate();
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		String issueDate= format.format(tempDate);
//		String title = event.getTitle();
//		model.addAttribute("issueDate",issueDate);
//		model.addAttribute("title",title);
//		model.addAttribute("eventNo",eventNo);
//		//이벤트 상세페이지로 return
//		return "event/eventDetail";
//	}
//	
//	
//	//쿠폰 다운받기 클릭시
//	@PostMapping("/coupondownload")
//	public String couponDownload (Integer eventNo, Principal principal) throws Exception {
//		
//		//event 참여 이력이 있는 조회(Redis 사용 전)
//		EventResult eventResult = eventService.checkbeforehistory(eventNo,principal.getName());
//		
//		//null이 아니라면 쿠폰을 다운받은 적이 있다는 것이다.
//		if(eventResult != null) {
//			return "event/already";
//		
//		//null일 때만 count를 확인해서 남은 쿠폰이 있는지 확인(Redis 사용 전)  
//		}else {
//			
//			//eventNo로 count, limitcount를 조회하기 위해 Event정보 조회
//			Event event = eventService.checkCount(eventNo);
//			//Queue에 들어가기 전에 count를 확인하는 부분
//			int currCount = event.getCount();
//			int limitCount = event.getLimitCount();
//			
//			
//			//남은 쿠폰이 없는경우
//			if(currCount>=limitCount) {
//				return "event/fail";
//			}
//			
//			Callable<Integer> task = new Callable<Integer>() {
//				@Override
//				public Integer call() throws Exception {
//					//Queue에 들어가기전에 count를 확인했을때와 
//					//Queue에 들어와서 count를 확인한 결과가 
//					//다를수 있기때문에 다시 Queue에서 Count를 확인
//					int queueCount = event.getCount();
//					int queuelimitCount = event.getLimitCount();
//					
//					if(queueCount < queuelimitCount) {
//						//남은 쿠폰이 있다면 현재 쿠폰 count에 1을 더해서 Rank를 구하고 eventResult(이벤트 당첨자 테이블) 에 추가
//						eventService.addWinner(eventNo, principal.getName(),currCount+1);
//						//쿠폰이 발급되었기 때문에 Count Table에서 count를 증가
//						//증가가 잘 되었다면 1을 return
//						return eventService.increaseCount(eventNo);
//					} else {
//						//남은 쿠폰이 없다면 바로 0을 return
//						return 0;
//					}
//				}
//			};
//	
//			Future<Integer> future = executorsService.submit(task);
//	
//			// Callable 인터페이스의 call 메서드의 실행결과가 result에 들어간다.
//			// 이벤트 처리가 완료될 때까지 대기상태가 되어 기다린다.
//			int result = future.get();
//				
//			if (result == 1) {
//			//result가 1이라면 success표시
//				return "event/success";
//			} else {
//			//result가 1이 아니라면 fail표시
//				return "event/fail";
//			}
//		}
//	}
//	
//	
//	
//}
