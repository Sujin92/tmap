<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.constant.*"%>
<section class="content page-top row">
		<div class="col-md-offset-1 col-md-10"  style="padding-top: 60px;">
			<div class="panel panel-default">
				<div class="panel-body">
				<div class="row">
					<form id="writeForm" name="writeForm" method="post" action="" enctype= "multipart/form-data">
						<div class="form-group" style="margin:5px">
							<input type="hidden" name="act" value="write">
							<label for="inputName">��ȹ�� �̸�</label>
							<input type="text" class="form-control" name="subject" placeholder="��ȹ�� ������ �Է����ּ���"/>
						</div>
						<div class="form-group" style="margin:5px">
							<label for="inputName">���� ����</label>
								<div class="ckbox">
								<input type="checkbox" id="isvisiable" name="isvisiable" value="1">
								<label for="isvisiable"></label>
							</div>
						</div>
						<div class="input-group" style="margin:5px">
								<label for="inputName">��ġ ����</label>
								<input type="text" class="form-control" name="changeroot" id="changeroot" placeholder="��ġ ������ �Է����ּ���">
						</div>
						<label for="inputStore">�����</label>
						<div class="input-group" style="margin:5px">
							<input type="text" class="form-control" id="store" name="store" placeholder="��ư�� ���� ������ �߰����ּ���" readonly="readonly">
								<span class="input-group-btn">
									<button class="btn btn-warning" type="button" onclick="javascript:mvshoplist();">Search</button>
								</span>
						</div>
						<div class="form-group" style="margin:5px">
							<label for="inputContent">��ȹ�� ����</label>
							<textarea class="form-control" id="content" name="content" rows="10" cols="10" placeholder="��ȹ�� ������ �Է����ּ���"></textarea>
						</div>
						<tr valign="top" style="margin:5px">
							<td width="95" nowrap style="padding-left: 8px; padding-top: 10px">
								<b>��ǥ�̹���÷��</b>
							</td>
							<td colspan="5"><input name="picturename" id="picturename" type="file"
								size="76" maxlength="150" class="inp_02" style="width: 300px"
								value="">
							</td>
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
		document.writeForm.action = "<%=ContextPath.root%>/picture";
		document.writeForm.submit();
		}
	}
}
function moveList() {
	document.location.href = "<%=ContextPath.root%>/admin?act=mvexhibition";	
}
</script>
