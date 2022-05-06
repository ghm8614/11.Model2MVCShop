<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<html>
<head>
<title>���Ż���ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

</head>

<body bgcolor="#ffffff" text="#000000">

<!--  table 1 : ���Ż���ȸ title -->
	<table width="100%" height="37" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
				width="15" height="37" /></td>
			<td background="/images/ct_ttl_img02.gif" width="100%"
				style="padding-left: 10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">���Ż���ȸ</td>
						<td width="20%" align="right">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
				width="12" height="37" /></td>
		</tr>
	</table>


<!--  table 2 : ���Ż���ȸ -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">

	<!-- tr1 : ��ǰ��ȣ 
		tranNo �ֹ���ȣ ����, prod_no ��ǰ��ȣ ���� �򰥸���..  �������忡�� �ʿ��Ѱ�?
	-->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��ǰ��ȣ <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${requestScope.purchase.purchaseProd.prodNo}</td>
						<td></td>
					</tr>
				</table>
			</td>
		</tr>

	<!-- tr2 : ������ ���̵� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�����ھ��̵� <img
				src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${sessionScope.user.userId}</td>
		</tr>

	<!-- tr3 : ���Ź�� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">���Ź��</td>
			<td bgcolor="D6D6D6" width="1"></td>
			
			<c:choose>
				<c:when test="${fn:startsWith(purchase.paymentOption,'1')}">
					<td class="ct_write01">���ݱ���</td>
				</c:when>
				
				<c:when test="${fn:startsWith(purchase.paymentOption,'2')}">
					<td class="ct_write01">�ſ뱸��</td>
				</c:when>
			
			</c:choose>
	
		</tr>

		<!-- tr4 : ������ �̸� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">������ �̸�</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${requestScope.purchase.receiverName}</td>
		</tr>

	<!-- tr5 : ������ ����ó -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">������ ����ó</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${requestScope.purchase.receiverPhone}</td>
		</tr>

	<!-- tr6 : ������ �ּ� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">������ �ּ�</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${requestScope.purchase.divyAddr}</td>
		</tr>

	<!-- tr7 : ���� ��û���� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">���� ��û����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${requestScope.purchase.divyRequest}</td>
		</tr>

	<!-- tr8 : �������� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">��������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${requestScope.purchase.divyDate}</td>
		</tr>


	<!-- tr9 : �ֹ��� -->
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="104" class="ct_write">�ֹ���</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${requestScope.purchase.orderDate}</td>
		</tr>

		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

	</table>


<!--  table 3 : ����, Ȯ�� ��ư ���̺� -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">
		<tr>
			<td width="53%"></td>
			<td align="right">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
							width="17" height="23" /></td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01"
							style="padding-top: 3px;"><a
							href="/purchase/updatePurchaseView.do?tranNo=${requestScope.purchase.tranNo}">����</a></td>
						<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
							width="14" height="23" /></td>
						<td width="30"></td>
						<td width="17" height="23"><img src="/images/ct_btnbg01.gif"
							width="17" height="23" /></td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01"
							style="padding-top: 3px;"><a
							href="javascript:history.go(-1);">Ȯ��</a></td>
						<td width="14" height="23"><img src="/images/ct_btnbg03.gif"
							width="14" height="23" /></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>

</body>
</html>
