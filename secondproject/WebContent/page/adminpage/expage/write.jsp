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
							<label for="inputName">기획전 이름</label>
							<input type="text" class="form-control" name="subject" placeholder="기획전 제목을 입력해주세요"/>
						</div>
						<div class="form-group" style="margin:5px">
							<label for="inputName">노출 여부</label>
								<div class="ckbox">
								<input type="checkbox" id="isvisiable" name="isvisiable" value="1">
								<label for="isvisiable"></label>
							</div>
						</div>
						<div class="input-group" style="margin:5px">
								<label for="inputName">배치 순서</label>
								<input type="text" class="form-control" name="changeroot" id="changeroot" placeholder="배치 순서를 입력해주세요">
						</div>
						<label for="inputStore">매장명</label>
						<div class="input-group" style="margin:5px">
							<input type="text" class="form-control" id="store" name="store" placeholder="버튼을 눌러 매장을 추가해주세요" readonly="readonly">
								<span class="input-group-btn">
									<button class="btn btn-warning" type="button" onclick="javascript:mvshoplist();">Search</button>
								</span>
						</div>
						<div class="form-group" style="margin:5px">
							<label for="inputContent">기획전 설명</label>
							<textarea class="form-control" id="content" name="content" rows="10" cols="10" placeholder="기획전 내용을 입력해주세요"></textarea>
						</div>
						<tr valign="top" style="margin:5px">
							<td width="95" nowrap style="padding-left: 8px; padding-top: 10px">
								<b>대표이미지첨부</b>
							</td>
							<td colspan="5"><input name="picturename" id="picturename" type="file"
								size="76" maxlength="150" class="inp_02" style="width: 300px"
								value="">
							</td>
							</tr>
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-warning" onclick="javascript:writeArticle();">등록</button>
							<button type="button" class="btn btn-default" onclick="javascript:moveList();">취소</button>
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
		alert("기획전 제목을 입력해주세요");
	} else if (document.writeForm.changeroot.value == "") {
		alert("배치순서를 입력해주세요");
	} else if (document.writeForm.content.value =="") {
		alert("기획전 내용을 입력해주세요");
	} else {
		if (confirm("등록하시겠습니까?")){
		document.writeForm.action = "<%=ContextPath.root%>/picture";
		document.writeForm.submit();
		}
	}
}
function moveList() {
	document.location.href = "<%=ContextPath.root%>/admin?act=mvexhibition";	
}
</script>
