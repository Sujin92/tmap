package com.secondproject.admin.service;

import java.util.Map;

import com.secondproject.util.PageNavigation;

public interface CommonService {


	int totalExhibitionCount(Map<String, Object> params); // pagenavigation���� ����¡ ó�� ���ִ°� ��
	PageNavigation mypagePageNavigation(int pg, String key, String word, String control); // MYPAGE ����¡ó��
	
}