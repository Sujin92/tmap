package com.secondproject.mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondproject.factory.MypageFactory;
import com.secondproject.mypage.action.MypageFollowAddAction;

@WebServlet("/myreview")
public class MyreviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/index.jsp";
		String act = request.getParameter("act");
		if("myreviewView".equals(act)) {
			path=MypageFactory.getMypageReviewListViewAction().execute(request, response);
		} else if("viewreview".equals(act)) {		
			path = MypageFactory.getMypageReviewViewAction().execute(request, response);
		} else if("goodbad".equals(act)) {
			path = MypageFactory.getGoodBadAction().execute(request, response);
		} else if("commentinsert".equals(act)) {
			path= MypageFactory.getCommentInsertAction().execute(request, response);
		} else if("yourreview".equals(act)) {
			path=MypageFactory.getMypageYourReviewListViewAction().execute(request, response);
		} else if("".equals(act)) {
		
			
		}
		request.setAttribute("titleTagValue", "����������");
		request.setAttribute("contentPath", path);
		request.setAttribute("addHeadPath", "/page/mypage/include/head.jsp");
		request.setAttribute("addBottomPath", "/page/mypage/include/bottom.jsp");
		
		RequestDispatcher dist = request.getRequestDispatcher("/template/default/default.jsp");
		dist.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request,response);
	}
	

}
