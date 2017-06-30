<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"
   import="java.util.*, com.secondproject.admin.model.ShopInfoDto,com.secondproject.constant.*"%>
<%String root = request.getContextPath();
ArrayList<ShopInfoDto> list = (ArrayList<ShopInfoDto>) request.getAttribute("list"); 
String shopInfoOrder = (String) request.getAttribute("shopInfoOrder");
if (shopInfoOrder == null) {
	shopInfoOrder = "desc";
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

</script> 
  
<section class="content page-top">
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
         <form name="searchForm" method="get" action="">
   
               <input type="hidden" name="act" value="shopinfo">
                  <div class="pull-right col-md-5">
                     <div class="input-group">
                        <div class="input-group-btn">
                        <select class="form-control" name="key_type">
                           <option value="title">�����̸�</option>
                           <option value="category_title">����Ÿ��</option>                           
                           <option value="tel">��ȭ��ȣ</option>
                           <option value="address">�ּ�</option>                           
                          <!--  <option value="shop_id">��ȹ��</option> -->
                        </select>
                     </div>
                     <input type="text" class="form-control" name = "keyword" placeholder="�˻��� �Է�" size="3">
                        <button class="btn btn-warning" type="button" onclick="searchUser();">Search</button>
                  </div>
                  </div>
            </form>
             </div>
             <form name="orderncolumn" method="post" action="">
            <input type="hidden" name="act" value="shopdelete">
             <div class="table-container">
                <table class="table table-filter">
                   <tbody>
                      <tr class="warning" align="center">
                       <td><input type="checkbox" id="th_checkAll" onclick="checkAll();"/><label for="checkbox"></label></td>
                        <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&shopInfoOrder=<%=shopInfoOrder%>&column=title" style="text-decoration:none">�����̸�</a></td>
                         <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&shopInfoOrder=<%=shopInfoOrder%>&column=category_title" style="text-decoration:none">����Ÿ��</a></td>
                         <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&shopInfoOrder=<%=shopInfoOrder%>&column=tel" style="text-decoration:none">��ȭ��ȣ</a></td>
                         <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&shopInfoOrder=<%=shopInfoOrder%>&column=address" style="text-decoration:none">�ּ�</a></td>
                <%--          <td><a href="<%=ContextPath.root%>/admin?act=shopinfo&shopInfoOrder=<%=shopInfoOrder%>&column=shop_id" style="text-decoration:none">��ȹ������</a></td> <!-- ��ȹ�� �ִ��� ������ ���� --> --%>
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
                                 <p class="media-meta"><%= shopInfoDto.getShopTitle()%></p>
                              </div>
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
                        <%-- <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> <%=shopInfoDto.getExhibitionId()%></span>
                              </div>
                           </div>
                        </td> --%>
                     </tr>
                     
                     <%} %>
                     </input>
                     </form>
                     
                  </tbody>
               </table>
            </div>
            <!-- <div class="btn-group pull-right">
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
            </div> -->
         </div>
      </div>
   </div>
</section>
<%@ include file="/page/adminpage/include/pageNav.jsp"%>
