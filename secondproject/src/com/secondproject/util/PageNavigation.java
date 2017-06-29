package com.secondproject.util;

public class PageNavigation {
	private String root;
	private boolean nowFirst; // ���� pg��BoardConstance���� Page_size���� ������ true, ũ�� false
	private boolean nowEnd; // ������ ������ �����ִ���
	private int totalArticleCount; // ��ü�ۼ�
	private int newArticleCount; // ���ۼ�
	private int totalPageCount; // ��ü��������
	private int pageNo; // ����������
	private String navigator; // ����¡
	private int listSize;
	private int pageSize;

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public boolean isNowFirst() {
		return nowFirst;
	}

	public void setNowFirst(boolean nowFirst) {
		this.nowFirst = nowFirst;
	}

	public boolean isNowEnd() {
		return nowEnd;
	}

	public void setNowEnd(boolean nowEnd) {
		this.nowEnd = nowEnd;
	}

	public int getTotalArticleCount() {
		return totalArticleCount;
	}

	public void setTotalArticleCount(int totalArticleCount) {
		this.totalArticleCount = totalArticleCount;
	}

	public int getNewArticleCount() {
		return newArticleCount;
	}

	public void setNewArticleCount(int newArticleCount) {
		this.newArticleCount = newArticleCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public String getNavigator() {
		return navigator;
	}

	public void setNavigator() {
		 StringBuffer tmpNavigator = new StringBuffer();
		 
		 int prePage = (pageNo -1) / pageSize * pageSize; // �������������� 40�̾�����
		 
	      tmpNavigator.append("<div class=\"pgnav\"> \n");
	      tmpNavigator.append(" <ul class=\"pagination\"> \n");
	      if (this.isNowFirst()) {

	         tmpNavigator.append("  <li><a href='' aria-label=\"Previous\">");
	         tmpNavigator.append("   <span aria-hidden=\"true\"><font color=\"#ec9a25\">&laquo;</font></span>\n");
	         tmpNavigator.append("   </a></li> \n");
	      } else {

		         tmpNavigator.append("  <li><a href='javascript:listArticle("+ prePage +")' aria-label=\"Previous\">");
		         tmpNavigator.append("   <span aria-hidden=\"true\"><font color=\"#ec9a25\">&laquo;</font></span>\n");
		         tmpNavigator.append("   </a></li> \n");
	      }
	      
	      int startPage = prePage + 1;
	      int endPage = startPage + (pageSize - 1) ;
	      if (endPage > totalPageCount) {
	    	  endPage = totalPageCount; // �� �������� ���������� ���� endPage�� �� ũ�� �� �������� �������� endPage�� �ȴ�. totalPage : 37 / endPage : 40
	      }
	      for (int i = startPage; i <= endPage; i++) {
	         if (pageNo == i) { // ���������� �۾� ũ��� ���� �ٸ�, Ŭ���� �� ����
	          tmpNavigator.append("	 <li><a href='' class=\"color-orange\">" + i + "</a></li> \n");
	         } else { // ������������ �ƴ� �ٸ� �������� Ŭ���� �� �ְ�, �۾��� �ٸ�
	          tmpNavigator.append("	 <li><a href='javascript:listArticle(" + i + ")' class=\"color-orange\">" + i + "</a></li> \n");
	         }
	      }
	      
	      if (this.isNowEnd()) {
	         tmpNavigator.append("		<li><a href='' aria-label=\"Next\"> <span aria-hidden=\"true\"> \n");
	         tmpNavigator.append("   	<font color=\"#ec9a25\">&raquo;</font></span> \n");
	         tmpNavigator.append(" 		</a></li> \n");

	      } else {
	 		 int nextPage = prePage + pageSize + 1; // 40 + ����������� 1 �ϸ� �� ���� ������������� ù��°�� 51
	 		 tmpNavigator.append("		<li><a href='javascript:listArticle("+ totalPageCount +")' aria-label=\"Next\"> <span aria-hidden=\"true\"> \n");
	         tmpNavigator.append("   	<font color=\"#ec9a25\">&raquo;</font></span> \n");
	         tmpNavigator.append(" 		</a></li> \n");
	      }

	      tmpNavigator.append("  </ul>\n");
	      tmpNavigator.append(" </div>\n");

	      this.navigator = tmpNavigator.toString();
	}

}