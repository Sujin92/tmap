<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*,com.secondproject.mypage.model.*, com.secondproject.constant.ContextPath,com.secondproject.util.pagination.*,com.secondproject.userdto.*,com.secondproject.util.*"%>
<%-- 
	<%
	Pagination pagination = (Pagination) request.getAttribute("pagination");
	String word = Encoding.isoToUtf(request.getParameter("word"));
	UserDto udto = (UserDto)session.getAttribute("logininfo");
	if(udto!=null) {
	%> --%>

<div class="container">
<div class="col-xs-12 col-md-12 a">

	<h4 class="sub-header">@@@ �� �ȷο�</h4>



		</div>
		<div class="row table-responsive">
			<form name="input_form">
				<table class="table table-filter">
					<thead>
						<tr class="warning">
							<th class="center"><input type="checkbox" class="lar"
								name="all" onclick="javascript:check();" width="5%"></th>
							<th width="10%">ī�װ�</th>
							<th width="40%">id | ���¸޼���</th>
							<th width="10%">�ֱ��ı�����</th>
							<th width="10%">�ȷο��ѳ�¥</th>
							<th width="10%">��Ī</th>
							<th width="15%">�ȷο�/�ȷο�</th>
						</tr>
					</thead>
					<tbody>
						<%-- <%
							List<FollowUserDto> fulist = (List<FollowUserDto>) request.getAttribute("list");
						if (fulist != null &&fulist.size()!=0) {
								int size = fulist.size();
								for (int i = 0; i < size; i++) {
									FollowUserDto fudto = fulist.get(i);
						%>
						<tr id="<%=fudto.getCategoryName()%>">
							<td class="center"><input type="checkbox" name="chk"
								class="lar" value="<%=fudto.getFavoriteUserId()%>"></td>
							<td><%=fudto.getCategoryName()%></td>
							<td><a href="javascript:yourreview('<%=fudto.getRegUserId()%>')"><%=fudto.getEmail()%> | <%=fudto.getStatusMsg()%></a></td>
							<td><%=fudto.getRegDate()%></td>
							<td><%=fudto.getFavoriteRegDate()%></td>
							<%
								String a = fudto.getAlias();
										if (a == null) {
											a = "����";
							%>
							<td><%=a%>&nbsp;&nbsp;<a href="javascript:getMemoData('<%=fudto.getFavoriteUserId()%>');"><img src="<%=ContextPath.root%>/page/mypage/img/memo.png" width="20" height="20" border="0"></a></td>
							<%
								} else {
							%>
							<td><%=fudto.getAlias()%>&nbsp;&nbsp;<a href="javascript:getMemoData('<%=fudto.getFavoriteUserId()%>');"><img src="<%=ContextPath.root%>/page/mypage/img/memo.png" width="20" height="20" border="0"></a></td>
							<%
								}
							%>
							<td>&nbsp;&nbsp;&nbsp; <%=fudto.getFollowCount() %>�� /<%=fudto.getFollowerCount() %>��</td>
						</tr>
						
						<%
							}
							} else {
						%>
						<tr >
						<td colspan="6"><center>�ȷο��ѻ���� �����ϴ�. </center></tr>
						<%
							}
						%>
						 --%>
					</tbody>
				</table>
				
			</form>
			
				<%-- <center><%=pagination.getHtml() %><center> --%>
		</div>

	
	<div align="center"><form name="searchfollowForm" method="get" action="">
               <input type="hidden" name="act" value="followView">
                  <div class="col-md-12">
					<div class="input-group">
						<div class="input-group-btn">
							<select class="form-control" name="key">
								<option value="email">���̵�</option>
								<option value="alias">��Ī</option>
							</select>
						</div>
						<input type="text" class="form-control" name="word" placeholder="�˻��� �Է�" size="25">
							<span class="input-group-btn">
							<button class="btn btn-warning" type="button" onclick="javascript:searchfollow();">Search</button>
							</span>
					</div>
				 </div>
            </form>
</div>
</div>
