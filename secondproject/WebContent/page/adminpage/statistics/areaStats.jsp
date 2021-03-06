<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.constant.*"%>
<%
   String json = (String) request.getAttribute("area");
%>
<section class="content page-top row">
  <div align="center" style="padding-top:60px; padding-bottom:10px;">
      <button id="sendAge" class="btn btn-warning" width="100" height="50" onclick="javascript:getAge(0);">연령대별 가입자수</button>
      <button id="sendCategory"  class="btn btn-warning" width="100" onclick="javascript:getCategory(0);">카테고리별 All</button>
      <button id="sendCategory"  class="btn btn-warning" width="100" onclick="javascript:getCategory(1);">카테고리별 여성</button>
      <button id="sendCategory"  class="btn btn-warning" width="100" onclick="javascript:getCategory(2);">카테고리별 남성</button>
      <button id="sendArea"  class="btn btn-warning" width="100" onclick="javascript:getArea(0);">지역별 등록된 매장수</button>
  </div>
  <div class="col-md-3 col-md-push-5"></div>
  
      <div class="panel panel-default" style="margin-left:150px; margin-right:150px;">
            <div class="panel-body">
               <div class="col-md-1"></div>
               <div class="col-md-6">
                  <canvas id="areaChart" width="700" height="500"></canvas>
               </div>
               <div class="col-md-1"></div>
               <div class="col-md-4" style="padding-top:80px;">
               <div class="table-container table-responsive">
                  <table class="table table-filter">
                     <tbody>
                        <tr class="warning" align="center">
                           <td>조건</td>
                           <td>기간</td>
                        </tr>
                        <tr>
                           <td align="center">YEAR</td>
                           <td align="center">
                              <select class="form-control" name="year" style="width:270px;">
                                 <option>연도를 선택해주세요</option>
                                 <% 
                                    for (int i=2017; i>2000; i--) {
                                 %>
                                      <option value="year<%=i%>"><%=i%></option>
                                 <%
                                    }
                                 %>
                              </select> 
                           </td>
                        </tr>
                        <tr>
                           <td align="center">MONTH</td>
                           <td align="center">
                              <select class="form-control" name="month" style="width:270px;">
                                 <option>월을 선택해주세요</option>
                                 <% 
                                    for (int j=1; j<13; j++) {
                                 %>
                                      <option value="month<%=j%>"><%=j%></option>
                                 <%
                                    }
                                 %>
                              </select> 
                           </td>
                        </tr>
                        <tr>
                           <td align="center">FROM</td>
                           <td align="center">
                              <input type="text" id="from" name="from" style="width:250px;"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                           </td>
                        </tr>
                        <tr>
                           <td align="center">TO</td>
                           <td align="center">
                               <input type="text" id="to" name="to" style="width:250px;"> <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <div align="center">
                  <button id="today" class="btn btn-danger" width="50" height="50" onclick="javascript:getAjaxArea(50);">TODAY
                  <span class="glyphicon glyphicon-stats" aria-hidden="true"></span></button>
                  <button id="allday" class="btn btn-warning" width="50" height="50" onclick="javascript:getAjaxArea(0);">ALL
                  <span class="glyphicon glyphicon-stats" aria-hidden="true"></span></button>
                  <button id="selectday" class="btn btn-default" width="50" height="50" onclick="javascript:getAjaxArea();">SELECT
                  </button>
               </div>
            </div>
      </div>
   <div class="col-md-3"></div>
   </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js"></script>
<script type="text/javascript">

var ctx3 = document.getElementById("areaChart");
var areaChart = new Chart(ctx3,{
    type: 'pie',
    data: {  
       datasets: [{
        data: [40,20,10,30,20],
        backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
             'rgba(54, 162, 235, 0.2)',
             'rgba(255, 206, 86, 0.2)',
             'rgba(75, 192, 192, 0.2)',
             'rgba(153, 102, 255, 0.2)'
        ]
    }],
    labels: [
        '서울특별시',
        '경기도',
        '강원도',
        '경상도',
        '전라도'
    ]
    }
});

</script>
<script src="<%=ContextPath.root%>/page/adminpage/js/categoryStats.js"></script>
<script src="<%=ContextPath.root%>/page/adminpage/js/ageChart.js"></script>
<script src="<%=ContextPath.root%>/page/adminpage/js/areaChart.js"></script>