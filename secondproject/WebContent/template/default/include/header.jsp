<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.secondproject.constant.*, com.secondproject.userdto.UserDto"%>
<%
UserDto userDto = (UserDto) session.getAttribute("logininfo");
%>
<div id="header-container">
	<header id="header">
		<h1 id="logo"><a href="<%=ContextPath.root%>">야!진짜</a></h1>
		<ul class="nav-container">
			<li><a href="<%=ContextPath.root%>/map" class="nav-btn btn-map"><i class="fa fa-map-marker" aria-hidden="true"></i>MAP</a></li>
			<% if (userDto == null){ %>
				<li><a href="javascript:loginmove();" class="nav-btn btn-login">LOGIN</a></li>
			<% } else { %>
				<li><a href="<%=ContextPath.root%>/myreview?act=myreviewView&pg=1" class="nav-btn btn-login">Review</a></li>
				<li><a href="<%=ContextPath.root%>/mypage?act=followView&pg=1" class="nav-btn btn-login">Follow</a></li>
				<li><a href="javascript:logoutmove();" class="nav-btn btn-login">Logout</a></li>
			<% } %>
		</ul>
	</header>
</div>
<%-- 
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=ContextPath.root%>/index.jsp">Trust
				Map</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=ContextPath.root%>/map">Map</a></li>
				<% if (userDto == null){ %>
					<li><a href="javascript:joinmove();">Join</a></li>
					<li><a href="javascript:loginmove();">Login</a></li>
				<% } else { %>
					<li><a href="javascript:logoutmove();">Logout</a></li>
				<% } %>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Mypage
							<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=ContextPath.root%>/myreview?act=myreviewView&pg=1">내가쓴후기</a></li>
						<li><a href="#">평가한후기</a></li>
				 		<li><a href="<%=ContextPath.root%>/mypage?act=followView&pg=1">팔로우관리</a></li>
						<li><a href="#">매장관리</a></li>
					</ul>
				</li>
				<%if (userDto != null && userDto.getType() == 0) {%>
					<li><a href="/secondproject/adminIndex.jsp">관리자</a></li>
				<% } %>
			</ul>
		</div>
	</div>
</nav>
--%>