package com.secondproject.admin.service;

import java.util.Map;

import com.secondproject.util.PageNavigation;

public interface CommonService {


	int totalExhibitionCount(Map<String, Object> params); // ������-��ȹ������ ����
	
	int totalReviewCount(Map<String, Object> params); // ������-������� ����
	
	int totalUserCount(Map<String, Object> params); // ������-ȸ������ ����
	
	int totalShopCount(Map<String, Object> params); // ������-�������  ���� 
	
	int totalOwnerCount(Map<String, Object> params); // ������-������� ����
	
	int totalShopListCount(Map<String, Object> params); // ������-��ȹ������-���帮��Ʈ ����
}