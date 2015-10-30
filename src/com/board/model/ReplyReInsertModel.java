package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.dao.ReplyBoardDAO;
import com.board.dao.ReplyDTO;
import com.common.Model;

public class ReplyReInsertModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("EUC-KR");
		String msg=req.getParameter("rmsg");
		String bno=req.getParameter("bno");
		String page=req.getParameter("page");
		String root=req.getParameter("pno");
		HttpSession session=req.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		// DB연동
		ReplyDTO d=new ReplyDTO();
		d.setBno(Integer.parseInt(bno));
		d.setId(id);
		d.setName(name);
		d.setMsg(msg);
		// DB연동
		ReplyDTO prd=ReplyBoardDAO.replyParentInfo(Integer.parseInt(root));
		ReplyBoardDAO.replyStepIncrement(prd);
		d.setGroup_id(prd.getGroup_id());
		d.setGroup_step(prd.getGroup_step());
		d.setGroup_tab(prd.getGroup_tab());
		ReplyBoardDAO.replyReInsert(d);
		ReplyBoardDAO.replyDepthIncrement(Integer.parseInt(root));
		req.setAttribute("no", bno);
		req.setAttribute("page", page);
		return "board/reply_ok.jsp";
	}

}
