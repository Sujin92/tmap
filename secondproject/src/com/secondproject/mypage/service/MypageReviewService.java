package com.secondproject.mypage.service;

import java.util.List;
import java.util.Map;

import com.secondproject.mypage.model.FollowCategoryDto;
import com.secondproject.mypage.model.FollowUserDto;
import com.secondproject.mypage.model.MyReviewDto;

public interface MypageReviewService {
	 List<MyReviewDto> reviewListView(Map<String, Object> params);
	 MyReviewDto reviewView(int reviewId);
	 int totalReviewCount(Map<String, Object> params);
	
	 
}

