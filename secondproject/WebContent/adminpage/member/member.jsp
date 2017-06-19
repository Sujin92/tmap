<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<section class="content page-top">
	<div class="col-md-10 col-md-push-1">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="row">
					<div class="pull-left col-md-7">
						<div class="btn-group">
							<button type="button" class="btn btn-default btn-filter">All</button>
							<button type="button" class="btn btn-warning btn-filter">DELETE</button>
						</div>
					</div>

					<div class="pull-right col-md-5">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="�˻��� �Է�">
							<span class="input-group-btn">
								<button class="btn btn-warning" type="button">Search</button>
							</span>
						</div>
					</div>
				</div>
				<div class="table-container">
					<table class="table table-filter">
						<tbody>
							<tr class="warning" align="center">
								<td>Check</td>
								<td>Email-Id</td>
								<td>������</td>
								<td>�ŷ�����</td>
							</tr>
							<tr>
								<td>
									<div class="ckbox">
										<input type="checkbox" id="checkbox1"> <label
											for="checkbox1"></label>
									</div>
								</td>
								<td>
									<div class="media">
										<span class="media-meta">psujin831@gmail.com</span>
									</div>
								</td>
								<td>
									<div class="media">
										<div class="media-body">
											<p class="media-meta">Jun 16 2017</p>
										</div>
									</div>
								</td>
								<td>
									<div class="media">
										<div class="media-body">
											<span class="media-meta"> 1234567890</span>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn-group pull-right">
					<button type="button" class="btn btn-warning">�����ټ�</button>
					<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						<span class="caret"></span> 
						<span class="sr-only">Toggle Dropdown</span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">�����ټ�</a></li>
						<li><a href="#">�����ϼ�</a></li>
						<li><a href="#">�ŷڵ���</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>
<%@ include file="/adminpage/include/pageNav.jsp"%>