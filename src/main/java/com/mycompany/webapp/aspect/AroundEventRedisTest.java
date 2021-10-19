//package com.mycompany.webapp.aspect;
//
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Component;
//
/*
 * API call Test 시간측정용 AOP입니다.
 */

//@Component
//@Aspect
//public class AroundEventRedisTest {
//	
//	private static final Logger logger = LoggerFactory.getLogger(AroundEventRedisTest.class);
//	
//	@Around("execution(public * com.mycompany.webapp.controller.EventRedisTestController.*(..))")
//	public Object runtimeCheckAdvice(ProceedingJoinPoint joinPoint) {
//		//--------------------------------------------------
//		long start = System.nanoTime();
//		//--------------------------------------------------
//		Object result = null;
//		try {
//			result = joinPoint.proceed();
//		} catch (Throwable e) {
//			e.printStackTrace();
//		}
//		//--------------------------------------------------
//		long end = System.nanoTime();
//		long howLong = end - start;
//		String methodName = joinPoint.getSignature().toShortString();
//		logger.info(methodName + "실행 시간: " +howLong + "ns" );
//		//--------------------------------------------------
//		return result;
//	}
//
//}
