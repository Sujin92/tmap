<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.secondproject.admin.model.*, com.secondproject.constant.*"%>
<%
 	ShopInfoDto shopInfoDto = (ShopInfoDto) request.getAttribute("shopInfo");
%>

<input type="hidden" id="shoplat" value="<%=shopInfoDto.getLat()%>" />
<input type="hidden" id="shoplng" value="<%=shopInfoDto.getLng()%>" />
			<div class="row">
					<div class="col-md-12" id="shopInfoOne">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="inputName">ī�װ���</label> <input type="text"
												class="form-control" name="subject" id="shop_title"
												value="<%=shopInfoDto.getCategoryName()%>" readonly="readonly">
										</div>
										<label for="inputStore">�����</label>
											<div class="input-group">
												<input type="text" class="form-control" id="shop_name"
													name="store" value="<%=shopInfoDto.getShopTitle()%>" readonly="readonly">
											</div>
										<div class="form-group">
												<label for="inputName">�����ȣ</label> <input type="text"
													class="form-control" name="subject" id="shop_score"
													value="<%=shopInfoDto.getShopTel()%>" readonly="readonly">
										</div>
										<div class="form-group">
												<label for="inputName">�ּ�</label> <input type="text"
													class="form-control" name="subject" id="modalscore"
													value="<%=shopInfoDto.getShopAddress()%>" readonly="readonly">
										</div>
									</div>
									<div class="col-md-6">
											<img id="shop_img" src="<%=ContextPath.root%>/upload/fries.PNG" width="350" style="margin-top:20px"/>
									</div>
								</div>
									<div class="form-group">
										<div class="col-md-2">
										<div class="map-container mar" align="">
											<div class="col-md-offset-3" id="map" style="width: 750px; height: 300px;"></div>
										</div>
									</div>
									</div>
							</div>
						</div>
					</div>
			</div>