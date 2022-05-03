<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<html>
<head>
<title>��ǰ ����</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- jquery CDN(Content Delivery Network) ȣ��Ʈ ��� -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>


<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body {
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	function fncGetUserList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
		//document.detailForm.submit();
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action",
				"/product/listProduct?menu=${menu}").submit();
	}

	$(function() {

		$("button.btn.btn-default").on("click", function() {
			fncGetUserList(1);
		});

		// ===================================== �߰� �κ� ========================================
		//�±׸�.Ŭ������
		$("td:nth-child(6) > i").on(
				"click",
				function() {

					//self.location = "/product/getProduct?menu=search&prodNo="+$(this).data("�ƹ�����");

					//var prodNo = $(this).data("value");
					var prodNo = $(this).next().val();
					$.ajax({
						url : "/product/json/getProduct/" + prodNo,
						method : "GET",
						dataType : "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {

							//Debug...
							//alert(status);
						
							//Debug...
							console.log("JSONData : \n" + JSONData);

							var displayValue = "<h7>" + "<br/><br/>��ǰ��ȣ : "
									+ JSONData.prodNo + "<br/>" + "��ǰ�� : "
									+ JSONData.prodName + "<br/>" + "������ : "
									+ JSONData.prodDetail + "<br/>" + "�������� : "
									+ JSONData.manuDate + "<br/>" + "��  �� : "
									+ JSONData.price + "<br/>" + "������� : "
									+ JSONData.regDate + "<br/>" + "</h7>";
							
							//Debug...									
							console.log(displayValue);
							
							$("h7").remove();
							$("#" + prodNo + "").html(displayValue);
						}
					});

				});

		$(".ct_list_pop td.toGet").on("click", function() {
					self.location = "/product/getProduct?menu=search&prodNo="+ $(this).data("�ƹ�����");
				});

		
		$(".ct_list_pop td.toUpdate").on("click", function() {
							self.location = "/product/updateProduct?menu=manage&prodNo="+ $(this).data("�ƹ�����");
						});

		
		$(".ct_list_pop td.toUpdateTranCode").on("click",function() {
							self.location = "/product/updateTranCodeByProd?tranCode=2&prodNo="
									+ $(this).data("AA");
						});

		//$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
		//$("h7").css("color" , "red");

	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">


		<!-- ��ü -->
		<!--  jQuery Event ó���� �����: 
		 action="/product/listProduct?menu=${menu}" method="POST"  -->

		<c:if test="${! empty menu && menu eq 'manage'}">
			<div class="page-header text-info">
				<h3>��ǰ ����</h3>
			</div>
		</c:if>

		<c:if test="${! empty menu && menu eq 'search'}">
			<div class="page-header text-info">
				<h3>��ǰ ��� ��ȸ</h3>
			</div>
		</c:if>


		<!-- table ���� �˻� Start /////////////////////////////////////-->
		<div class="row">

			<div class="col-md-6 text-left">
				<p class="text-primary">��ü ${requestScope.resultPage.totalCount}
					�Ǽ�, ���� ${requestScope.resultPage.currentPage} ������</p>
			</div>

			<div class="col-md-6 text-right">
				<form class="form-inline" name="detailForm">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0" ${search.searchCondition eq '0'? 'selected':''}>��ǰ��ȣ</option>
							<option value="1" ${search.searchCondition eq '1'? 'selected':''}>��ǰ��</option>
							<option value="2" ${search.searchCondition eq '2'? 'selected':''}>��ǰ����</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="�˻���"
							value="${search.searchKeyword}">
					</div>

					<button type="button" class="btn btn-default">�˻�</button>

					<!-- PageNavigation ���� ������ ���� ������ �κ� -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />

				</form>
			</div>

		</div>
		<!-- table ���� �˻� End /////////////////////////////////////-->


		<!--  table Start /////////////////////////////////////-->
		<table class="table table-hover table-striped">

			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">��ǰ��</th>
					<th align="left">����</th>
					<th align="left">�����</th>
					<th align="left">�������</th>
					<th align="left">��������</th>
				</tr>
			</thead>

			<tbody>

				<c:set var="no" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="no" value="${no+1}" />
					<tr class="ct_list_pop">
						<td align="center" data-value="${product.prodNo}" class="ajaxTest">${no}</td>
						<!--td></td-->

						<c:if test="${! empty menu && menu eq 'search'}">
							<td align="left" data-�ƹ�����="${product.prodNo}" class="toGet">
								<!-- a href="/product/getProduct?prodNo=${product.prodNo}&menu=search"></a> -->
								${product.prodName}
							</td>
							<!--td></td-->
							<td align="left">${product.price}</td>
							<!--td></td-->
							<td align="left">${product.manuDate}</td>
							<!--td></td-->

							<c:choose>
								<c:when test="${empty product.proTranCode}">
									<td align="left">�Ǹ���</td>
								</c:when>
								<c:when test="${! empty product.proTranCode}">
									<td align="left">������</td>
								</c:when>
							</c:choose>
						</c:if>

						<c:if test="${! empty menu && menu eq 'manage'}">
							<td align="left" data-�ƹ�����="${product.prodNo}" class="toUpdate">
								<!--<a href="/product/updateProduct?prodNo=${product.prodNo}&menu=manage"></a>-->
								${product.prodName}
							</td>
							<!--td></td-->
							<td align="left">${product.price}</td>
							<!--td></td-->
							<td align="left">${product.manuDate}</td>
							<!--td></td-->

							<c:choose>
								<c:when test="${empty product.proTranCode}">
									<td align="left">�Ǹ���</td>
								</c:when>

								<c:when test="${fn:startsWith(product.proTranCode,'1')}">
									<td align="left" data-AA="${product.prodNo}"
										class="toUpdateTranCode">���ſϷ� <!-- <a href="/product/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2"></a>-->
										����ϱ�
									</td>
								</c:when>

								<c:when test="${fn:startsWith(product.proTranCode,'2')}">
									<td align="left">�����</td>
								</c:when>

								<c:when test="${fn:startsWith(product.proTranCode,'3')}">
									<td align="left">��ۿϷ�</td>
								</c:when>
							</c:choose>

						</c:if>

						<!-- //////////////////////////// ����� �κ� ///////////////////////////// -->
						<!-- td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6"
							height="1"></td-->
						<td align="left"><i class="glyphicon glyphicon-ok"
							id="${product.prodNo}"></i> <input type="hidden"
							value="${product.prodNo}"></td>
					</tr>
				</c:forEach>


			</tbody>

		</table>
		<!--  table End /////////////////////////////////////-->

	</div>
	<!--  ȭ�鱸�� div End /////////////////////////////////////-->




	<!-- PageNavigation Start... -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">
		<tr>
			<td align="center"><input type="hidden" id="currentPage"
				name="currentPage" value="" /> <jsp:include
					page="../common/pageNavigator.jsp" /></td>
		</tr>
	</table>
	<!-- PageNavigation End... -->

</body>
</html>