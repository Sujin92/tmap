<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.util.*" import="com.secondproject.constant.*"%>
<%
String board = request.getParameter("board"); // ��ũ�� �������� ��, 0 = �Խ��� ��ϰ��������� ���Բ� �ϱ�
int pg = NumberCheck.nullToOne(request.getParameter("pg")); // �������� 0��° �������� ���⶧���� 1�� �ʱ�ȭ
String key = Encoding.nullToBlank(request.getParameter("key"));
String word = Encoding.isoToEuc(request.getParameter("word")); // ���⵵ �ѱ�ó���������
String act = request.getParameter("act");
String root = ContextPath.root;
%>
<script>
var board = "<%=board%>";
var pg = "<%=pg%>";
var key = "<%=key%>";
var word = "<%=word%>";

</script>
<form name="commonForm" method="get" action="">
<input type="hidden" name="act" value=""> <!-- ������ �׻� �ٲ�ϱ� value="" -->
<input type="hidden" name="board" value="">
<input type="hidden" name="pg" value="">
<input type="hidden" name="key" value="">
<input type="hidden" name="word" value="">
</form>
<script type="text/javascript" src="<%=root%>/page/adminpage/js/paging.js"></script>