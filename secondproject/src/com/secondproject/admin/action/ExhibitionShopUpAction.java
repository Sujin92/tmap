package com.secondproject.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondproject.action.Action;
import com.secondproject.admin.model.ExhibitionDetailDto;
import com.secondproject.admin.service.ExhibitionServiceImpl;

public class ExhibitionShopUpAction implements Action {

	// �����߰��ϴ� �׼�
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = "/adminIndex.jsp"; 
		String[] shops = request.getParameterValues("checkbox");
		PrintWriter out = response.getWriter();
		if (shops == null || shops.length <= 0) {
			out.println("<script>alert(\"���õ� ������ �����ϴ�.\")</script>");
		} else {
			for (int i = 0; i < shops.length; i++) {
				out.println("������ �� : " + shops[i] + "<br>");
			}
		}
		
		ExhibitionDetailDto exhibitionDetailDto = new ExhibitionDetailDto();
//		exhibitionDetailDto.setExhibitionId(exhibitionId);
//		exhibitionDetailDto.setShopId(shopId);
//		exhibitionDetailDto.setExdDesc(exdDesc);
//		exhibitionDetailDto.setExdOrder(exdOrder);
//		int cnt = ExhibitionServiceImpl.getExhibitionService().plusExhibition(shops);
//		
//		if (cnt != 0) {
//			path = "/page/adminpage/expage/writeOk.jsp";
//		} else  {
//			path = "/page/adminpage/expage/writeFail.jsp";
//		}
		return path;
	}

}
