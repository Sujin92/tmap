package com.secondproject.admin.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondproject.action.Action;
import com.secondproject.admin.dao.ExhibitionDaoImpl;
import com.secondproject.admin.model.ExhibitionDetailDto;
import com.secondproject.admin.model.ExhibitionDto;
import com.secondproject.admin.service.ExhibitionServiceImpl;
import com.secondproject.util.NumberCheck;

public class ExhibitionWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ExhibitionDetailDto exhibitionDetailDto = new ExhibitionDetailDto();
		
		String path = "/adminIndex.jsp";
		int seq = ExhibitionDaoImpl.getExhibitionDao().getNextSeq(); // �� ��ȣ ��� db����
		String subject = request.getParameter("subject");
		int visiable = 0;
		int order = Integer.parseInt(request.getParameter("changeroot"));
		if (NumberCheck.nullToZero(request.getParameter("isvisiable")) == 0) {
			visiable = 0;
		} else {
			visiable = 1;
		}
		exhibitionDetailDto.setExhibitionId(seq);
		exhibitionDetailDto.setExTitle(request.getParameter("subject"));
		exhibitionDetailDto.setExDesc(request.getParameter("content"));
		exhibitionDetailDto.setExImage("asdfsdf");
		exhibitionDetailDto.setExOrder(order); // �ϴ� 6��° ��ȹ���̶�� ���� 8��8 ������ �׸���,,
		exhibitionDetailDto.setExVisiable(visiable); // üũ�ڽ� value�� ������ �ϱ�
		
		int cnt = ExhibitionServiceImpl.getExhibitionService().writeExhibition(exhibitionDetailDto);
		if (cnt != 0) {
			request.setAttribute("exhibitionInfo", exhibitionDetailDto);
			path = "/page/adminpage/expage/view.jsp";
//			path = "/page/adminpage/expage/writeOk.jsp";
		} else {
			path = "/page/adminpage/expage/writeFail.jsp";
		}
		return path;
	}

}