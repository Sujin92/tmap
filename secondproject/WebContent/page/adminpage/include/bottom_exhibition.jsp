<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.constant.*, java.util.*"%>
<script>
function moveWrite(){
	document.location.href = "<%=ContextPath.root%>/exhibition?act=mvwrite";
}
function viewExhibition(seq) {
	document.location.href = "<%=ContextPath.root%>/exhibition?act=view&seq="+seq;
}
function searchExhibition() {
	if (document.searchForm.word.value == "")	{
		alert("�˻��� �Է�!!!!!");
	} else {
		document.searchForm.action = "<%=ContextPath.root%>/admin?act=mvshoplist";
		document.searchForm.submit();
	}
		
}

function mvshoplist(seq) {
	document.location.href ="<%=ContextPath.root%>/exhibition?act=mvshoplist&seq=" + seq;
}

function deleteExhibition() {
	document.exhibitionForm.action = "<%=ContextPath.root%>/exhibition";
	document.exhibitionForm.submit();
}

</script>
<script type="text/javascript" src="<%=ContextPath.root%>/page/adminpage/js/checkbox.js"></script>