package com.login.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.adm.model.*;
import com.member.model.*;

//@WebFilter("/BackFilter")
public class BackFilter implements Filter {

	private FilterConfig config;
	
	public void init(FilterConfig config) {
		this.config = config;
	}
	
	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		javax.servlet.http.HttpServletRequest req = (HttpServletRequest) request;
		javax.servlet.http.HttpServletResponse res = (HttpServletResponse) response;
		
		javax.servlet.http.HttpSession session = req.getSession();
		
		AdmVO admVO = (AdmVO) session.getAttribute("admVO");
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		
		if (admVO != null && memberVO == null) {
			try {
				String location = (String) session.getAttribute("location");
				if (location != null) {
					session.removeAttribute("location");
					res.sendRedirect(location);
					return;
				}
				
			} catch (Exception ignored) {
				System.out.println(ignored.getMessage());
			}
			
			chain.doFilter(request, response);
		} 
//		else {
//			res.sendRedirect(req.getContextPath() + "/front-end/member/login.jsp");
//		}
		
//	<filter>
//		<filter-name>BackFilter</filter-name>
//		<filter-class>com.login.filter.BackFilter</filter-class>
//	</filter>
//	<filter-mapping>
//		<filter-name>BackFilter</filter-name>
//		<url-pattern>/back-end/*</url-pattern>
//		<dispatcher>REQUEST</dispatcher>
//		<dispatcher>FORWARD</dispatcher>
//		<dispatcher>INCLUDE</dispatcher>
//		<dispatcher>ERROR</dispatcher>
//		<dispatcher>ASYNC</dispatcher>		
//	</filter-mapping>
	}
}
