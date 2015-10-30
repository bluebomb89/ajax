package com.board.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/*
 *   class A
 *   {
 *       int a=10;
 *       
 *       {
 *          a=20;
 *       }
 *       
 *       public A()
 *       {
 *          a=30;
 *       }
 *   }
 *   A aa=new A();  => 30
 */
import java.util.*;
import java.io.*;
public class ReplyBoardDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
   }
   // 데이터 가지고 오기 
   public static List<ReplyBoardDTO> boardListData(Map map)
   {
	   List<ReplyBoardDTO> list=
			   new ArrayList<ReplyBoardDTO>();
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("boardListData",map);
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return list;
	   //return ssf.openSession().selectList("boardListData",map);
   }
   // 총페이지
   public static int boardTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   int count=session.selectOne("boardRowCount");
		   total=(int)(Math.ceil(count/10.0));
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return total;
   }
   public static void boardInsert(ReplyBoardDTO d)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   session.insert("boardInsert",d);
		   //session.commit();
	   }catch(Exception ex)
	   {
		   //session.rollback();
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		  if(session!=null)
			  session.close();
	   }
   }
   
   public static ReplyBoardDTO boardContentData(int no,int type)
   {
	   SqlSession session=null;
	   ReplyBoardDTO d=new ReplyBoardDTO();
	   try
	   {
		   session=ssf.openSession(true);
		   if(type==1)
		   {
		     session.update("boardHitIncrement",no);
		   }
		   //session.commit();
		   d=session.selectOne("boardContentData", no);
	   }catch(Exception ex)
	   {
		   //session.rollback();
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		  if(session!=null)
			  session.close();
	   }
	   return d;
   }
   
   public static ReplyBoardDTO boardUpdateData(int no)
   {
	   SqlSession session=null;
	   ReplyBoardDTO d=new ReplyBoardDTO();
	   try
	   {
		   session=ssf.openSession(true);
		   //session.update("boardHitIncrement",no);
		   //session.commit();
		   d=session.selectOne("boardContentData", no);
	   }catch(Exception ex)
	   {
		   //session.rollback();
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		  if(session!=null)
			  session.close();
	   }
	   return d;
   }
   
   public static String boardGetPwd(int no)
   {
	   SqlSession session=null;
	   String d="";
	   try
	   {
		   session=ssf.openSession(true);
		   //session.update("boardHitIncrement",no);
		   //session.commit();
		   d=session.selectOne("boardGetPwd", no);
	   }catch(Exception ex)
	   {
		   //session.rollback();
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		  if(session!=null)
			  session.close();
	   }
	   return d;
   }
   public static void boardUpdate(ReplyBoardDTO d)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   session.insert("boardUpdate",d);
		   //session.commit();
	   }catch(Exception ex)
	   {
		   //session.rollback();
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		  if(session!=null)
			  session.close();
	   }
   }
   public static void boardDelete(int no)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   session.delete("boardReplyDelete",no);
		   session.delete("boardDelete",no);
		   session.commit();
	   }catch(Exception ex)
	   {
		   session.rollback();
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null) session.close();
	   }
   }
   public static int boardReplyCount(int bno)
   {
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("boardReplyCount",bno);
	   session.close();
	   return count;
   }
   public static List<ReplyDTO> replyListData(int bno)
   {
	   SqlSession session=ssf.openSession();
	   List<ReplyDTO> list=
			   session.selectList("replyListData",bno);
	   session.close();
	   return list;
   }
   public static void replyNewInsert(ReplyDTO d)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("replyNewInsert",d);
	   session.close();
   }
   
   public static ReplyDTO replyParentInfo(int bno)
   {
	   SqlSession session=ssf.openSession();
	   ReplyDTO list=
			   session.selectOne("replyParentInfo",bno);
	   session.close();
	   return list;
   }
   public static void replyStepIncrement(ReplyDTO d)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("replyStepIncrement",d);
	   session.close();
   }
   public static void replyDepthIncrement(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("replyDepthIncrement",no);
	   session.close();
   }
   public static void replyReInsert(ReplyDTO d)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("replyReInsert",d);
	   session.close();
   }
   public static void replyReUpdate(ReplyDTO d)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("replyReUpdate",d);
	   session.close();
   }
   
   public static ReplyDTO replyGetDepthRoot(int no)
   {
	   SqlSession session=ssf.openSession();
	   ReplyDTO list=
			   session.selectOne("replyGetDepthRoot",no);
	   session.close();
	   return list;
   }
   public static void replyDepthDecrement(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("replyDepthDecrement",no);
	   session.close();
   }
   public static void replyMsgUpdate(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.update("replyMsgUpdate",no);
	   session.close();
   }
   public static void replyDelete(int no)
   {
	   SqlSession session=ssf.openSession(true);
	   session.delete("replyDelete",no);
	   session.close();
   }
   public static int replyPageTotalpage(int bno)
   {
	   SqlSession session=ssf.openSession();
	   int count=session.selectOne("replyPageRowCount",bno);
	   session.close();
	   return (int)(Math.ceil(count/5.0));
   }
}






