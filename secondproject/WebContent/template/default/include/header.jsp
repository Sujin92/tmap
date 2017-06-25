<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.secondproject.constant.*"%>
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
				<li><a href="javascript:joinmove();">Join</a></li>
				<li><a href="javascript:loginmove();">Login</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Mypage
							<span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<%=ContextPath.root%>/myreview">�������ı�</a></li>
						<li><a href="#">�����ı�</a></li>
						<li><a href="<%=ContextPath.root%>/mypage">�ȷο����</a></li>
						<li><a href="#">�������</a></li>

					</ul>
				</li>

			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
	</div>
</nav>

	<%@ include file="/page/joinlogin/login/login.jsp"%>
	<%@ include file="/page/joinlogin/join/join.jsp" %>

<!-- �α��� ȸ������ ���â ���� script -->
<script> 
function loginmove() {
	$("#loginmodal").modal("show");
}
function joinmove() {
	$("#joinmodal").modal("show");
}
</script>