package com.ElectronicMart.Servlet;

import java.io.IOException;
import java.util.List;

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

import com.ElectronicMart.Bean.EUser;
import com.ElectronicMart.dao.UserDao;

/**
 * Servlet Filter implementation class EmailFilterServlet
 */
@WebFilter("/Register")
public class EmailFilterServlet implements Filter {

    /**
     * Default constructor. 
     */
    public EmailFilterServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		UserDao dao = new UserDao();
		EUser user = new EUser();
		List<EUser> list = dao.getAllUser();
		String myEmail = request.getParameter("rEmail");
		System.out.println(myEmail);
		String email=null;
		int z = 0;
		for(EUser e:list) {
			email=e.getEmail();
			if(myEmail.equals(email)) {
				z=1;
			}
		
		}
		if(z==1) {
			HttpSession session = req.getSession();
			session.setAttribute("email-msg", "This Email is already taken");
			res.sendRedirect("Register.jsp");
		}else {
			chain.doFilter(request, response);
			
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
