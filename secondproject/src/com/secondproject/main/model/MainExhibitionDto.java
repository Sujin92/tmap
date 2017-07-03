package com.secondproject.main.model;

public class MainExhibitionDto {
	
	// ��ȹ�� �⺻ ����
	private int exhibitionId;
	private String ex_title;
	
	private String ex_desc;
	private String ex_image;
	private int ex_order;
	private int ex_visiable;
	private int ex_shopid;

	// ���� ������
	private int exd_order;
	private String shop_name; // �����
	private String exd_desc; // ��ȹ������ �� ���� �ڸ�Ʈ
	private String address; // ���� �ּ�
	private int score; // ���� ����
	private String shopImg;
	public String getShopImg() {
		return shopImg;
	}
	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}
	public int getExhibitionId() {
		return exhibitionId;
	}
	public void setExhibitionId(int exhibitionId) {
		this.exhibitionId = exhibitionId;
	}
	public String getEx_title() {
		return ex_title;
	}
	public void setEx_title(String ex_title) {
		this.ex_title = ex_title;
	}
	public String getEx_desc() {
		return ex_desc;
	}
	public void setEx_desc(String ex_desc) {
		this.ex_desc = ex_desc;
	}
	public String getEx_image() {
		return ex_image;
	}
	public void setEx_image(String ex_image) {
		this.ex_image = ex_image;
	}
	public int getEx_order() {
		return ex_order;
	}
	public void setEx_order(int ex_order) {
		this.ex_order = ex_order;
	}
	public int getEx_visiable() {
		return ex_visiable;
	}
	public void setEx_visiable(int ex_visiable) {
		this.ex_visiable = ex_visiable;
	}
	public int getExd_order() {
		return exd_order;
	}
	public void setExd_order(int exd_order) {
		this.exd_order = exd_order;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getExd_desc() {
		return exd_desc;
	}
	public void setExd_desc(String exd_desc) {
		this.exd_desc = exd_desc;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getEx_shopid() {
		return ex_shopid;
	}
	public void setEx_shopid(int ex_shopid) {
		this.ex_shopid = ex_shopid;
	}
}
