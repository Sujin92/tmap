<%@page import="com.secondproject.constant.ContextPath"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.userdto.UserDto"%>
    <%

    %>
    <script>
	alert('���������� ȸ�������� �Ǿ����ϴ�.');
	location.href = "<%=ContextPath.root%>/";
</script>
	<!-- <div class="modal" id="joinokmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<center>
						<h4 class="modal-title">Join Success</h4>
					</center>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<center>
<<<<<<< HEAD
						<label for="inputEmail" class="col-lg-2 control-label"><font color="blue"></font>�� ������ ���������� �Ϸ�Ǿ����ϴ�.<br>
=======
						<label for="inputEmail" class="col-lg-2 control-label"><font color="blue"><%--=userDto.getEmail() --%></font>�� ������ ���������� �Ϸ�Ǿ����ϴ�.<br>
>>>>>>> branch 'master' of https://github.com/Sujin92/tmap.git
						ȸ�������� �����մϴ�. �α����Ͻø� ���񽺸� �̿��Ͻ� �� �ֽ��ϴ�.
						</label>
						</center>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="javascript:loginmove();">Go Login</button>
					<button type="button" class="btn btn-default"
						onclick="javascript:cancel();">Cancel</button>
				</div>
			</div>
		</div>
	</div>
	
<script> 
function loginmove() {
	$("#loginmodal").modal("show");
}
</script>
<!--  
=======
<%
//    } else {
%>
>>>>>>> branch 'master' of https://github.com/Sujin92/tmap.git
<script>
alert("�������� �����Դϴ�.");
document.location.href ="/index.jsp";
</script>
<<<<<<< HEAD
-->
