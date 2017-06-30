package com.secondproject.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.secondproject.admin.model.ExhibitionDto;
import com.secondproject.admin.service.CommonServiceImpl;
import com.secondproject.util.PageMove;


@WebServlet("/picture")
public class PictureUploadControrller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String saveDirectory;
	private int maxPostSize;
	private String encoding;

	public void init(ServletConfig config) {
		ServletContext context = config.getServletContext();
		saveDirectory = context.getRealPath("/upload/album");
		maxPostSize = 3 * 1024 * 1024;
		encoding = "EUC-KR";
		
	}
	// ������ File Upload�� get����� �ƴ� post ��ĸ� ��� 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DateFormat df = new SimpleDateFormat("yyMMdd");
		String today = df.format(new Date());
		String upfolder = saveDirectory + File.separator + today; // �ٹ�\170626 ( File.separator�� ������ => \ ) 
		File folder = new File(upfolder);
		if (!folder.exists()) { // ������ ���������ʴ´ٸ�
			folder.mkdirs(); // ���� ����°�
		}// ���� ����� �������� ���� �� 
		System.out.println(saveDirectory);
		MultipartRequest multi = new MultipartRequest(request, upfolder, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
		String act = multi.getParameter("act"); // multipartRequest�� �Ҷ��� multi.getparameter�� �ؾ���
		
			
			ExhibitionDto exhibitionDto = new ExhibitionDto();
			
			exhibitionDto.setExhibitionId(1);
			exhibitionDto.setExDesc(multi.getParameter("content"));
			exhibitionDto.setExImage(multi.getFilesystemName("picturename"));
			exhibitionDto.setExOrder(1);
			exhibitionDto.setExTitle(multi.getParameter("subject"));
			exhibitionDto.setExVisiable(1);
			
		String path = "/page/adminpage/expage/exhibitioin.jsp";
		PageMove.forward(path, request, response);
	}
}