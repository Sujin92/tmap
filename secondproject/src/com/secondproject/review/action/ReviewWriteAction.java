package com.secondproject.review.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.secondproject.action.Action;
import com.secondproject.review.model.ReviewDto;
import com.secondproject.review.service.ReviewServiceImple;
import com.secondproject.util.NumberCheck;

public class ReviewWriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isValidate = false;
		
		int shopId = NumberCheck.nullToZero(request.getParameter("shopId"));
		int userId = NumberCheck.nullToZero(request.getParameter("userId"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int score = Integer.parseInt(request.getParameter("score"));

		if (shopId == 0) {
			
		} else if (userId == 0) {
			
		}
			
		

		
		// shopId == 0 || userId == 0 �̶�� ���񽺿� �� ��ų�ʿ䰡 ����.
		// �׷��ٸ�.....������������ �ٷ� �������� ���װ�..
		// ���������������� ���â�� �ٿ�� �ڷΰ���?
		
		ReviewDto reviewDto = new ReviewDto();
		reviewDto.setShopId(shopId);
		reviewDto.setUserId(userId);
		reviewDto.setTitle(title);
		reviewDto.setContent(content);
		reviewDto.setScore(score);
		ReviewServiceImple.getReviewService().addReview(reviewDto);
		
		return null;
	}
	
	private boolean validate() {
		return false;
	}

}
