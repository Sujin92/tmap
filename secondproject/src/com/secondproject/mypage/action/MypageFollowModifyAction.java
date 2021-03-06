package com.secondproject.mypage.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.secondproject.action.Action;
import com.secondproject.action.BoardCommonAction;
import com.secondproject.constant.BoardConstant;
import com.secondproject.mypage.model.FollowCategoryDto;
import com.secondproject.mypage.model.FollowUserDto;
import com.secondproject.mypage.service.MypageServiceImpl;
import com.secondproject.userdto.UserDto;
import com.secondproject.util.Encoding;
import com.secondproject.util.QueryString;
import com.secondproject.util.pagination.Pagination;

public class MypageFollowModifyAction extends BoardCommonAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path="/page/mypage/mypage.jsp";
		HttpSession session = request.getSession();
		UserDto udto = (UserDto)session.getAttribute("logininfo");
		if(udto!=null) {
		int userId = udto.getUser_id();
		int followUserId = Integer.parseInt(request.getParameter("followUserId"));
		String alias = Encoding.isoToUtf(request.getParameter("alias"));
		String memo = Encoding.isoToUtf(request.getParameter("memo"));
		FollowUserDto fudto = new FollowUserDto();
		fudto.setAlias(alias);
		fudto.setMemo(memo);
		fudto.setUserId(followUserId);
		MypageServiceImpl.getMypageService().followModify(fudto);

		setBoardParameter(request);
		HashMap<String, Object> params = getParameterMap();
		params.put("userId", userId);
		
		int totalFollowUserCount = MypageServiceImpl.getMypageService().totalFollowUserCount(params);	
		List<FollowUserDto> list= MypageServiceImpl.getMypageService().followListView(params);
		List<FollowCategoryDto> fclist = MypageServiceImpl.getMypageService().followCategoryListView(params);
		Pagination pagination = new Pagination();
		pagination.setTotalCount(totalFollowUserCount);
		pagination.setCurrentPageNum((int) params.get("pg"));
		pagination.setListCountPerPage(BoardConstant.MYPAGE_PAGE_SIZE);
		pagination.setPageCount(BoardConstant.MYPAGE_LIST_SIZE);
		pagination.setStartQueryString("/mypage?act=followView");
		
		ArrayList<String> filter = new ArrayList<String>();
		filter.add("pg");
		String queryString = QueryString.getQueryString(params, filter);
		
		pagination.setQueryString(queryString);
		pagination.setHtml();
		
		request.setAttribute("pagination", pagination);

		request.setAttribute("followCategoryList", fclist);
		request.setAttribute("list", list);
		} else {
			path="/index.jsp";
		}
		return path;
	}

}
