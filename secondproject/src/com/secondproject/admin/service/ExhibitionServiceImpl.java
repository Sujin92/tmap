package com.secondproject.admin.service;

import java.util.*;

import com.secondproject.admin.action.ExhibitionShopUpAction;
import com.secondproject.admin.dao.ExhibitionDaoImpl;
import com.secondproject.admin.model.ExhibitionDetailDto;
import com.secondproject.admin.model.ExhibitionDto;
import com.secondproject.shop.model.ShopDto;
import com.secondproject.util.BoardConstance;

public class ExhibitionServiceImpl implements ExhibitionService {

	private ExhibitionServiceImpl(){}
	
	private static ExhibitionService exhibitionService;
	
	public static ExhibitionService getExhibitionService() {
		return exhibitionService;
	}
	static {
		exhibitionService = new ExhibitionServiceImpl();
	}
	@Override
	public int writeExhibition(ExhibitionDto exhibitionDto) {
		return ExhibitionDaoImpl.getExhibitionDao().writeExhibition(exhibitionDto);
	}
	@Override
	public List<ExhibitionDto> listExhibition(String key, String word, String order, String column, int pg) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		map.put("order", order);
		map.put("column", column);
		int end = pg * BoardConstance.LIST_SIZE;
		int start = end - BoardConstance.LIST_SIZE; 
		map.put("start", start +""); // ������ ù��ȣ�� ��������ȣ�� ����ϱ� ���ؼ� start�� end ����
		map.put("end", end +"");
		return ExhibitionDaoImpl.getExhibitionDao().listExhibition(map);
		
	}
	@Override
	public ExhibitionDetailDto viewExhibition(int seq) {
		return ExhibitionDaoImpl.getExhibitionDao().viewExhibition(seq);
	}
	@Override
	public List<ShopDto> shopExhibition(String key, String word, String order, String column) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		map.put("order", order);
		map.put("column", column);

		return ExhibitionDaoImpl.getExhibitionDao().shopExhibition(map);
	}
	@Override
	public int deleteExhibition(String[] exhibitions) {
		return ExhibitionDaoImpl.getExhibitionDao().deleteExhibition(exhibitions);
	}
	@Override
	public int plusExhibition(String[] shops, int seq) {
		return ExhibitionDaoImpl.getExhibitionDao().plusExhibition(shops, seq);
	}
	@Override
	public int modifyExhibition(ExhibitionDto exhibitionDto) {
		return ExhibitionDaoImpl.getExhibitionDao().modifyExhibition(exhibitionDto);
	};

}
