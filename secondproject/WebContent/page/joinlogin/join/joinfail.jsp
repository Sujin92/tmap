<%@page import="com.secondproject.constant.ContextPath"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
alert("�Է��Ͻ� ������ ����Ȯ�ϰų� �Ͻ��� ���� ������ ȸ�� ������ �����Ͽ����ϴ�.\nȮ�� �� �ٽ� �õ��� �ּ���.");
history.back();
location.href="<%=ContextPath.root%>";
</script>
    
    <!-- 
    
<div class="modal" id="joinfailmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<center>
						<h4 class="modal-title">Join Failed</h4>
					</center>
				</div>
				<div class="modal-body">
					<div class="form-group">
					<center>
						<label for="inputEmail" class="col-lg-2 control-label">�Ͻ��� ���� ������ ȸ�������� �����Ͽ����ϴ�.<br>
						</label>
					</center>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						onclick="javascript:joinmove();">Go Join</button>
					<button type="button" class="btn btn-default"
						onclick="javascript:cancel();">Cancel</button>
				</div>
			</div>
		</div>
	</div>

<script> 
function joinmove() {
	$("#joinmodal").modal("show");
}
</script> -->