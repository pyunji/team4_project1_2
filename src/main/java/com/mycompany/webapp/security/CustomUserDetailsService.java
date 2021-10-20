//package com.mycompany.webapp.security;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.mycompany.webapp.dao.MemberDao;
//import com.mycompany.webapp.vo.Member;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Service
//@Slf4j
//public class CustomUserDetailsService implements UserDetailsService {
//	@Resource private MemberDao memberDao;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		log.info("실행");
//		
//		Member member = memberDao.selectById(username);
//		if (member == null) {
//			// 스프링 시큐리티가 제공하는 에러
//			throw new UsernameNotFoundException(username);
//		}
//		
//		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//		authorities.add(new SimpleGrantedAuthority(member.getMrole()));
//		
//		CustomUserDetails userDetails = new CustomUserDetails(
//				member.getMid(), 
//				member.getMpassword(), 
//				member.isMenabled(), 
//				authorities,
//				member.getMemail()
//		);
//		
//		return userDetails;
//	}
//
//}
