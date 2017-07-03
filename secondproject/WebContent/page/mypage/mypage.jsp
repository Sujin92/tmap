<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*,com.secondproject.mypage.model.*, com.secondproject.constant.ContextPath,com.secondproject.util.pagination.*,com.secondproject.userdto.*,com.secondproject.util.*"%>

	<%
	Pagination pagination = (Pagination) request.getAttribute("pagination");
	String word = Encoding.isoToUtf(request.getParameter("word"));
	UserDto udto = (UserDto)session.getAttribute("logininfo");
	if(udto!=null) {
	%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	var word = "<%=word%>";
	
	 function firstArticle() {
		 document.location.href="<%=ContextPath.root%>/mypage?act=followView&pg=1&key=&word=";
			
		   
		}

	function listArticle(mvpg) {
	
	document.location.href="<%=ContextPath.root%>/mypage?act=followView&pg="+mvpg+"&key=&word=&control=";
	
	}


	function upOrder(order, id) {
		if (order == 1) {
			return alert("ù��° �����Դϴ�.");
		} else {
			$.get("/secondproject/mypage?act=upOrder&id="+id, function(data, status){
				var tt = document.getElementById("tt");
				tt.innerHTML=data;
			});
		}
	}
var followUserId;

	function modifymake(){
		var alias = $("#alias").val();
		var memo = $("#memo").val();

		document.location.href = "<%=ContextPath.root%>/mypage?act=followmodify&followUserId=" + followUserId+"&alias="+encodeURI(alias)+"&memo="+encodeURI(memo);
	}

	function downOrder(order, id) {
		if (document.getElementsByName("trtr").length == order) {
			return alert("������ �����Դϴ�.");
		} else {
			$.get("/secondproject/mypage?act=downOrder&id="+id, function(data, status){
				var tt = document.getElementById("tt");
				tt.innerHTML=data;
			});
		}
	}
	function catedelete(id) {
		var catename = $("#text").val();
		if(confirm("���������Ͻðڽ��ϱ�?")) {
			$.get("/secondproject/mypage?act=catedelete&cateid="+id, function(data, status){
				var tt = document.getElementById("tt");
				tt.innerHTML=data;
	        });
			
		}
	
	}
	function modal() {
		$('#modal').modal({
			show : true
		});
	}
	function modalmemo() {
		$('#modalmemo').modal({
			show : true
		});
	}
	function modalcate() {
		$('#modalcate').modal({
			show : true
		});
	}
	function check() {
		cbox = input_form.chk;
		if (cbox.length) { // ���� ���� ���
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = input_form.all.checked;
			}
		} else { // �� ���� ���
			cbox.checked = input_form.all.checked;
		}
	}
	function getData() {
		var catename = $("#text").val();
		if(catename.length>100){
			return alert("ī�װ� �̸��� �ʹ� ����");
		} else if(catename.trim()=="") {
			return alert("ī�װ� �̸��� �Է��ϼ���");
		} else {
		$.get("/secondproject/mypage?act=catemake&catename="+ encodeURI(catename), function(data, status){
			var tt = document.getElementById("tt");
			tt.innerHTML=data;
		});
		}
		$("#text").val('');
	}
	function getMemoData(id) {
		$.get("/secondproject/mypage?act=followUser&followuserid="+id, function(data, status){
			var form = document.getElementById("cateForm");
			form.innerHTML=data;
		});
		modalmemo();
		followUserId=id;
	}
	
	

	function followdelete() {
		var valueArr = new Array();
		var list = $("input[name='chk']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { //���õǾ� ������ �迭�� ���� ������
				valueArr.push(list[i]);
			}
		}

	} 
	var valueArr;
	$(document).ready(function() {
		$("#getCheckedAll").click(function() {
			valueArr = new Array();
			$("input[name=chk]:checked").each(function() {
				valueArr.push($(this).val());
			});
			if (valueArr == "") {
				alert("�����ϼ���");
			} else {
				 document.location.href = "<%=ContextPath.root%>/mypage?act=followdelete&seq="+valueArr;
			
			}
		});
		 $("#catemodify").click(function() {
			valueArr = new Array();
			$("input[name=chk]:checked").each(function() {
				valueArr.push($(this).val());
			});
			if (valueArr == "") {
				alert("�����ϼ���");
			} else {
				modalcate();	
				
			}
		}); 
		
	});
	function select() {
		var id =$("select[name=select]").val();
	 	document.location.href="<%=ContextPath.root%>/mypage?act=followView&pg=1&key=category_name&word="+encodeURI(id);
		
	}
	function modicate() {
		var cateid =$("select[name=modicate]").val();
		
		document.location.href="<%=ContextPath.root%>/mypage?act=catemodify&id="+cateid+"&seq="+valueArr;
		
		
	}
