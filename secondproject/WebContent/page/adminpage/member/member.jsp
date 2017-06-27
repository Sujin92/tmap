<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"
   import="java.util.*, com.secondproject.userdto.*,com.secondproject.constant.*"%>
<%String root = request.getContextPath();
ArrayList<UserDto> list = (ArrayList<UserDto>) request.getAttribute("list");
String userOrder = (String) request.getAttribute("userOrder"); %>

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

</script>
  
<section class="content page-top">
   <div class="col-md-10 col-md-push-1">
      <div class="panel panel-default">
         <div class="panel-body">
            <div class="row">
               <div class="pull-left col-md-7">
                  <div class="btn-group">
                     <button type="button" class="btn btn-default btn-filter">All</button>
                     <button type="button" class="btn btn-warning btn-filter">DELETE</button>
                  </div>
               </div>
         <form name="searchForm" method="get" action="">
   
               <input type="hidden" name="act" value="userview">
                  <div class="pull-right col-md-5">
                     <div class="input-group">
                        <div class="input-group-btn">
                        <select class="form-control" name="key_type">
                           <option value="user_id">���̵�</option>
                           <option value="type">ȸ��Ÿ��</option>                           
                           <option value="reg_date">������</option>
                           <option value="gender">����</option>                           
                           <option value="age">����</option>
                        </select>
                     </div>
                     <input type="text" class="form-control" name = "keyword" placeholder="�˻��� �Է�" size="3">
                        <button class="btn btn-warning" type="button" onclick="javascript:searchUser();">Search</button>
                  </div>
                  </div>
         </form>
            </div>
            <form name="orderncolumn" method="get" action="">
           <input type="hidden" name="act" value="userview">
            <div class="table-container">
               <table class="table table-filter">
                  <tbody>
                     <tr class="warning" align="center">
                        <td>Check</td>
                        <td><a href="<%=ContextPath.root%>/admin?act=userview%userorder=<%=userOrder%>&column=id" style="text-decoration:none" color="red" onclick="javascript:column();" name="id">���̵�</a></td>
                        <td><a href="<%=ContextPath.root%>/admin?act=userview%userorder=<%=userOrder%>&column=type" style="text-decoration:none" color="red" onclick="javascript:column();" name="type">ȸ��Ÿ��</a></td>
                        <td><a href="<%=ContextPath.root%>/admin?act=userview%userorder=<%=userOrder%>&column=reg_date" style="text-decoration:none" color="red" onclick="javascript:column();" name="reg_date">������</a></td>
                        <td><a href="<%=ContextPath.root%>/admin?act=userview%userorder=<%=userOrder%>&column=gender" style="text-decoration:none" color="red" onclick="javascript:column();" name="gender">����</a></td>
                        <td><a href="<%=ContextPath.root%>/admin?act=userview%userorder=<%=userOrder%>&column=age" style="text-decoration:none" color="red" onclick="javascript:column();" name="age">����</a></td>
                     </tr>
                     
                     
                     
                     <tr>
                     <%int size = list.size();
                  
                     for (int i = 0; i<size; i++) {
                        UserDto userDto = list.get(i);
                     %>
                        <td>
                           <div class="ckbox">
                              <input type="checkbox" id="checkbox1"> <label for="checkbox1"></label>
                           </div>
                        </td>
                     
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <p class="media-meta"><%= userDto.getUser_id()%></p>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <p class="media-meta"><%= userDto.getType()%></p>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> <%=userDto.getReg_date()%></span>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> <%=userDto.getGender()%></span>
                              </div>
                           </div>
                        </td>
                        <td>
                           <div class="media">
                              <div class="media-body">
                                 <span class="media-meta"> <%=userDto.getAge()%></span>
                              </div>
                           </div>
                        </td>
                     </tr>
                     
                     <%} %>
                  </tbody>
               </table>
            </div>
            </form>
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