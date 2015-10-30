package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.ReplyBoardDAO;
import com.board.dao.ReplyDTO;
import com.common.Model;

public class ReplyDeleteModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String no=req.getParameter("no");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		//DB¿¬µ¿
		ReplyDTO d=ReplyBoardDAO.replyGetDepthRoot(Integer.parseInt(no));
		if(d.getDepth()==0){
			ReplyBoardDAO.replyDelete(Integer.parseInt(no));
		}else{
			ReplyBoardDAO.replyMsgUpdate(Integer.parseInt(no));
		}
		ReplyBoardDAO.replyDepthDecrement(d.getRoot());		
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_ok.jsp";
	}

}