</script>
<div class="container">
<div class="col-xs-12 col-md-12 a">

	<h2 class="sub-header">�ȷο� ����</h2>


	<div class="form-group form-inline">
		<div class="row mar">
			<div class="col-xs-6">
				<select id="select" name="select" onchange="select()" class="form-control">
					<option value="">��ü</option>
				<%
									List<FollowCategoryDto> list = (List<FollowCategoryDto>) request.getAttribute("followCategoryList");
									if (list != null && list.size()!=0) {
										int size = list.size();
										for (int i = 0; i < size; i++) {
											FollowCategoryDto fcdto = list.get(i);
								%>
					<option value="<%=fcdto.getFollowCategoryId()%>" <%= ((fcdto.getFollowCategoryId()+"").equals(word) ? "selected" : "") %>><%=fcdto.getCategoryName()%></option>
					<%}
										
					}%>
				</select>
			</div>
			<div class="col-xs-6">
				<div class="pull-right">
					<a class="btn btn-default" href="javascript:modal();" role="button">�׷����</a>
					<a class="btn btn-default" id="catemodify" role="button">�׷��̵�</a> <a
						class="btn btn-default" role="button" id="getCheckedAll">����</a>
				</div>
			</div>

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
							<th width="15%">�ֱ��ı�����</th>
							<th width="15%">�ȷο��ѳ�¥</th>
							<th width="15%">��Ī</th>
						</tr>
					</thead>
					<tbody>
						<%
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
							<td><%=fudto.getEmail()%> | <%=fudto.getStatusMsg()%></td>
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
						
					</tbody>
				</table>
				<center><%=pagination.getHtml() %><center>
			</form>
		</div>

	</div>
	<div></div>
</div>
</div>
<div class="modal fade" id="modal" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">

				<button class="close" aria-hidden="true" type="button"
					data-dismiss="modal">��</button>
				<h4 class="modal-title" id="myModalLabel">ī�װ�</h4>
			</div>
			<div class="modal-body">
				<div class="row table-responsive">
					<form id="orderForm" name="orderForm" method="post" action="">
						<input type="hidden" name="act" value=""> <input
							type="hidden" name="id" value="">
						<table id="info" class="table table-bordered">
							<thead>
								<tr>
									<th>����</th>
									<th>ī�װ��̸�</th>

								</tr>
							</thead>
								<tbody id="tt" name="tt">

								<%
									if (list != null && list.size()!=0) {
										int size = list.size();
										for (int i = 0; i < size; i++) {
											FollowCategoryDto fcdto = list.get(i);
								%>
								<tr id="tr<%=fcdto.getFollowCategoryId()%>" name="trtr">
									<td id="<%=fcdto.getCategoryOrder()%>"><%=fcdto.getCategoryOrder()%></td>
									<td id="<%=fcdto.getCategoryName()%>" name="<%=fcdto.getCategoryName()%>"><%=fcdto.getCategoryName()%>
										<div id="divv" class="pull-right">

											<a id="aa" class="btn btn-default"
												href="javascript:upOrder('<%=i + 1%>','<%=fcdto.getFollowCategoryId()%>');"
												role="button">��</a> <a class="btn btn-default"
												href="javascript:downOrder('<%=i + 1%>','<%=fcdto.getFollowCategoryId()%>');"
												role="button">��</a>
												<a id="dd" class="btn btn-default"
												href="javascript:catedelete('<%=fcdto.getFollowCategoryId()%>');"
												role="button">����</a>


										</div></td>
								</tr>


								<%
									}
									} else {
								%>
								<tr id="hh" name="hh">
								<td colspan="2">
								<center>
									����� ī�װ��� �����ϴ�.
								</center>
								</td>
								</tr>
								<%
									}
								%>
							</tbody>
							
						</table>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<form name=catemake method="post">
					<input type="hidden" name="act"> <input type="text" class="marright" id="text" name="text"
									placeholder="Category Name">
					<button id="btn" class="btn btn-primary" type="button"
						onclick="getData();" name="make">�߰�</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">���</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!--      modallllllllllllllllllllllllllllll-->
