package com.secondproject.admin.service;

import java.util.List;
import java.util.Map;

import com.secondproject.admin.model.ExhibitionDetailDto;
import com.secondproject.admin.model.ExhibitionDto;
import com.secondproject.shop.model.ShopDto;

public interface ExhibitionService {

	int writeExhibition(ExhibitionDto exhibitionDto);
	List<ExhibitionDto> listExhibition(Map<String, Object> params);
	ExhibitionDto viewExhibition(int seq);
	List<ShopDto> shopExhibition(String key, String word, String order, String column);
	int deleteExhibition(String[] exhibitions);
	int plusExhibition(String[] shops, int seq);
	int modifyExhibition(ExhibitionDto exhibitionDto);
	
	List<ShopDto> shopUpdated(int seq);
	
	int deleteShopList(int exseq,int shopseq);
}
