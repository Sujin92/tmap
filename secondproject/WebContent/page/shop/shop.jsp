<%@page import="com.secondproject.constant.ContextPath"%>
<%@ page import="com.secondproject.shop.model.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%
	ShopDto shopDto = (ShopDto) request.getAttribute("shopDto");
%>

<div class="page-container">
	<div class="container">
		<div class="row">
			<%=shopDto.getCategoryTitle()%>
			<%=shopDto.getTitle()%>
			<%=shopDto.getTel()%>
			<%=shopDto.getScore()%>
			<%=shopDto.getBusinessTime()%>
			<%=shopDto.getDetail()%>
			<%=shopDto.getAddress()%>
			
			<ul>
				<li><button class="btn btn-default">���и���</button></li>
				<li><button class="btn btn-default">TMAP ����</button></li>
				<li><a href="<%=ContextPath.root%>/review?act=writeForm&shopId=<%=shopDto.getShopId()%>">�����ۼ�</a></li>
			</ul>
		</div>
	</div>
</div>

