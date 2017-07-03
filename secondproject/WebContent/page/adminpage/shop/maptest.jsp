<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=HI7oAnTDg6I_l3gyYakf&callback=initMap"></script>
<script type="text/javascript">
var oMap = null; 
var oPoint = new nhn.api.map.LatLng(126.8716174, 37.5274949);
nhn.api.map.setDefaultPoint('LatLng'); 
function initMap() {
oMap = new nhn.api.map.Map('adminMap' ,{ 
point : oPoint, 
zoom : 10, 
enableWheelZoom : true, 
enableDragPan : true, 
enableDblClickZoom : false, 
mapMode : 0, 
activateTrafficMap : false, 
activateBicycleMap : false, 
minMaxLevel : [ 1, 14 ], 
}); 
}
//������ �̸�, ��Ŀ�� �߰��ϴ� ��ũ��Ʈ ����
var oSize = new nhn.api.map.Size(28, 37); 
var oOffset = new nhn.api.map.Size(14, 37); 
var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset); 

var oMarker = new nhn.api.map.Marker(oIcon, { title : '(��)�۷θ����̿��� ' }); //��Ŀ�� �־��ּ���. 
oMarker.setPoint(oPoint); //��Ŀ�� ��ǥ�� oPoint �� ����� ��ǥ�� �����Ѵ� 

oMap.addOverlay(oMarker); //��Ŀ�� ���̹� �������� ǥ���Ѵ� .

var oLabel = new nhn.api.map.MarkerLabel(); // ��Ŀ �󺧸� �����Ѵ�. 
oMap.addOverlay(oLabel); // - ��Ŀ�� ���� ������ �߰��Ѵ�. 
oLabel.setVisible(true, oMarker); // ��Ŀ�� ���� ���̰� �����Ѵ�. 
</script>
</head>
<body>
		<div class="col-md-offset-3" id="adminMap" style="width: 50%; height: 400px;"></div>
</body>
</html>