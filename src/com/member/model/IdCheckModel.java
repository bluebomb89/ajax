package com.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Model;
import com.member.dao.MemberDAO;

public class IdCheckModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String id=req.getParameter("id");
		int count=MemberDAO.memberIdcheck(id);
		req.setAttribute("count", count);
		return "member/idcheck_result.jsp";
	}

}
