package com.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.common.Model;
import java.util.*;
import com.member.dao.*;
public class PostFindModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		String dong=req.getParameter("dong");
		System.out.println(dong);
		List<ZipcodeDTO> list=MemberDAO.postfindData(dong);
		if(list.size()>0 || list==null){
			for(ZipcodeDTO d:list){
				d.setAddr(d.getSido()+" "+d.getGugun()+" "+d.getDong()+" "+d.getBunji());
			}
		}
		req.setAttribute("list", list);
		req.setAttribute("count", list.size());
		return "member/postfind_result.jsp";
	}

}
