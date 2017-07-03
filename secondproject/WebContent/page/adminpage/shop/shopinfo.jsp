<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"
   import="java.util.*, com.secondproject.admin.model.ShopInfoDto,com.secondproject.constant.*"
   import="com.secondproject.util.pagination.*"%>
<%
	ArrayList<ShopInfoDto> list = (ArrayList<ShopInfoDto>) request.getAttribute("list"); 
	String orderValue = (String) request.getAttribute("orderValue");
	Pagination pagination = (Pagination) request.getAttribute("pagination");
if (orderValue == null) {
	orderValue = "asc";
	}
%>
<script>
function searchUser() {
   if (document.searchForm.keyword.value == "") {
      alert("�˻��� �Է�!!!!!");
   } else {
      document.searchForm.action = "<%=ContextPath.root%>/admin";
      document.searchForm.submit();
   }
}

function column(){
       document.searchForm.action = "<%=ContextPath.root%>/admin";
       document.searchForm.submit();
}

function checkAll(){
    if( $("#th_checkAll").is(':checked') ){
      $("input[name=checkRow]").prop("checked", true);
    }else{
      $("input[name=checkRow]").prop("checked", false);
    }
}

function deleteUser() {
	if (confirm("�����Ͻðڽ��ϱ�?")) {
		document.orderncolumn.action = "<%=ContextPath.root%>/admin";
		document.orderncolumn.submit();
	}
}

function shopmodal(seq) {
	$.get("/secondproject/adminshop?act=showShopInfo&shopseq="+ seq, function(data, status){
		var tt = document.getElementById("shopInfoOne");
		tt.innerHTML=data;
		$('#shopModal').modal({show:true});
		initMap();
	});
}

</script> 
<section class="content page-top row">
   <div class="col-md-10 col-md-push-1">
      <div class="panel panel-default">
         <div class="panel-body">
            <div class="row">
               <div class="pull-left col-md-7">
                  <div class="btn-group">
                    <div class="btn-group">
                    
							<button type="button" class="btn btn-warning btn-filter" onclick="deleteUser();">���� ����</button>
						</div>
                  </div>
               </div>
             </div>
             <form name="orderncolumn" method="post" action="">
            <input type="hidden" name="act" value="shopdelete">
             <div class="table-container">
                <table class="table table-filter">
                   <tbody>
                      <tr class="warning" align="center">
                       <td><input type="checkbox" id="th_checkAll" onclick="checkAll();"/><label for="checkbox"></label></td>
                         <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&orderValue=<%=orderValue%>&orderKey=category_title" style="text-decoration:none">ī�װ���</a></td>
                        <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&orderValue=<%=orderValue%>&orderKey=title" style="text-decoration:none">�����</a></td>
                         <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&orderValue=<%=orderValue%>&orderKey=tel" style="text-decoration:none">���� ��ȣ</a></td>
                         <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&orderValue=<%=orderValue%>&orderKey=address" style="text-decoration:none">�ּ�</a></td>
                <%--          <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&shopInfoOrder=<%=shopInfoOrder%>&column=shop_id" style="text-decoration:none">��ȹ������</a></td> <!-- ��ȹ�� �ִ��� ������ ���� --> --%>
                     	 <td>EDIT</td>
                     </tr>
                     <tr>
                     <%int size = list.size();
                  
                     for (int i = 0; i<size; i++) {
                    	 ShopInfoDto shopInfoDto = list.get(i);
                    	 String checkbox = "checkbox" + i;
                     %>
                        <td>
                           <div class="ckbox">
                              <input type="checkbox" id="<%=checkbox%>" name="checkRow" value="<%=shopInfoDto.getShopTitle()%>"> <label for="<%=checkbox%>"></label>
                           </div>
                        </td>
                     
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> 
                                 <%=shopInfoDto.getCategoryName()%>
                                 	</span>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <p class="media-meta"><%= shopInfoDto.getShopTitle()%></p>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> <%=shopInfoDto.getShopTel()%></span>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> 
                                 <%=shopInfoDto.getShopAddress()%>
                                 	
                                 </span>
                              </div>
                           </div>
                        </td>
                        <td>
							<p data-placement="top" data-toggle="tooltip" title="Edit">
								<button type="button" class="btn btn-warning btn-xs" 
							     onclick="javascript:shopmodal(<%=shopInfoDto.getShopId()%>);"><span class="glyphicon glyphicon-pencil"></span>
								</button>
							</p>
						</td>
                     </tr>
                     
                     <%} %>
                     </form>
                  </tbody>
               </table>
            </div>
               <form name="searchForm" method="get" action="">
               <input type="hidden" name="act" value="shopinfo">
                  <div class="pull-right col-md-5">
                     <div class="input-group">
                        <div class="input-group-btn">
                        <select class="form-control" name="key">
                           <option value="title">�����̸�</option>
                           <option value="category_title">����Ÿ��</option>                           
                           <option value="tel">��ȭ��ȣ</option>
                           <option value="address">�ּ�</option>                           
                          <!--  <option value="shop_id">��ȹ��</option> -->
                        </select>
                     </div>
                     <input type="text" class="form-control" name = "word" placeholder="�˻��� �Է�" size="3">
                        <span class="input-group-btn">
                        	<button class="btn btn-warning" type="button" onclick="searchUser();">Search</button>
                  		</span>
                  </div>
                  </div>
            </form>
         </div>
      </div>
   </div>
</section>
<%@include file="/page/adminpage/shop/shopInfoModal.jsp"%>
<div class="col-md-12 col-md-push-4">
<%=pagination.getHtml()%>
</div>
<div class="col-md-6"></div>