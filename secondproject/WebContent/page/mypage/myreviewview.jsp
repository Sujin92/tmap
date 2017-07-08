<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"
	import="java.util.*,com.secondproject.mypage.model.*, com.secondproject.constant.ContextPath,com.secondproject.userdto.*"%>

<%UserDto udto = (UserDto)session.getAttribute("logininfo"); %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	function like(good,bad,reviewId){
		if(good==1) {
			$.get("/secondproject/myreview?act=goodbad&good=0&bad=0&reviewId="+reviewId, function(data, status){
				var goba = document.getElementById("goba");
				goba.innerHTML=data;
			});
		} else {
			$.get("/secondproject/myreview?act=goodbad&good=1&bad=0&reviewId="+reviewId, function(data, status){
				var goba = document.getElementById("goba");
				goba.innerHTML=data;
		});
		}
		
	}
	function hate(good,bad,reviewId){
		if(bad==1) {
			$.get("/secondproject/myreview?act=goodbad&good=0&bad=0&reviewId="+reviewId, function(data, status){
				var goba = document.getElementById("goba");
				goba.innerHTML=data;
		});
		} else {
			$.get("/secondproject/myreview?act=goodbad&good=0&bad=1&reviewId="+reviewId, function(data, status){
				var goba = document.getElementById("goba");
				goba.innerHTML=data;
		});
		}
	}
	function com() {
		var text = $("#commenttext").val();
		var reviewId = $("#reviewId").val();
			$.get("/secondproject/myreview?act=commentinsert&reviewId="+reviewId+"&text="+encodeURI(text), function(data, status){
				var tt = document.getElementById("coo");
				tt.innerHTML=data;
			});
		}
	

	$(document).ready(function() {
		$("#co").click(function() {
			$("#com").slideToggle();
		});
	});
	
	function reviewDelete(reviewId) {
		if(confirm("���� �����Ͻðڽ��ϱ�???")) {
			document.location.href="<%=ContextPath.root%>/myreview?act=reviewDelete&reviewId="+reviewId;
		}
	}
</script>



<body class="a">
	<%
		MyReviewDto mrdto = (MyReviewDto) request.getAttribute("myreview");
		if (mrdto != null) {
	%>
		<div class="container">
		<input type="hidden" id="reviewLat" value="<%=mrdto.getLat()%>">
		<input type="hidden" id="reviewLng" value="<%=mrdto.getLng()%>">
	<div class="section py-5" id="features">
			<div class="row">
				<div class="col-md-12 marr">
					<h1 class="pb-4 text-primary" align="center"><%=mrdto.getSubject()%>
						<br>
					</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="row">
					<%if(mrdto.getUserId().equals(udto.getUser_id()+"")) {%>
					<div class="col-md-12" align="right">���� &nbsp;
						<a href="javascript:reviewDelete('<%=mrdto.getReviewId()%>');">����</a>
					
					</div>
					<%} %>
						<div class="col-md-12 mar">
							<div class="pull-right">
								<%if(mrdto.getMyScore()!=null){ 
										int cnt = Integer.parseInt(mrdto.getMyScore());
										int star = cnt/2;
										int halfstar=cnt%2;
										for(int i=0;i<star; i++) {
											%><img src="<%=ContextPath.root %>/page/mypage/img/star.png" width="35px"><%
 										}
										if(halfstar==1) {
											%>
											<img src="<%=ContextPath.root %>/page/mypage/img/halfstar.gif" width="35px">
											<% 
										}
									}%>
								<%=mrdto.getUpdate_date()%></div>
						</div>
						<div class="col-md-12 mar">
							<div class="pull-right">
								<img src="<%=ContextPath.root %>/page/mypage/img/like1.png">
								<%=mrdto.getGood()%>
								<img src="<%=ContextPath.root %>/page/mypage/img/hate1.png">
								<%=mrdto.getBad()%></div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 h-75 mar">
					<p class="" align=""><%=mrdto.getContent()%>

					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="container">
				<div class="col-md-12 " style="text-align: center;">
					<%=mrdto.getShopName()%>&nbsp;
					<a href="<%=mrdto.getReserveUrl()%>">�����ϱ�</a>
					<br>
					<%=mrdto.getAddress()%><br>
					<%=mrdto.getTel()%><br>
					<%=mrdto.getBusinessTime()%><br>
					<%=mrdto.getDetail()%>
					</div>
					</div>
					<div class="container">
					<div class="map-container" align="">
						<div class="col-md-offset-3" id="map" style="width: 50%; height: 400px;"></div>
				<%	if(Integer.parseInt(mrdto.getUserId())!=udto.getUser_id()) {%>
			<div id="goba" class="pull-right">�� ���䰡 ������ �Ǿ����ϱ�?&nbsp;&nbsp;
			<% ReviewGoodBad goodbad = (ReviewGoodBad)request.getAttribute("goodbad"); %>
			<a href="javascript:like(<%=goodbad.getGood() %>,<%=goodbad.getBad() %>,<%=mrdto.getReviewId()%>);"><img src="<%=ContextPath.root %>/page/mypage/img/like<%=goodbad.getGood() %>.png"></a>
			<a href="javascript:hate(<%=goodbad.getGood() %>,<%=goodbad.getBad() %>,<%=mrdto.getReviewId()%>);"><img src="<%=ContextPath.root %>/page/mypage/img/hate<%=goodbad.getBad() %>.png"></a>
										</div><% } %>
					</div>

					<%
						}
					%>
			
			</div>
		</div>
		<div class="row mar">
			<div class="container" >
				<% List<ReviewCommentDto>  clist =(List<ReviewCommentDto>) request.getAttribute("clist"); %>
			<div id="coo" class="coo mar" ><div id="co" class="co">���(<%=clist.size() %>)</div>
			
		
		
			
			<div id="com" class="com" style="">
			<form method="post" action="" id="commentform" name="commentform">
			<input type="hidden" id="reviewId" name="reviewId" value="<%=mrdto.getReviewId()%>">
			<input type="hidden" name="act" value="commentinsert">
				<table style="margin-bottom: 100px;">
			
	
	
					<%	for(ReviewCommentDto cdto : clist) {
					
					%>
					<tr>
						<td width="10%" align="center" style="text-align: center;padding-bottom: 5px;padding-right: 5px;"><%=cdto.getEmail() %></td>
						<td colspan="2" width="90%">&nbsp;<%=cdto.getReviewContent() %></td>
					</tr>
						<% 
				}
				%>
					<tr>
						<td width="10%" align="center" style="text-align: center;"><%=udto.getEmail() %>
						<td width="80%"><textarea id="commenttext" rows="3" cols="130" ></textarea></td>	
						<td width="10%"><a href="javascript:com();" class="btnbtn" >�Է�</a></td>
					</tr>
				</table>
				</form>
			</div></div>
		</div>

</div>
</div>
