<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*,com.secondproject.mypage.model.*, com.secondproject.constant.ContextPath"%>




<div class="col-xs-9 col-md-9 col-xs-offset-1 a">

	
	
	<div class="map-container">
		<div id="map" style="width:100%;height:400px;"></div>
	</div>
	<h2 class="sub-header">���� �� �ı�</h2>
 	<% 
 	List<MyReviewDto> myreviewlist = (List<MyReviewDto>) request.getAttribute("reviewlist");
 	 for(MyReviewDto mrdto : myreviewlist) {
 		 
 	 
 	%> <%=mrdto.getShopName() %>  ����:<%for(int i=0;i<Integer.parseInt(mrdto.getShopScore()); i++) {
 	%>��<%
 	}%>   <button id="" class="btn btn-primary" type="button">����</button> <button id="" class="btn btn-primary" type="button">����</button>
 		<br><%=mrdto.getAddress() %>
 		<br><%=mrdto.getSubject() %>  �����غ��� : <%for(int i=0;i<Integer.parseInt(mrdto.getMyScore()); i++) {
 	%>��<%
 	}%>
 		<br><%=mrdto.getContent() %>
 		<br>������ : <%=mrdto.getUpdate_date() %>
 		<br>	
 	<%} %>
 </div>
