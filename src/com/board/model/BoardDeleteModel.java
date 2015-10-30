package com.board.model;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.common.Model;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

import com.board.dao.*;
/*
 *	board_delete.do => 매칭
 *					board_delete (BoardDeleteModel) XML등록
 *					=> handlerRequest() <=> DB (mapper.sql)
 *					=> jsp출력
 */
public class BoardDeleteModel implements Model {
	
	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String pwd=req.getParameter("pwd");
		// DB연동
		boolean bCheck=false;
		String db_pwd=ReplyBoardDAO.boardGetPwd(Integer.parseInt(no));
		if(db_pwd.equals(pwd)){
			bCheck=true;
			ReplyBoardDAO.boardDelete(Integer.parseInt(no));
		}else{
			bCheck=false;
		}
		req.setAttribute("bCheck", bCheck);
		req.setAttribute("page", page);
		return "board/delete.jsp";
	}
}
