<%@page import="com.secondproject.constant.ContextPath"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
int shopId = (int) request.getAttribute("shopId");
%>
<script>
alert('�����Ǿ����ϴ�.');
location.href=<%=ContextPath.root%>"/shop?act=view&shopId=<%=shopId%>";
</script>