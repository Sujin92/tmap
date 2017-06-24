package com.secondproject.admin.service;

import java.util.*;

import com.secondproject.admin.dao.AdminReviewDaoImpl;
import com.secondproject.admin.dao.ExhibitionDaoImpl;
import com.secondproject.review.model.AdminReviewDto;
import com.secondproject.util.BoardConstance;

public class AdminReviewServiceImpl implements AdminReviewService {
	
	private static AdminReviewService adminReviewService;
	


	static {
		adminReviewService = new AdminReviewServiceImpl();
	}
	
	private AdminReviewServiceImpl(){}
	
	public static AdminReviewService getAdminReviewService() {
		return adminReviewService;
	}
	
	@Override
	public List<AdminReviewDto> listReview(String key, String word, String order, String column, int pg) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		map.put("order", order);
		map.put("column", column);
		int end = pg * BoardConstance.LIST_SIZE;
		int start = end - BoardConstance.LIST_SIZE; 
		map.put("start", start +""); // ������ ù��ȣ�� ��������ȣ�� ����ϱ� ���ؼ� start�� end ����
		map.put("end", end +"");
		
		return AdminReviewDaoImpl.getAdminReviewDao().listReview(map);
	}

	@Override
	public AdminReviewDto viewReview(int seq) {
		return null;
	}

	@Override
	public int blindExhibition(String[] reviews) {
		return 0;
	}


}
