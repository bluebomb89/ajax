package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Model;

public class BoardInsertModel implements Model{
	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setAttribute("title", "±Û¾²±â");
		req.setAttribute("jsp", "../board/board_insert.jsp");
		return "main/main.jsp";
	}
}
