var view;
var httpRequest;

function logincheck(){
	if(document.getElementById("email").value == ""){
		alert("�̸����� �Է����ּ���.");
		return;
	} else if (document.getElementById("password").value == ""){
		alert("��й�ȣ�� �Է����ּ���.");
		return; 
	} else { 
		document.loginform.action = "/secondproject/joinlogin"
		document.loginform.submit();
	}
}

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
		document.joinform.action = CONTEXT_PATH + "/joinlogin"
		document.joinform.submit();
	}
}

function idcheck() {
	view = document.getElementById("idresult");
	var idck = document.getElementById("joinEmail").value;
	console.log(idck.match("@"));
	if(idck.match("@") == null){
		view.innerHTML="<font color='RED'>�̸��� ������ ���߾���մϴ�.</font>"
	} else {
		var param ="act=idcheck&email=" + encodeURIComponent(idck);
		sendRequest(CONTEXT_PATH + "/joinlogin", param, idresult, "GET");
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

function loginmove() {
	$("#loginmodal").modal("show");
}

function joinmove() {
	$("#joinmodal").modal("show");
}

function logoutmove() {
	document.location.href = CONTEXT_PATH + "/joinlogin?act=logout";
}

function getXMLHttpRequest() {
	if (window.ActiveXObject) { // IE ���
		try {
			return new ActiveXObject("Msxml2.XMLHTTP"); // IE 7�̻�
		} catch (e1) { // �ڹٽ�ũ��Ʈ�� �ͼ��� ó�� ���� e�� �ᵵ �˾Ƽ�
			try {
				return new ActiveXObject("Microsoft.XMLHTTP"); // IE 7 ��
			} catch (e2) { // �ڹٽ�ũ��Ʈ�� �ͼ��� ó�� ���� e�� �ᵵ �˾Ƽ�
				alert("�������� �ʴ� �������Դϴ�.");
				return null;
			}
		}
	} else if (window.XMLHttpRequest) { // IE�� �ƴ� ������
		return new XMLHttpRequest(); // �̷��� ������ָ� �ȴ�.
	} else { // XMLHttpRequest�� �������� �ʴ� ������
		alert("�������� �ʴ� �������Դϴ�.");
		return null;
	}
}

function sendRequest(url, param, callback, method) { //4���� ������ �޴°ɷ� ����
	httpRequest = getXMLHttpRequest(); // ���������� �޶� ���⼭ ��ü ����
	
	var httpMethod = method ? method : "GET"; //��ũ���� ���׿����� ����
	if(httpMethod != "GET" && httpMethod != "POST") {
		httpMethod = "GET" //����Ʈ�� ������ get�� �ǰԲ�
	} //�޼ҵ� Ÿ�� �ϼ�
	
	var httpParam = (param == null || param == "") ? null : param;
	var httpUrl = url;
	if(httpMethod == "GET" && httpParam != null) { //���̸鼭 null�� �ƴ� ���
		httpUrl = httpUrl + "?" + httpParam;
	}
	
	httpRequest.onreadystatechange = callback; 
	httpRequest.open(httpMethod, httpUrl, "true"); // post�� �ƴ� ��� (�̻��ϰ� ���°�� ����) default�� get
	httpRequest.send(httpMethod == "POST" ? httpParam : null); // post��Ŀ��� send���� param �״�� ������ get�̸� null��
}