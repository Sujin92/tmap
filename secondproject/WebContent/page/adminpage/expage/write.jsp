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
					<form id="writeForm" name="writeForm" method="post" action="" enctype= "multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="act" value="write">
							<label for="inputName">��ȹ�� �̸�</label>
							<input type="text" class="form-control" name="subject" placeholder="��ȹ�� ������ �Է����ּ���"/>
						</div>
						<div class="ckbox">
							<input type="checkbox" id="isvisiable" name="isvisiable" value="1"> ���� ���� <label for="isvisiable"></label>
						</div>
						<div class="input-group">
								<label for="inputName">��ġ ����</label>
								<input type="text" class="form-control" name="changeroot" placeholder="��ġ ������ �Է����ּ���">
							</div>
					
						<label for="inputStore">�����</label>
						<div class="input-group">
							<input type="text" class="form-control" id="store" name="store" placeholder="��ư�� ���� ������ �߰����ּ���" readonly="readonly">
								<span class="input-group-btn">
									<button class="btn btn-warning" type="button" onclick="javascript:mvshoplist();">Search</button>
								</span>
						</div>
						<div class="form-group">
							<label for="inputContent">��ȹ�� ����</label>
							<textarea class="form-control" id="content" name="content" rows="10" cols="10" placeholder="��ȹ�� ������ �Է����ּ���"></textarea>
						</div>
						<tr valign="top">
							<td width="95" nowrap style="padding-left: 8px; padding-top: 10px"><img src="" width="4" height="4" border="0"
								align="absmiddle"> 
								<b>����÷��</b>
							</td>
							<td colspan="5"><input name="picturename" id="picturename" type="file"
								size="76" maxlength="150" class="inp_02" style="width: 300px"
								value=""><img src="" width="12"
								height="11" border="0" align="absmiddle" vspace="8" style="margin: 3 3 0 6">
							</td>
							<br>
							</tr>
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
	} else if (document.writeForm.changeroot.value == "") {
		alert("��ġ������ �Է����ּ���");
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

</script>
