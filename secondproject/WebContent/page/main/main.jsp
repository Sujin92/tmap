<%@page import="com.secondproject.constant.ContextPath"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"
	import="java.util.*, com.secondproject.admin.model.*"%>
<%
List<ExhibitionDto> list = (List<ExhibitionDto>) request.getAttribute("exhibitionList");
%>
<div id="main-visual-container">

	<div class="visual-title">
		<span class="sub-title">������ ����, ���� �� �ִ� ����!</span>
		<span class="title">Tmap</span>
	</div>
	
	<div class="visual-imgs">
		<div style="background-image: url(<%=ContextPath.root%>/page/main/img/main_banner_1.png)"></div>
		<div style="background-image: url(<%=ContextPath.root%>/page/main/img/main_banner_2.png)"></div>
		<div style="background-image: url(<%=ContextPath.root%>/page/main/img/main_banner_3.png)"></div>
	</div>
	
</div>


<%
	if (list != null) {
		int size = list.size();
	for (int i=0; i<size; i++) {
		ExhibitionDto exhibitionDto = list.get(i);
%>
<div class="exhibition-container black">
	<div class="ex-title"><%=exhibitionDto.getExTitle()%></div>
	<div class="ex-desc"><%=exhibitionDto.getExDesc()%></div>
	
	<div class="ex-slick-container">
	
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
	</div>
</div>
<%
	}
}
%>
<div class="exhibition-container">
	<div class="ex-title">ķ�ο� �ٺ�ť�� ����</div>
	<div class="ex-desc">#ķ�� #�ٺ�ť #�����ް� #�߿����� #����</div>
	
	<div class="ex-slick-container">
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
	</div>
</div>

<div class="ex-hr"></div>

<div class="exhibition-container">
	<div class="ex-title">ķ�ο� �ٺ�ť�� ����</div>
	<div class="ex-desc">#ķ�� #�ٺ�ť #�����ް� #�߿����� #����</div>
	
	<div class="ex-slick-container">
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
		
		<a href="#" class="shop">
			<div class="shop-img">
				<img  data-lazy="<%=ContextPath.root%>/page/main/img/shopimg1.png"/>
				<div class="shop-score">7.74</div>
			</div>
			<div class="shop-content">
				<div class="shop-title">������</div>
				<div class="shop-desc">�������� �̻�� ����������! ������������ ���� ������ ��� ���ٺ��� �ִ�.</div>
				<div class="shop-address">��⵵ ����� ���յ� 46-2</div>
			</div>
		</a>
	</div>
</div>