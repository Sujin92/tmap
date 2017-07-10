<%@page import="com.secondproject.review.model.ReviewDto"%>
<%@page import="com.secondproject.util.NumberCheck"%>
<%@page import="com.secondproject.constant.ContextPath"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
int shopId = NumberCheck.nullToZero(request.getParameter("shopId"));
ReviewDto reviewDto = (ReviewDto) request.getAttribute("reviewDto");

String title = "";
String content = "";
String img = "";
String act = "write";
if (reviewDto != null) {
	title = reviewDto.getTitle();
	content = reviewDto.getContent();
	img = reviewDto.getImg();
	act = "modify";
}
%>
<div class="page-container">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3>�����ۼ�</h3>
				<form action="<%=ContextPath.root%>/reviewFile" method="post" enctype="multipart/form-data">
					<input type="hidden" name="shopId" value="<%=shopId%>"/>
					<input type="hidden" name="act" value="<%=act%>" />
					<% if (reviewDto != null) { %>
						<input type="hidden" name="reviewId" value="<%=reviewDto.getReviewId()%>" />
					<% } %>
					<div class="form-group">
						<label for="title">����</label>
						<input type="text" name="title" class="form-control" id="title" value="<%=title%>" required>
					</div>
					
					<div class="form-group">
						<label for="score">����</label>
						<select name="score" class="form-control" id="score">
							<%
							for (int i = 10; i > 0; i--) {
								String isSelected = "";
								if (reviewDto != null && reviewDto.getScore() == i) {
									isSelected = "selected=\"selected\"";
								}
							%>
								<option <%=isSelected%>><%=i%></option>
							<%
							}
							%>
						</select>
					</div>
					
					<div class="form-group">
						<label for="content">����</label>
						<textarea name="content" id="content" class="form-control" required><%=content%></textarea>
					</div>
					
					<div class="form-group">
						<label for="exampleInputFile">��ǥ����</label>
						<input type="file" name="shopImg" id="exampleInputFile" <%=(reviewDto == null) ? "required" : ""%>>
						<p class="help-block">
							�����Ͽ� ���Ǹ� �������� ������� �ʽ��ϴ�. <% if (reviewDto != null) { %>�������������� ���Ͼ��ε�� ���� ���Ͽ� �����˴ϴ�.<% } %>
						</p>
						<% if (img.isEmpty() == false) { %>
							<div>
								<img src="<%=ContextPath.root + "/" + img%>" class="img-response" />
								<p class="help-block">���� ��ϵǾ� �ִ� ��ǥ����</p>
							</div>
						<% } %>
					</div>
					
					<button type="submit" class="btn btn-danger">���</button>
				</form>
			</div>
		</div>
	</div>
</div>