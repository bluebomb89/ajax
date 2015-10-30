package com.board.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Model;
import com.board.dao.*;
public class BoardContentModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String rPage=req.getParameter("rPage");
		int type=1;
		if(rPage==null)
		{
			rPage="1";
			type=0;
		}
		int rcurpage=Integer.parseInt(rPage);
		String strNo=req.getParameter("no");
		String strPage=req.getParameter("page");
		ReplyBoardDTO d=ReplyBoardDAO.boardContentData(
				Integer.parseInt(strNo),type);
		List<ReplyDTO> temp=
			ReplyBoardDAO.replyListData(Integer.parseInt(strNo));
		int rtotal=ReplyBoardDAO.replyPageTotalpage(Integer.parseInt(strNo));
		List<ReplyDTO> list=
				new ArrayList<ReplyDTO>();
		int j=0;
		int pagecnt=(rcurpage*5)-5;
		for(int i=0;i<temp.size();i++)
		{
			if(j<5 && i>=pagecnt)
			{
				ReplyDTO dd=temp.get(i);
				list.add(dd);
				j++;
			}
		}
		req.setAttribute("rtotal", rtotal);
		req.setAttribute("rcurpage", rcurpage);
		req.setAttribute("rlist", list);
		req.setAttribute("page", strPage);
		req.setAttribute("dto", d);
		req.setAttribute("title", "내용보기");
		req.setAttribute("jsp", "../board/board_content.jsp");
		return "main/main.jsp";
	}

}
