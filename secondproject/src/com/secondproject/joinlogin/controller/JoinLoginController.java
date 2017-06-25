package com.secondproject.joinlogin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondproject.constant.ContextPath;
import com.secondproject.factory.JoinLoginFactory;
import com.secondproject.util.PageMove;

@WebServlet("/joinlogin")
public class JoinLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");
		String path ="/index.jsp";
		if("login".equals(act)){ //�α���
			path = JoinLoginFactory.getLoginAction().execute(request, response);
			PageMove.forward(path, request, response);
		} else if ("logout".equals(act)) { //�α׾ƿ�
			HttpSession session = request.getSession();
			session.removeAttribute("logininfo"); //���� ����
			path ="/index.jsp";
			PageMove.redirect(path, request, response);
		} else if ("join".equals(act)){ //ȸ������
			path = JoinLoginFactory.getJoinAction().execute(request, response);
			PageMove.forward(path, request, response);
		} else if ("withdraw".equals(act)){ //Ż�� ��
			path = JoinLoginFactory.getJoinAction().execute(request, response);
			PageMove.forward(path, request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		doGet(request, response);
	}

}
