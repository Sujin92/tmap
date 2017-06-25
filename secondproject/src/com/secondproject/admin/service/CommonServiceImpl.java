package com.secondproject.admin.service;

import java.util.HashMap;
import java.util.Map;

import com.secondproject.admin.dao.CommonDaoImpl;
import com.secondproject.util.BoardConstance;
import com.secondproject.util.PageNavigation;


// 1. private ������
// 2. static ���� ����
// 3. static{} ��ü ����
// 4. �ڽ��� �����ϴ� get method ����
public class CommonServiceImpl implements CommonService {

	private static CommonService commonService; // interface Ÿ������ ���

	private CommonServiceImpl(){};

	static {

		commonService = new CommonServiceImpl();
	}

	public static CommonService getCommonService() {
		return commonService;
	}

	@Override
	public PageNavigation makePageNavigation(int pg, String key, String word, String board) {
		// �� ������ �׺���̼� ����°�
		PageNavigation pageNavigation = new PageNavigation();
		int totalArticleCount = 0;
		 // root�� ���񽺿��� �ϼ��� �� ����
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word); // ��ü �� �� �� ���߿� key�� word�� �ʿ��ϴ�
		if (board.equals("review")) {
			totalArticleCount = CommonDaoImpl.getCommonDao().totalReviewCount(map);
		} else {
			totalArticleCount = CommonDaoImpl.getCommonDao().totalArticleCount(map); // db
		}
		pageNavigation.setTotalArticleCount(totalArticleCount);
		int totalPageCount = (totalArticleCount - 1) / 5 + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		pageNavigation.setNowFirst(pg <= BoardConstance.PAGE_SIZE);
		pageNavigation.setNowEnd((totalPageCount-1) / BoardConstance.PAGE_SIZE * BoardConstance.PAGE_SIZE < pg ); // 0���� ������ �������� ���� 1�� ���ָ� ��
		pageNavigation.setPageNo(pg);
		System.out.println("commonservice end" + pg);
		return pageNavigation;
	}
}