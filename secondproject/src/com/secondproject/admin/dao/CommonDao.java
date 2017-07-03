package com.secondproject.admin.dao;

import java.util.Map;

public interface CommonDao {
	int totalExhibitionCount(Map<String, Object> params);

	int totalReviewCount(Map<String, Object> params);

	int totalUserCount(Map<String, Object> params);

	int totalShopCount(Map<String, Object> params);

	int totalOwnerCount(Map<String, Object> params); // ������-������� ����

	int totalShopListCount(Map<String, Object> params); // ������-��ȹ������-���帮��Ʈ ����
}