<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.secondproject.constant.*, java.util.*, com.secondproject.admin.model.*"%>
<%
List<ExhibitionDto> list = (List<ExhibitionDto>) request.getAttribute("exhibitionList");
%>
<section class="content page-top">
	<div class="col-md-10 col-md-push-1">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="pull-left col-md-7">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-filter" onclick="javascript:moveWrite();">��ȹ�� ���</button>
							<button type="button" class="btn btn-warning btn-filter">��ȹ�� ����</button>
						</div>
					</div>

					<div class="pull-right col-md-5">
						<div class="input-group">
						<div class="input-group-btn">
							<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								�����ټ�
								<span class="caret"></span> 
								<span class="sr-only">Toggle Dropdown</span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">��ȹ���̸�</a></li>
								<li><a href="#">�����</a></li>
							</ul>
						</div>
							<input type="text" class="form-control" placeholder="�˻��� �Է�">
							<span class="input-group-btn">
								<button class="btn btn-warning" type="button">Search</button>
							</span>
						</div>
					</div>
				</div>
				<div class="table-container table-responsive">
					<table class="table table-filter">
						<tbody>
							<tr class="warning" align="center">
								<td>Check</td>
								<td>����</td>
								<td>��ȹ����</td>
								<td>����</td>
								<td>���⿩��</td>
								<td>��ġ ����</td>
							</tr>
							<%
								int size = list.size();
								for (int i = 0; i < size; i++) {
									ExhibitionDto exhibitionDto = list.get(i);
							%>
							<tr>
								<td>
									<div class="ckbox">
										<input type="checkbox" id="checkbox1"> <label
											for="checkbox1"></label>
									</div>
								</td>
								<td>
									<div class="media">
										<span class="media-meta"><%=exhibitionDto.getExImage() %></span>
									</div>
								</td>
								<td>
									<div class="media">
										<div class="media-body">
											<p class="media-meta"><%=exhibitionDto.getExTitle() %></p>
										</div>
									</div>
								</td>
								<td>
									<div class="media">
										<div class="media-body">
											<span class="media-meta"><%=exhibitionDto.getExDesc() %></span>
										</div>
									</div>
								</td>
								<td>
									<div class="media">
										<div class="media-body">
											<span class="media-meta"><%=exhibitionDto.getExVisiable() %></span>
										</div>
									</div>
								</td>
								<td>
									<div class="media">
										<div class="media-body">
											<span class="media-meta"><%=exhibitionDto.getExOrder() %></span>
										</div>
									</div>
								</td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div class="btn-group pull-right">
					<button type="button" class="btn btn-warning">�����ټ�</button>
					<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="caret"></span> 
						<span class="sr-only">Toggle Dropdown</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">�����ټ�</a></li>
						<li><a href="#">�����ϼ�</a></li>
						<li><a href="#">�ŷڵ���</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
	<%@ include file="/adminpage/include/pageNav.jsp"%>
<script>
function moveWrite(){
	document.location.href = "<%=ContextPath.root%>/exhibition?act=mvwrite";
}
</script>