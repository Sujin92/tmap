<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="javax.mail.*"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.secondproject.joinlogin.email.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("EUC-KR");

	String from = "Tmap@kitri.com";
	String to = request.getParameter("email");
	String subject = "Tmap���� ���� ���� �����Դϴ�.";
	String content = to + "��  �Ʒ� ��ư�� Ŭ���ϸ� ������ �Ϸ�˴ϴ�.";
	String checkkey = request.getParameter("");
 //TODO content �ȿ� ���� ��ư ���� �Ϸ��ϱ� %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="sendmail.jsp" method="post">
			<table>
				<tr>
					<th colspan="2">Email ���� Ȯ��</th>
				</tr>
				<tr>
					<td>from</td>
					<td><input type="text" name="from" value="cjsmc@naver.com"/></td>
				</tr>
				<tr>
					<td>to</td>
					<td><input type="text" name="to" /></td>
				</tr>
				<tr>
					<td>subject</td>
					<td><input type="text" name="subject" value="Tmap���� ���� �̸����Դϴ�."/></td>
				</tr>
				<tr>
					<td>content</td>
					<td>
						<textarea name="content" style="width: 170px; height: 200px;">
							<center>
							�� �Ʒ� ��ư�� Ŭ���ϸ� �̸��� ������ �Ϸ�˴ϴ�.
							<button onclick="javascript:confirmmove();">�����ϱ�</button>
							</center>
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;"><input
						type="submit" value="Transmission" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function() {
	
	
});

function confirmmove() {
	document.location.href="http://localhost/secondproject/page/joinlogin/join/attestck.jsp";
	
}
</script>
<%
	// �Է°� ����

	Properties p = new Properties(); // ������ ���� ��ü

	p.put("mail.smtp.host", "smtp.naver.com"); // ���̹� SMTP

	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	// SMTP ������ �����ϱ� ���� ������

	try {
		Authenticator auth = new SMTPAuthenticatior();
		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		MimeMessage msg = new MimeMessage(ses); // ������ ������ ���� ��ü
		msg.setSubject(subject); // ����

		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr); // ������ ���

		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr); // �޴� ���

		msg.setContent(content, "text/html;charset=EUC-KR"); // ����� ���ڵ�

		Transport.send(msg); // ����
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<script>alert(���� �߼��� �����Ͽ����ϴ�. �ٽ� �õ����ּ���.');history.back();</script>");
		// ���� �߻��� �ڷ� ���ư�����
		return;
	}

	out.println(
			"<script>alert('������ �߼۵Ǿ����ϴ�. �̸����� Ȯ�����ּ���. ��ȿ �ð��� 10���Դϴ�.');location.href='sendmail.jsp?act=lastcheck&email=" + to + "';</script>");
	// ���� ��
%>
