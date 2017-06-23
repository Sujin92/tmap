var mapSlick = $('.search-list-container-mobile .search-list').slick({'arrows' : false});

// 모바일버전 search-list 스와이프
$(document).on('swipe', '.search-list-container-mobile .search-list', function(event, slick, direction){
	map.moveMapByMarkerIndex($(this).slick('slickCurrentSlide'));
});

//데스크탑 search-list 마우스오버
$(document).on('mouseenter', '.search-list-container .shop', function() {
	$('.search-list-container .shop').removeClass('on').eq($(this).index()).addClass('on');
	map.moveMapByMarkerIndex($(this).index());
});

//search-detail 열기
$(document).on('click', '#search_detail_controll_btn', function () {
	pageFunc.showSearchDetail(true);
});

// search-detail 닫기
$(document).on('click', '#search_detail_controll_close_btn', function() {
	pageFunc.showSearchDetail(false);
});

// search-detail submit 클릭시
$(document).on('click', '#search-detail-controll-submit', function() {
	var btn = $(this).button('searching');
	btn.attr('disabled', 'disabled');
	
	pageFunc.getShopList(mapSlick, function () {
		pageFunc.showSearchDetail(false);
		btn.removeAttr('disabled');
		btn.button('reset');
	});
});

$(document).on('click', '#modal_add_shop_btn', function() {
	$('#modal_add_shop').modal('show');
});