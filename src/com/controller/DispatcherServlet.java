package com.controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Model;
// Controller
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private WebApplicationContext wc;
	public void init(ServletConfig config) throws ServletException {
		String path=config.getInitParameter("xmlPath");
		wc=new WebApplicationContext(path);
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			String cmd=request.getRequestURI();
			// /MainProject/main.do
			cmd=cmd.substring(request.getContextPath().length()+1, cmd.lastIndexOf('.'));
			Model model=wc.getBean(cmd);
			String jsp=model.handlerRequest(request, response);
			String temp=jsp.substring(jsp.lastIndexOf('.')+1);
			if(temp.equals("do"))
			{
				response.sendRedirect(jsp);
			}
			else
			{
				RequestDispatcher rd=
						request.getRequestDispatcher(jsp);
				rd.forward(request, response);
			}
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
	}

}





