<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.userdto.UserDto"%>
    <%
    UserDto userDto = (UserDto) session.getAttribute("attestinfo");
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
$()document.ready(function() {
	$.ajax({
		type : "post",
		url : "/secondproject/joinlogin",
		data : {'act' : 'lastcheck', 'user_id' : '<%=userDto.getUser_id()%>', 'email' : '<%=userDto.getEmail()%>', 'type' : '<%=userDto.getType()%>'},
		datatype : '??', //���� ������ϳ�
		success : lastcheck
	})

});

function lastcheck() {
	if(){ //3���� �� ������ 
		$("#joinokmodal").modal("show"); //id�� joinok�� ���â ����
	} else {
		$("#joinfailmodal").modal("show"); //id�� joinfail�� ��� ����
	}
}
</script>
</head>
<body>

</body>
</html>