<div class="modal fade" id="modalmemo" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">

				<button class="close" aria-hidden="true" type="button"
					data-dismiss="modal">��</button>
				<h4 class="modal-title" id="myModalLabel">��Ī����</h4>
			</div>
			<div class="modal-body">
				<div class="row table-responsive">
					<form id="cateForm" name="cateForm" method="post" action="">
						<input type="hidden" name="act" value=""> 
						<input type="hidden" name="userId" value="">
						<input type="hidden" name="" value="">
						<input type="hidden" name="" value="">

						<div class="form-group">
							<label for="alias" class="col-lg-2 control-label">alias</label>
								<input type="text" class="form-control" id="alias" name="alias"
									placeholder="alias">
						</div>
						<div class="form-group">
							<label for="memo" class="col-lg-2 control-label">memo</label>
								<textarea rows="" cols="" class="form-control" id="memo" name="memo"></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="modal-footer">
				<form name="aliasmodify" method="post">
					<input type="hidden" name="act"> 
					<button id="btn" class="btn btn-primary" type="button"
						onclick="modifymake();" name="make">����</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">���</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!--      modallllllllllllllllllllllllllllll-->
<div class="modal fade" id="modalcate" role="dialog" aria-hidden="true"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">

				<button class="close" aria-hidden="true" type="button"
					data-dismiss="modal">��</button>
				<h4 class="modal-title" id="myModalLabel">�׷��̵�</h4>
			</div>
			<div class="modal-body">
				<div class="row table-responsive">
					

						<select id="modicate" name="modicate" onchange="modicate()" class="form-control">
					<option value="">����</option>
				<%
									List<FollowCategoryDto> catelist = (List<FollowCategoryDto>) request.getAttribute("favoriteCategoryList");
									if (list != null && list.size()!=0) {
										int size = list.size();
										for (int i = 0; i < size; i++) {
											FollowCategoryDto fcdto = list.get(i);
								%>
					<option value="<%=fcdto.getFollowCategoryId()%>"><%=fcdto.getCategoryName()%></option>
					<%}
										
					}%>
				</select>
				<form id="catemodifyForm" name="catemodifyForm" method="post" action="">
						<input type="hidden" name="act" value=""> 
						<input type="hidden" name="userId" value="">
						<input type="hidden" name="categoryId" value="">
						<input type="hidden" name="" value="">
					</form>
				</div>
			</div>
			<div class="modal-footer">
				
					<button class="btn btn-default" type="button" data-dismiss="modal">���</button>
				
			</div>
		</div>
	</div>
</div>
<%} else {%>
<script>
alert("ȸ������ �Խ����Դϴ�. �α����� ����ϼ���.");
document.location.href = "<%=ContextPath.root%>/index.jsp";
</script>

<%}%>