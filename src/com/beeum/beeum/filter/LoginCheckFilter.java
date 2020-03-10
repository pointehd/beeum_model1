package com.beeum.beeum.filter;

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
import javax.servlet.http.HttpSession;
import com.beeum.beeum.vo.User;
@WebFilter(value= {
		"/paymentForm.jsp",
		"/registerTourBasic.jsp",
		"/registerTourCourse.jsp",
		"/registerTourGuidance.jsp",
		"/registerTourPrice.jsp",
		"/updateProfileForm.jsp",
		"/updateProfile.jsp",
		"/tourReviewPopup.jsp",
		"/localReviewPopup.jsp",
		"/ajax/like.jsp"})
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session = ((HttpServletRequest)request).getSession();
		User loginUser =  (User)session.getAttribute("loginUser");
		
		if(loginUser==null) {
			((HttpServletResponse)response).sendRedirect("/index.jsp");
		}else {
			chain.doFilter(request, response);
		}//if~else end
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//System.out.println("LoginCheckFilter init");
	}

}
