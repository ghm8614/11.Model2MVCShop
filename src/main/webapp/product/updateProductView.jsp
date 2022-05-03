<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%--@ page import="com.model2.mvc.service.domain.Product"--%>
<%--
Product product = (Product) request.getAttribute("product");
--%>

<html>
<head>
<title>��ǰ ����</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jquery CDN(Content Delivery Network) ȣ��Ʈ ��� -->
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
	function fncAddProduct() {
		//Form ��ȿ�� ����
		//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;

		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}

		//document.detailForm.action = '/product/updateProduct';
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action",
				"/product/updateProduct").submit();
	}

	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			fncAddProduct();
		});
	});

	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.

		// $("a[role='button']").on("click", function() {
		$("a[href='#']").on("click", function() {
			history.go(-1);
		});
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">


<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
<form name="detailForm"  method="post" >
////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->


	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-center">
			<h3 class=" text-info">��ǰ����</h3>
			<h5 class="text-muted">
				��ǰ ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.
			</h5>
		</div>



		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" name="detailForm">

			<!-- hidden .. prodNo�� ������ ������ 
		UpdateProductAction �Ķ���ͷ� �Ѱ�����Ѵ�. -->
			<input type="hidden" name="prodNo" value="${product.prodNo}">



			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName"
						name="prodName" value="${product.prodName}">
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail"
						name="prodDetail" value="${product.prodDetail}">
				</div>
			</div>

			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="manuDate"
						name="manuDate" value="${product.manuDate}">
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						value="${product.price}">&nbsp;��
				</div>
			</div>

			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fileName"
						name="fileName" value="${product.fileName}">
				</div>
			</div>


			<!--  ����, ��� ��ư -->
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">�� &nbsp;��</button>
					<a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
				</div>
			</div>





			<!-- table width="100%" height="37" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
					width="15" height="37" /></td>
				<td background="/images/ct_ttl_img02.gif" width="100%"
					style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">��ǰ����</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
					width="12" height="37" /></td>
			</tr>
		</table-->
			<!-- 
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 13px;">
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
								<td width="105"><input type="text" name="prodName"
									class="ct_input_g" style="width: 100px; height: 19px"
									maxLength="20" value="${product.prodName}"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ������ <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="prodDetail"
						class="ct_input_g" style="width: 100px; height: 19px"
						maxLength="10" minLength="6" value="${product.prodDetail}" /></td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">�������� <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="manuDate"
						readonly="readonly" class="ct_input_g"
						style="width: 100px; height: 19px" maxLength="10" minLength="6"
						value="${product.manuDate}" /> &nbsp;<img
						src="../images/ct_icon_date.gif" width="15" height="15"
						onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">���� <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="price"
						class="ct_input_g" style="width: 100px; height: 19px"
						maxLength="10" value="${product.price}">&nbsp;��</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ�̹���</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="fileName"
						class="ct_input_g" style="width: 200px; height: 19px"
						maxLength="13" value="${product.fileName}" /></td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
			</table>

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
									<!-- <a href="javascript:fncAddProduct();"></a>  ����
								</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
								<td width="30"></td>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									<!-- <a href="javascript:history.go(-1)"> </a> ���
								</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
 -->


		</form>
		<!-- form End /////////////////////////////////////-->


	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
</body>
</html>