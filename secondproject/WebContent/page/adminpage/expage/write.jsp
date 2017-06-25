<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.constant.*"%>
<!-- include summernote css/js-->
<link href="D:\dist/summernote.css" rel="stylesheet">
<script src="D:\dist/summernote.js"></script>
<section class="content page-top clearfix">
		<div class="col-md-offset-1 col-md-10 ">
			<div class="panel panel-default">
				<div class="panel-body">
				<div class="row">
					<form id="writeForm" name="writeForm" method="post" action="">
						<div class="form-group">
							<input type="hidden" name="act" value="write">
							<label for="inputName">��ȹ�� �̸�</label>
							<input type="text" class="form-control" name="subject" placeholder="��ȹ�� ������ �Է����ּ���"/>
						</div>
						<div class="ckbox">
							<input type="checkbox" id="checkbox1" name="checkbox1" value="1"> ���� ���� <label for="checkbox1"></label>
						</div>
						<label for="inputStore">�����</label>
						<div class="input-group">
							<input type="text" class="form-control" id="store" name="store" placeholder="�߰��� ������� �Է����ּ���">
								<span class="input-group-btn">
									<button class="btn btn-warning" type="button" onclick="javascript:mvshoplist();">Search</button>
								</span>
						</div>
						<div class="form-group">
							<label for="inputContent">��ȹ�� ����</label>
							<textarea class="form-control" id="content" name="content" rows="15" cols="15" placeholder="��ȹ�� ������ �Է����ּ���"></textarea>
						</div>
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-warning" onclick="javascript:writeArticle();">���</button>
							<button type="button" class="btn btn-default" onclick="javascript:moveList();">���</button>
						</div>
					</form>
					</div>
			</div>
		</div>
	</div>
</section>
<script>
function writeArticle() {
	if(document.writeForm.subject.value == "") {
		alert("��ȹ�� ������ �Է����ּ���");
	} else if (document.writeForm.store.value == "") {
		alert("������� �߰����ּ���");
	} else if (document.writeForm.content.value =="") {
		alert("��ȹ�� ������ �Է����ּ���");
	} else {
		if (confirm("����Ͻðڽ��ϱ�?")){
		document.writeForm.action = "<%=ContextPath.root%>/exhibition";
		document.writeForm.submit();
		}
	}
}

function moveList() {
	document.location.href = "<%=ContextPath.root%>/admin?act=mvexhibition";	
}



$(document).ready(function() {
    $('#summernote').summernote();
});
</script>
</script>