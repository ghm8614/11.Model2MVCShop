<!-- %@page import="com.model2.mvc.common.util.CommonUtil"%-->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<!--  tr : table row -->
<!--  th : table head : column�� (���� cell)-->
<!--  td : table cell -->

<!-- �Ϲ�ȸ���� �����̷���ȸ -->

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<!-- ��ü -->
		<form name="detailForm" action="/purchase/listPurchase" method="post">

			<!-- table 1 :  -->
			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>


			<!-- table 2 : ���Ÿ�� ���̺� -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount}, ���� ${resultPage.currentPage} ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="50">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="120">�ֹ�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">�����ڸ�</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="200">�����ּ�</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="300">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="count" value="0" />
				<c:forEach var="purchase" items="${list}">
					<c:set var="count" value="${count+1}" />
					
					<tr class="ct_list_pop">
						<td align="center">${count}</td>
						<td></td>
						<td align="center">${purchase.orderDate}</td>
						<td></td>
						<td align="left"><a
							href="/purchase/getPurchase.do?tranNo=${purchase.tranNo}">${purchase.purchaseProd.prodName}</a>
						</td>
						<td></td>
						<td align="left">${purchase.receiverName}</td>
						<td></td>
						<td align="left">${purchase.divyAddr}</td>
						<td></td>

						<c:choose>
						
							<c:when test="${fn:startsWith(purchase.tranCode,'1')}">
								<td align="left">���ſϷ�</td>
								<td></td>
							</c:when>
							
							<c:when test="${fn:startsWith(purchase.tranCode,'2')}">
								<td align="left"><a
									href="/purchase/updateTranCode.do?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a></td>
								<td></td>
							</c:when>
							
							<c:when test="${fn:startsWith(purchase.tranCode,'3')}">
								<td align="left">��ۿϷ�</td>
								<td></td>
							</c:when>
						</c:choose>


						<c:choose>
							<c:when test="${fn:startsWith(purchase.paymentOption,'1')}">
								<td align="left">���ݰ���</td>
								<td></td>
							</c:when>
							
							<c:when test="${fn:startsWith(purchase.paymentOption,'2')}">
								<td align="left">�ſ����</td>
								<td></td>
							</c:when>
						</c:choose>
						
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>


			</table>


			<!-- table 3 : PageNavigation ���̺� -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage" name="currentPage" value="" /> 
					 
					 <jsp:include page="../common/pageNavigator.jsp"/>
					 
					 </td>
				</tr>
			</table>


		</form>

	</div>

</body>
</html>