package com.secondproject.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.secondproject.util.*;
import com.secondproject.factory.AdminFactory;

@WebServlet("/exhibition")
public class ExhibitionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");
		String path = "/index.jsp";
		String contentPath = "";
		String key = Encoding.nullToBlank(request.getParameter("key"));
		String word = request.getParameter("word");
		String order = Encoding.nullToBlank(request.getParameter("order"));
		String column = Encoding.nullToBlank(request.getParameter("column"));
		String queryString = "?key=" + key + "&word=" + Encoding.urlFormat(word) + "&order=" + order + "&column="
				+ column;
		int seq = NumberCheck.nullToZero(request.getParameter("seq"));
		if ("mvwrite".equals(act)) {
			path = "/template/admin/admin.jsp";
			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
			request.setAttribute("contentPath", "/page/adminpage/expage/write.jsp");
			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.forward(path, request, response);
		} else if ("write".equals(act)) {
			contentPath = AdminFactory.getExhibitionWriteAction().execute(request, response);
			path = "/template/admin/admin.jsp";
			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
			request.setAttribute("contentPath", contentPath);
			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.forward(path, request, response);
		} else if ("view".equals(act)) {
			
			contentPath = AdminFactory.getExhibitionViewAction().execute(request, response);
			path = "/template/admin/admin.jsp";
			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
			request.setAttribute("contentPath", contentPath );
			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.forward(path, request, response);
		} else if ("mvshoplist".equals(act)) {
			
			contentPath = AdminFactory.getExhibitionShopAction().execute(request, response);
			path = "/template/admin/admin.jsp";
			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
			request.setAttribute("contentPath", contentPath + queryString + "&seq=" + seq);
			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.forward(path, request, response);
		} else if ("delete".equals(act)) {
			contentPath = AdminFactory.getExhibitionDeleteAction().execute(request, response);
			String url = "/admin?act=mvexhibition";
//			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
//			request.setAttribute("contentPath", contentPath);
//			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
//			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.redirect(url, request, response);
		} else if ("plusshop".equals(act)) {
			contentPath = AdminFactory.getExhibitionShopUpAction().execute(request, response);

			path = "/template/admin/admin.jsp";
			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
			request.setAttribute("contentPath", contentPath);
			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.forward(path, request, response);
		} else if ("modify".equals(act)) {
			contentPath = AdminFactory.getExhibitionModifyAction().execute(request, response);

			path = "/template/admin/admin.jsp";
			request.setAttribute("titleTagValue", "Ÿ��Ʋ");
			request.setAttribute("contentPath", contentPath);
			request.setAttribute("addHeadPath", "/template/admin/include/head.jsp");
			request.setAttribute("addBottomPath", "/page/adminpage/include/bottom_exhibition.jsp");

			PageMove.forward(path, request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		doGet(request, response);
	}

}