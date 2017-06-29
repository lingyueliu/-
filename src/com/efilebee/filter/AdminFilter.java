package com.efilebee.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.efilebee.db.User;

public class AdminFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest http_request = (HttpServletRequest)request;
		User current_user = (User)http_request.getSession().getAttribute("current_user_token");
		
		if(current_user == null) {
			//System.out.println("CURRENT USER NEED LOGIN");
			//((HttpServletResponse)response).sendRedirect("../login.jsp");
			//((HttpServletResponse)response).sendRedirect("/login.jsp");
			((HttpServletResponse)response).sendRedirect("/efilebee/login.jsp");
		} else {
			if(current_user.getType() != 0) {
				//System.out.println("CURRENT USER NEED PERMISSION");
				((HttpServletResponse)response).sendRedirect("/efilebee/login.jsp");				
			}
		}
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
