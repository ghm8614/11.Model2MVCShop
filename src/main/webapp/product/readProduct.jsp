<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%--@ page import="com.model2.mvc.service.domain.Product" --%>
<%--
Product product = (Product)request.getAttribute("product");
--%>

<html>
<head>
<title>��ǰ �� ��ȸ</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->



<script type="text/javascript">
	// ���� ��ư Event ó��
	/*
	 $(function() {
	
	 $( "td.ct_btn01:contains('����')" ).on("click" , function() {
	 //Debug..
	 //alert(  $( "td.ct_btn01:contains('����')" ).html() );
	 // purchase/addPurchaseView?prod_no=${requestScope.product.prodNo}
	 self.location = "purchase/addPurchaseView?prod_no=${requestScope.product.prodNo}"
	 });
	 });
	
	 */

	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") ���
		$("a[role='button']").on("click", function() {

			history.go(-1);
		});

		$("button.btn.btn-primary")
				.on(
						"click",
						function() {
							self.location = "/purchase/addPurchaseView?prod_no=${requestScope.product.prodNo}"
						});
	});
</script>
</head>


<!-- body bgcolor="#ffffff" text="#000000"-->
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">
			<h3 class=" text-info">��ǰ����ȸ</h3>
			<h5 class="text-muted">
				<strong class="text-danger">����ȸ</strong>������ �Դϴ�
			</h5>
		</div>

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ��ȣ</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.prodNo}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ǰ��</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.prodName}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ�̹���</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.fileName}</div>
		</div>

		<hr />


		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��ǰ������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.prodDetail}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>��������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.manuDate}</div>
		</div>

		<hr />


		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>����</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.price}</div>
		</div>

		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2 ">
				<strong>�������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${requestScope.product.regDate}</div>
		</div>

		<hr />

		<!-- ����, ������ư -->
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<button type="button" class="btn btn-primary">�� &nbsp;��</button>
				<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
			</div>
		</div>

		<br />

	</div>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>


<!--  
		<form name="detailForm" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">��ǰ����ȸ</td>
								<td width="20%" align="right">&nbsp;</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table>

			<!-- ��ǰ��ȣ 
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 13px;">
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ��ȣ <imgsrc
							="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105">${requestScope.product.prodNo}</td>
							</tr>
						</table>
					</td>
				</tr>
v

				<!-- ��ǰ�� 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ�� <imgsrc
							="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105">${requestScope.product.prodName}</td>
							</tr>
						</table>
					</td>
				</tr>
-->

<!-- ��ǰ�̹��� 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ�̹���</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${requestScope.product.fileName}</td>
				</tr>
-->

<!-- ��ǰ������ 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ������ <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${requestScope.product.prodDetail}</td>
				</tr>-->


<!-- �������� 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">�������� <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${requestScope.product.manuDate}</td>
				</tr>-->


<!-- ���� 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">���� <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${requestScope.product.price}</td>
				</tr>-->


<!-- ������� 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">������� <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">${requestScope.product.regDate}</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
			</table>
-->


<!-- 
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td width="53%"></td>
					<td align="right">

						<table border="0" cellspacing="0" cellpadding="0">
							<tr>

								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									<!-- <a href="/purchase/addPurchaseView?prod_no=${requestScope.product.prodNo}"></a> 
									����
								</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
								<td width="30"></td>

								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									<!-- <a href="javascript:history.go(-1)"></a>  ����
								</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>


					</td>
				</tr>
			</table>

		</form>
		-->
