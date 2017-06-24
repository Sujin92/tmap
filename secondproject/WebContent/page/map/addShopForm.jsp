<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="modal_addshopForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="gridSystemModalLabel">������</h4>
      </div>
      <div class="modal-body">
      
		<div class="add-form-container">
			<div class="row">
				<div class="col-xs-12">
					<form id="addShopForm">
						<input type="hidden" name="act" value="addShopAjax" />
						<div class="form-group">
							<label for="addShopCategory">ī�װ�</label>
							<select name="addShopCategory" id="addShopCategory" class="form-control">
								<option value="">�޴��� �������ּ���</option>
								<option value="1">�ѽ�</option>
								<option value="2">ġŲ</option>
								<option value="3">�߽�</option>
								<option value="4">�̽�</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="addShopTitle">�����</label>
							<input type="text" class="form-control" id="addShopTitle" name="addShopTitle" placeholder="������� �Է����ּ���">
						</div>
						
						<div class="form-group">
							<label for="addShopAddress">�ּ�</label>
							<div class="form-group map2-container">
								<div id="addShopMap"></div>
								<div class="map-search">
									<div class="input-group">
										<input type="text" id="addShopAddress" class="form-control" placeholder="�˻��� �ּҸ� �Է��ϼ���">
										<span class="input-group-btn">
											<button id="addShopSearchSubmit" class="btn btn-default" type="button">�˻�</button>
										</span>
									</div>
								</div>
							</div>
							<input type="hidden" id="addShopLat" name="addShopLat" />
							<input type="hidden" id="addShopLng" name="addShopLng" />
							<input type="text" id="addShopAddress1" class="form-control" name="addShopAddress1" placeholder="�˻��� �̿��Ͽ� �Է����ּ���" readonly>
							<input type="text" id="addShopAddress2" class="form-control" name="addShopAddress2" placeholder="���ּ�"/>
						</div>
						
						<div class="form-group">
							<label for="addShopTel">��ȭ��ȣ</label>
							<input type="text" class="form-control" id="addShopTel" name="addShopTel" placeholder="��ȭ��ȣ">
						</div>
						
						<div class="form-group">
							<label for="addShopDetail">�޸�</label>
							<textarea class="form-control" rows="3" id="addShopDetail" name="addShopDetail" placeholder="�޹����̶���� �޴������ ��������� �����"></textarea>
						</div>
	
					</form>
				</div>
			</div>
		</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="addShopSubmit">���</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">���</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->