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
<%@ include file="/page/joinlogin/join/mailform.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("EUC-KR");
 
String from = request.getParameter("from");
String to = request.getParameter("to");
String subject = request.getParameter("subject");
String content = request.getParameter("content");
// �Է°� ����
 
Properties p = new Properties(); // ������ ���� ��ü
 
p.put("mail.smtp.host","smtp.naver.com"); // ���̹� SMTP
 
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP ������ �����ϱ� ���� ������
 
try{
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
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert(���� �߼��� �����Ͽ����ϴ�. �ٽ� �õ����ּ���.');history.back();</script>");
    // ���� �߻��� �ڷ� ���ư�����
    return;
}
 
out.println("<script>alert('������ �߼۵Ǿ����ϴ�. �̸����� Ȯ�����ּ���. ��ȿ �ð��� 10���Դϴ�.');location.href='mailform.jsp';</script>");
// ���� ��
%>
