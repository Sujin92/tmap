<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.constant.ContextPath" %>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%=ContextPath.root%>/adminIndex.jsp">Trust Map</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=ContextPath.root%>/admin?act=mvmember">ȸ������</a></li>
				<li class="dropdown">
        			<a class="dropdown-toggle" data-toggle="dropdown" href="#">�������
        			<span class="caret"></span></a>
			        <ul class="dropdown-menu">
			          <li><a href="#">���� ��⸮��Ʈ</a></li>
			          <li><a href="#">���� ����Ʈ</a></li>
			        </ul>
			    </li>
				<li><a href="#">�������</a></li>
				<li><a href="#">������</a></li>
				<li><a href="#">�ı����</a></li>
				<li class="dropdown">
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">��ȹ������
	        			<span class="caret"></span></a>
				        	<ul class="dropdown-menu">
					          <li><a href="<%=ContextPath.root%>/admin?act=mvexhibition">��ȹ�� ����Ʈ</a></li>
					          <li><a href="#">��ȹ�� ��ġ��</a></li>
				        	</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>