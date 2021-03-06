<%@page import="com.secondproject.util.PageNavigation"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="com.secondproject.constant.*, java.util.*, com.secondproject.admin.model.*"
	import="com.secondproject.util.pagination.*"%>
<%
List<ExhibitionDto> list = (List<ExhibitionDto>) request.getAttribute("exhibitionList");
String orderValue = (String) request.getAttribute("orderValue");
Pagination pagination = (Pagination) request.getAttribute("pagination");
if (orderValue == null) {
	orderValue = "asc";
	}
%>
<section class="content page-top row">
	<div class="col-md-10 col-md-push-1" style="padding-top: 60px;">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<form name="exhibitionForm" method="post" action="">
					<div class="pull-left col-md-3">
					<input type="hidden" name="act" value="delete">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-filter" onclick="javascript:moveWrite();">기획전 등록</button>
							<button type="button" class="btn btn-warning btn-filter" onclick="javascript:deleteExhibition();">기획전 삭제</button>
						</div>
					</div>
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
								<td>사진</td>
								<td><a href="<%=ContextPath.root%>/admin?act=mvexhibition&board=exhibition&orderKey=nameby&orderValue=<%=orderValue%>"  style="text-decoration:none; color:red">기획전명</a></td>
								<td>내용</td>
								<td><a href="<%=ContextPath.root%>/admin?act=mvexhibition&board=exhibition&orderKey=visiableby&orderValue=<%=orderValue%>" style="text-decoration:none; color:red">노출여부</a></td>
								<td><a href="<%=ContextPath.root%>/admin?act=mvexhibition&board=exhibition&orderKey=orderby&orderValue=<%=orderValue%>" style="text-decoration:none; color:red">배치순서</a></td>
								<td>Edit</td>
							</tr>
							<%
								int size = list.size();
								for (int i = 0; i < size; i++) {
									ExhibitionDto exhibitionDto = list.get(i);
									String checkbox = "checkbox" + i;
							%>
							<tr>
								<td>
									<div class="ckbox">
										<input type="checkbox" class="checkthis" id="<%=checkbox%>" name ="checkbox" value="<%=exhibitionDto.getExhibitionId()%>"> <label
											for="<%=checkbox%>"></label>
									</div>
								</td>
								<td>
									<div class="thumbnail-item">
										<a href="<%=ContextPath.root%>/<%=exhibitionDto.getExImage()%>"><img src="<%=ContextPath.root%>/upload/<%=exhibitionDto.getExhibitionId()%>/thumb_<%=exhibitionDto.getExImage()%>" class="thumbnail" /></a>
										<div class="tooltip">
										<img src="<%=ContextPath.root%>/<%=exhibitionDto.getExImage()%>" alt="" width="150" height="150" />
										<span class="overlay"></span>
										</div> 
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
											<div class="media-detail"><%=exhibitionDto.getExDesc() %></div>
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
								<td>
									<p data-placement="top" data-toggle="tooltip" title="Edit">
										<button type="button" class="btn btn-warning btn-xs" 
							    		onclick="javascript:viewExhibition('<%=exhibitionDto.getExhibitionId()%>');"><span class="glyphicon glyphicon-pencil"></span>
							    		</button>
							    	</p>
							    </td>
							</tr>
							    
							<%
								}
							%>
							</form>
						</tbody>
					</table>
				</div>
				<div class="form-group form-inline">
				<div align="center">
				<form name="searchForm" method="get" action="">
					<input type="hidden" name="act" value="mvexhibition"> 
					<input type="hidden" name="board" value="exhibition"> 
						<div class="pull-right col-md-5">
							<div class="input-group">
								<div class="input-group-btn">
									<select class="form-control" name="key">
									  	<option value="title">기획전이름</option>
									  	<option value="shopname">매장명</option>
									</select>
								</div>
									<input type="text" class="form-control" name="word" placeholder="검색어 입력" size="25">
									<span class="input-group-btn">
										<button class="btn btn-warning" type="button" onclick="javascript:searchExhibition();">Search</button>
									</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
  </div>
<div align="center" style="clear:both;">
<%=pagination.getHtml()%>
</div>
<div class="col-md-6"></div>
</section>