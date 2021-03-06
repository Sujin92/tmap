var map = (function() {
	
	var currentPosition = {};
	var currentPositionMarker;
	
	var map;
	var markers = [];
	var AnimateMarkers = [];
	
	navigator.geolocation.getCurrentPosition(function(pos) {
		initMap(pos.coords.latitude, pos.coords.longitude);
	}, notSupportGPS);
	
	function initMap(lat, lng) {
		setCurrentPosition(lat, lng);
		loadMap();
		makeCurrentPositionMarker();
		pageFunc.getShopList(mapSlick);
	}
	
	function notSupportGPS(err) {
		initMap(37.485141, 126.898811);
		switch (err.code){
			case err.PERMISSION_DENIED:
				msg = "PERMISSION_DENIED";
			break;
			case err.PERMISSION_UNAVAILABLE:
				msg = "PERMISSION_UNAVAILABLE";
			break;
			case err.TIMEOUT:
				msg = "TIMEOUT";
			break;
			case err.UNKNOWN_ERROR:
				msg = "UNKNOWN_ERROR";
			break;
		}
		alert('GPS Fail :: ' + msg);
	}
	
	function setCurrentPosition(lat, lng) {
		currentPosition.lat = lat;
		currentPosition.lng = lng;
	}
	
	function loadMap() {
		map = new naver.maps.Map('map', {
			center: new naver.maps.LatLng(currentPosition.lat, currentPosition.lng),
			zoom: 9
		});
	}
	
	function makeCurrentPositionMarker() {
		currentPositionMarker = new naver.maps.Marker({
			position: new naver.maps.LatLng(currentPosition.lat, currentPosition.lng),
			map: map
		});
	}
	
	function getCurrentPositionMarker() {
		return currentPositionMarker;
	}
	
	function addMarkers(items, clickFunc) {
		//SYSOUT('addMarkers markers.length start = ' + markers.length);
		if (items) {
			items.forEach(function(item) {
				addMarker(item, clickFunc);
			});
		} else {
			SYSOUT('map.addMarkers(items) :: items 인자 값이 비어있음');
		}
		//SYSOUT('addMarkers markers.length end = ' + markers.length);
	}
	
	function addMarker(data, clickFunc) {
		if (data.lat && data.lng) {
			var marker = new naver.maps.Marker({
				position: new naver.maps.LatLng(data.lat, data.lng),
				map: map
			});
			markers.push(marker);
			var index = markers.indexOf(marker);
			naver.maps.Event.addListener(marker, 'click', function() {
				clickFunc(index);
			});
			
		} else {
			SYSOUT('map.addMarker(data) :: data.lat or data.lng 값이 없음');
		}
	}
	
	function clearMarkers() {
		//SYSOUT('clearMarkers markers.length start = ' + markers.length);
		if (markers.length > 0) {
			markers.forEach(function (marker) {
				clearMarker(marker);
			});
			markers = [];
		}
		//SYSOUT('clearMarkers markers.length end = ' + markers.length);
	}
	
	function clearMarker(marker) {
		marker.setMap(null);
	}
	
	function setMarkerAnimationByIndex(index) {
		setAnimationToMarker(markers[index]);
	}
	
	function setAnimationToMarker(marker) {
		marker.setAnimation(naver.maps.Animation.BOUNCE);
		AnimateMarkers.push(marker);
	}
	
	function clearAnimationMarkers() {
		AnimateMarkers.forEach(function(marker) {
			marker.setAnimation(null);
		});
		AnimateMarkers = [];
	}
	
	function moveMapToCurrentPosition() {
		moveMap(currentPosition);
	}
	
	function moveMapByMarkerIndex(index) {
		clearAnimationMarkers();
		setMarkerAnimationByIndex(index);
		moveMap(markers[index].position);
	}
	
	function moveMap(position) {
//		SYSOUT('map.moveMap(position) :: position._lat = ' + position._lat + ' position._lng = ' + position._lng);
		map.panTo(new naver.maps.LatLng(position._lat, position._lng), map.getZoom());
	}
	
	function getBounds() {
		return map.getBounds();
	}
	
	function searchAddressAndSetCenter(address, callback) {
		console.log(address);
		naver.maps.Service.geocode(
			{
				address : address
			},
			function(status, response) {
				if (status === naver.maps.Service.Status.ERROR) {
					return alert('주소가 검색이 안되네요!');
				}
		
				var items = response.result.items, htmlAddresses = [];
				for (var i = 0, ii = items.length, item; i < ii; i++) {
					item = items[i];
					if (item.isRoadAddress === false) {
						currentAddress = item.address;
						currentPosition = new naver.maps.Point(item.point.x, item.point.y);
						map.setCenter(currentPosition);
						callback();
						break;
					}
				}

			}
		);
	}
	
	return {
		'getCurrentPositionMarker': getCurrentPositionMarker,
		'getBounds': getBounds,
		'addMarkers': addMarkers,
		'clearMarkers': clearMarkers,
		'clearAnimationMarkers': clearAnimationMarkers,
		'setMarkerAnimationByIndex': setMarkerAnimationByIndex,
		'moveMapByMarkerIndex': moveMapByMarkerIndex,
		'searchAddressAndSetCenter' : searchAddressAndSetCenter
	}
	
})();