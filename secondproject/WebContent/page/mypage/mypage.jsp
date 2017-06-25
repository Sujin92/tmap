<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*,com.secondproject.mypage.model.*, com.secondproject.constant.ContextPath "%>
<script type="text/javascript"
	src="<%=ContextPath.root%>/page/mypage/js/myajax.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.1.min.js"></script>
<script type="text/javascript">
	function upOrder(order, id) {
		if (order == 1) {
			return alert("ù��° �����Դϴ�.");
		} else {
			document.orderForm.act.value = "upOrder";
			document.orderForm.id.value = id;
			document.orderForm.action = "<%=ContextPath.root%>/mypage";
			document.orderForm.submit();
		}
	}

	function downOrder(order, id) {
		if (document.getElementsByName("trtr").length == order) {
			return alert("������ �����Դϴ�.");
		} else {
			document.orderForm.act.value = "downOrder";
			document.orderForm.id.value = id;
			document.orderForm.action = "<%=ContextPath.root%>/mypage";
			document.orderForm.submit();
		}
	}
	/////////////////////////////
	function catedelete(id) {
		var catename = $("#text").val();
		if(confirm("���������Ͻðڽ��ϱ�?")) {
		var id = "act=catedelete&cateid=" +id;
		sendRequest("/secondproject/mypage", id, receiveDelete, "GET");
		}
	
	}

	function receiveDelete() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var txt = httpRequest.responseText;
				
			 
			} else {
				alert("�����߻� : " + httpRequest.status);
			}
		}
	}
	function view(category) {

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	///////////////////////////
	function modal() {
		$('#modal').modal({
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
		if(catename.trim()=="") {
			return alert("ī�װ� �̸��� �Է��ϼ���");
		} else {
		var name = "act=catemake&catename=" + encodeURI(catename);
		sendRequest("/secondproject/mypage", name, cateMake, "GET");
		}
		$("#text").val('');
	}

	function cateMake() {
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				var catexml = httpRequest.responseXML;
				viewData(catexml); 
			} else {
				alert("�����߻� : " + httpRequest.status);
			}
		}
	}
	function viewData(category) {
		var cateid = category.getElementsByTagName("cateid")[0].firstChild.data;
		var order = category.getElementsByTagName("order")[0].firstChild.data;
		var name = category.getElementsByTagName("name")[0].firstChild.data;
		var tr = document.createElement("tr");
		var td = document.createElement("td");
		var txtorder = document.createTextNode(order);
		td.appendChild(txtorder);
		var td2 = document.createElement("td");
		var txtname = document.createTextNode(name);
		td2.appendChild(txtname);
		var div = document.createElement("div");
		div.setAttribute("class", "pull-right");
		var a2 = document.createElement("a");
		a2.setAttribute("class", "btn btn-default");
		a2.setAttribute("href", "javascript:upOrder('" + order + "','" + cateid + "');");
		a2.setAttribute("role", "button");
		a2.appendChild(document.createTextNode("��"));
		var a3 = document.createElement("a");
		a3.setAttribute("class", "btn btn-default");
		a3.setAttribute("href", "javascript:catedelete('"+cateid+"');");
		a3.setAttribute("role", "button");
		a3.appendChild(document.createTextNode("����"));
		var a4 = document.createElement("a");
		a4.setAttribute("class", "btn btn-default");
		a4.setAttribute("href", "javascript:downOrder('" + order + "','" + cateid + "');");
		a4.setAttribute("role", "button");
		a4.appendChild(document.createTextNode("��"));
		div.appendChild(a2);
		div.appendChild(document.createTextNode(" "));
		div.appendChild(a4);
		div.appendChild(document.createTextNode(" "));
		div.appendChild(a3);
		td2.appendChild(div);
		tr.setAttribute("name", "trtr");
		tr.appendChild(td);
		tr.appendChild(td2);
		var tt = document.getElementById("tt");
		tt.appendChild(tr);
		$("#hh").remove();
		
	
	
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
				document.location.href = "<%=ContextPath.root%>/mypage?act=followdelete&id=" + valueArr;
			}
		});
	
	});
</script>
<div class="col-xs-9 col-md-9 col-xs-offset-1 a">

	<h2 class="sub-header">�ȷο� ����</h2>


	<div class="form-group form-inline">
		<div class="row mar">
			<div class="col-xs-6">
				<select name="" onchange="" class="form-control">
					<option value="all">��ü</option>
					<option value="">ŰƮ��</option>
					<option value="">�ѽ�</option>
					<option value="">�������</option>
				</select>
			</div>
			<div class="col-xs-6">
				<div class="pull-right">
					<a class="btn btn-default" href="javascript:modal();" role="button">�׷����</a>
					<a class="btn btn-default" href="#" role="button">�׷��̵�</a> <a
						class="btn btn-default" role="button" id="getCheckedAll">����</a>
				</div>
			</div>

		</div>
		<div class="row table-responsive">
			<form name="input_form">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th class="center"><input type="checkbox" class="lar"
								name="all" onclick="javascript:check();"></th>
							<th>ī�װ�</th>
							<th>id | ���¸޼���</th>
							<th>�ֱ��ı�����</th>
							<th>�ȷο��ѳ�¥</th>
							<th>��Ī</th>
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
						<tr>
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
							<td><%=a%></td>
							<%
								} else {
							%>
							<td><%=fudto.getAlias()%></td>
							<%
								}
							%>
						</tr>
						<%
							}
							} else {
						%>
						<tr >
						<td colspan="6"><center>�ȷο��ѻ���� �����ϴ�.</center></tr>
						<%
							}
						%>
					</tbody>
				</table>
			</form>
		</div>

	</div>
	<div></div>
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
									List<FollowCategoryDto> list = (List<FollowCategoryDto>) request.getAttribute("favoriteCategoryList");
									if (list != null && list.size()!=0) {
										int size = list.size();
										for (int i = 0; i < size; i++) {
											FollowCategoryDto fcdto = list.get(i);
								%>
								<tr name="trtr">
									<td id="<%=fcdto.getCategoryOrder()%>"><%=fcdto.getCategoryOrder()%></td>
									<td id="nana"><%=fcdto.getCategoryName()%>
										<div id="divv" class="pull-right">

											<a id="aa" class="btn btn-default"
												href="javascript:upOrder('<%=i + 1%>','<%=fcdto.getFollowCategoryId()%>');"
												role="button">��</a> <a class="btn btn-default"
												href="javascript:downOrder('<%=i + 1%>','<%=fcdto.getFollowCategoryId()%>');"
												role="button">��</a>
												<a id="" class="btn btn-default"
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
					<input type="hidden" name="act"> <input type="text"
						id="text" name="catename" class="marright">
					<button id="btn" class="btn btn-primary" type="button"
						onclick="getData();" name="make">�߰�</button>
					<button class="btn btn-default" type="button" data-dismiss="modal">���</button>
				</form>
			</div>
		</div>
	</div>
</div>