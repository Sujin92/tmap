package com.secondproject.admin.service;

import com.secondproject.util.PageNavigation;

public interface CommonService {

	
	PageNavigation makePageNavigation(int pg, String key, String word, String board); // pagenavigation���� ����¡ ó�� ���ִ°� ��
	PageNavigation mypagePageNavigation(int pg, String key, String word, String board); // MYPAGE ����¡ó��
	
}