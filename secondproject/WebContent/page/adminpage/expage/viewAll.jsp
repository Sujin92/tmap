<%@page import="com.secondproject.admin.model.ExhibitionDetailDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.constant.*" import="com.secondproject.shop.model.*, java.util.*"%>
<%
	ExhibitionDetailDto exhibitionDetailDto = (ExhibitionDetailDto) request.getAttribute("exhibitionInfo");
	List<ShopDto> shopList =(List<ShopDto>) request.getAttribute("shopList");
%>
<section class="content page-top">
	<div class="title"><h3>Detail</h3></div>
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-body">
					<form id="writeForm" name="writeForm" method="post" action="">
						<div class="form-group">
							<input type="hidden" name="act" value="modify">
							<input type="hidden" name="seq" value="<%=exhibitionDetailDto.getExhibitionId()%>">
							<label for="inputName">��ȹ�� �̸�</label>
							<input type="text" class="form-control" name="subject" value="<%=exhibitionDetailDto.getExTitle()%>">
						</div>
						<div class="ckbox">
						<%
						if (exhibitionDetailDto.getExVisiable() != 0) {
						%>
							<input type="checkbox" id="checkbox1" name="isvisiable" checked="checked" value="1"><label for="checkbox1"></label>
						<%
						} else {
						%>
						<input type="checkbox" id="checkbox1" name="isvisiable" value="1"><label for="checkbox1"></label>
						<%	
						}
						%>
						</div>
						<label for="inputStore"></label>
						<div class="input-group">
							<input type="text" class="form-control" id="store" name="store" placeholder="��ư�� ���� ������ �߰����ּ���" readonly="readonly">
								<span class="input-group-btn">
									<button class="btn btn-warning" type="button" onclick="javascript:mvshoplist('<%=exhibitionDetailDto.getExhibitionId()%>');">���� �߰�</button>
								</span>
						</div>
										<div class="table-container table-responsive">
					<table class="table table-filter" id="extable">
						<tbody>
							<tr class="warning" align="center">
								<td>
									<div class="ckbox">
										<input type="checkbox" id="checkedAll"><label
											for="checkedAll"></label>
									</div>
								</td>
								<td>�����</td>
								<td>��������</td>
								<td>����</td>
								<td>���� �ּ�</td>
								<td>�����ð�</td>
								<td>�� ����</td>
							</tr>
						</tbody>
					</table>
				</div>
						<div class="form-group">
							<label for="inputContent">��ȹ�� ����</label>
							<textarea class="form-control" id="content" name="content" rows="10" cols="10">
<%=exhibitionDetailDto.getExDesc()%>							
</textarea>
						</div>
						<div class="btn-group pull-right">
							<button type="button" class="btn btn-warning" onclick="javascript:modifyArticle();">����</button>
							<button type="button" class="btn btn-default" onclick="javascript:moveList();">���</button>
						</div>
					</form>
			</div>
		</div>
	</div>
</section>
<script>
function modifyArticle() {
	if (confirm("�����Ͻðڽ��ϱ�?")) {
		document.writeForm.action = "<%=ContextPath.root%>/exhibition";
		document.writeForm.submit();
	}
	
}
function moveList() {
	document.location.href = "<%=ContextPath.root%>/admin?act=mvexhibition";	
}
</script>