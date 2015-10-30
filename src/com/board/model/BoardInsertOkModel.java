package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.ReplyBoardDAO;
import com.board.dao.ReplyBoardDTO;
import com.common.Model;

public class BoardInsertOkModel implements Model{

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		String name=req.getParameter("name");
		String subject=req.getParameter("subject");
		String content=req.getParameter("content");
		String pwd=req.getParameter("pwd");
		ReplyBoardDTO d=new ReplyBoardDTO();

		d.setName(name);
		d.setSubject(subject);
		d.setContent(content);
		d.setPwd(pwd);
		// DB¿¬µ¿
		ReplyBoardDAO.boardInsert(d);
		return "board_list.do";
	}

}




