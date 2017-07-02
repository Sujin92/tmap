<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	//String root = request.getContextPath();
%>
<form id="joinform" name="joinform" method="post" action="">
	<input type="hidden" name="act" value="attest">
	<div class="modal" id="joinmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<center>
						<h4 class="modal-title">Join</h4>
					</center>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="inputEmail" class="col-lg-2 control-label">Email</label>
						<input type="email" class="form-control" id="joinEmail"
							placeholder="Email" name="email" onkeyup="javascript:idcheck();">
						<div id="idresult"></div>
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Password</label>
						<input type="password" class="form-control" id="joinPassword"
							name="password" placeholder="Password">
					</div>
					<div class="form-group">
						<label for="inputPassword" class="col-lg-2 control-label">Password
							Check</label> <input type="password" class="form-control"
							id="password_check" placeholder="Password check" onkeyup="javascript:pwcheck();">
						<div id="pw_check"></div>
					</div>
					<div class="form-group">
						<label for="inputAge" class="col-lg-2 control-label"><h4>Age</h4></label>
						<div class="col-xs-3">
							<input type="text" class="form-control" placeholder="Age"
								id="age" name="age">
						</div>
						<label for="inputGender" class="col-lg-2 control-label"><h4>Gender</h4></label>
						<div class="btn-group">
							<select class="form-control" id="gender" name="gender">
								<option>Gender</option>
								<option value="1">Male</option>
								<option value="2">Female</option>
							</select>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<center>
					�Ʒ� ��ư�� Ŭ���� �Է��Ͻ� Email �ּҷ� mail�� �߼۵˴ϴ�.<br>
					��ȿ �ð��� 10���Դϴ�.<br>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="javascript:attest();">Email �����ϱ�</button>
					</center>
					<button type="button" class="btn btn-default"
						onclick="">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</form>
<script type="text/javascript" src="/secondproject/page/joinlogin/js/joinajax.js"></script>
<script>
	function attest() {
		if (document.getElementById("joinEmail").value == "") {
			alert("�̸����� �Է����ּ���.");
			return;
		} else if (document.getElementById("joinPassword").value == "") {
			alert("��й�ȣ�� �Է����ּ���.");
			return;
		} else if (document.getElementById("joinPassword").value != document.getElementById("password_check").value) {
			alert("��й�ȣ�� Ȯ�����ּ���.");
			return;
		} else if (document.getElementById("gender").value == "") {
			alert("������ �Է����ּ���.");
			return;
		} else if (document.getElementById("age").value == "") {
			alert("���̸� �Է����ּ���.");
			return;
		} else {
			document.joinform.action = "/secondproject/joinlogin"
			document.joinform.submit();
		}
	}
var view;

function idcheck() {
	view = document.getElementById("idresult");
	var idck = document.getElementById("joinEmail").value;
	console.log(idck.match("@"));
	if(idck.match("@") == null){
		view.innerHTML="<font color='RED'>�̸��� ������ ���߾���մϴ�.</font>"
	} else {
		var param ="act=idcheck&email=" + encodeURIComponent(idck);
		sendRequest("/secondproject/joinlogin", param, idresult, "GET");
	}
}

function idresult() {
	if(httpRequest.readyState == 4){
		if(httpRequest.status == 200){
			var txt = httpRequest.responseText;
			view.innerHTML = txt; 
		} else {
			alert("�����߻� : " + httpRequest.status);
		}
	}
}

function pwcheck() {
	view = document.getElementById("pw_check");
	var pw = document.getElementById("joinPassword").value;
	var pwck = document.getElementById("password_check").value;
	if(pw != pwck){
		view.innerHTML="<font color='RED'>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</font>"
	} else {
		view.innerHTML="<font color='BLUE'>��й�ȣ�� ��ġ�մϴ�.</font>"
	}
}

</script>