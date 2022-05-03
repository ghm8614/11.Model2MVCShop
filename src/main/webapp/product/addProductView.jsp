<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>상품등록</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  jQuery CDN (Content Delivery Network) 호스트 사용 -->
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>



<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js"></script>


<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body>div.container {
	/*border: 3px solid #D6CDB7;
	margin-top: 100px;*/
	padding-top: 50px;
}
</style>

<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	function fncAddProduct() {
		//Form 유효성 검증

		//var name = document.detailForm.prodName.value;
		//var detail = document.detailForm.prodDetail.value;
		//var manuDate = document.detailForm.manuDate.value;
		//var price = document.detailForm.price.value;
		var name = $("input[name='prodName']").val();
		var detail = $("input[name='prodDetail']").val();
		var manuDate = $("input[name='manuDate']").val();
		var price = $("input[name='price']").val();

		if (name == null || name.length < 1) {
			alert("상품명은 반드시 입력하여야 합니다.");
			return;
		}
		if (detail == null || detail.length < 1) {
			alert("상품상세정보는 반드시 입력하여야 합니다.");
			return;
		}
		if (manuDate == null || manuDate.length < 1) {
			alert("제조일자는 반드시 입력하셔야 합니다.");
			return;
		}
		if (price == null || price.length < 1) {
			alert("가격은 반드시 입력하셔야 합니다.");
			return;
		}

		//document.detailForm.action = '/addProduct.do';
		//document.detailForm.submit();
		$("form").attr("method", "POST").attr("action", "/product/addProduct")
				.submit();
	}

	// 등록버튼 Event 
	$(function() {
		$("button.btn.btn-primary").on("click", function() {

			fncAddProduct();
		})
	});

	// 취소버튼 Event
	$(function() {
		$("a.btn.btn-primary.btn").on("click", function() {

			$("form")[0].reset();
		})
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp"></jsp:include>
	<!-- ToolBar End /////////////////////////////////////-->


	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header text-center">
			<h3 class="text-info">상품등록</h3>
			<h5 class="text-muted">
				<strong class="text-danger">상품등록</strong>해 주세요.
			</h5>
		</div>

		<!--  상품등록 테이블 -->
		<!-- table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						
						 <table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">상품등록</td>
								<td width="20%" align="right">&nbsp;</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37" /></td>
				</tr>
			</table-->






		<!-- Form Start -->
		<!-- ///////jQuery Event 처리로 변경됨 ////////-->
		<form class="form-horizontal" name="detailForm">


			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName"
						name="prodName">
				</div>
			</div>

			<div class="form-group">
				<label for="prodDetail"
					class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail"
						name="prodDetail">
				</div>
			</div>


			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
				<div class="col-sm-4">
					<input type="date" class="form-control" id="manuDate"
						name="manuDate">
				</div>
			</div>



			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price">
				</div>
			</div>


			<div class="form-group">
				<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="fileName"
						name="fileName">
				</div>
			</div>



			<!--  css 적용전 -->
			<!--table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 13px;"-->

			<!-- 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">상품명 <imgsrc
							="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"></td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105"><input type="text" name="prodName"
									class="ct_input_g" style="width: 100px; height: 19px"
									maxLength="20"></td>
							</tr>
						</table>
					</td>
				</tr>
			 -->

			<!-- 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">상품상세정보 <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="prodDetail"
						class="ct_input_g" style="width: 100px; height: 19px"
						maxLength="10" minLength="6" /></td>
				</tr>
			 -->

			<!-- 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">제조일자 <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="manuDate"
						readonly="readonly" class="ct_input_g"
						style="width: 100px; height: 19px" maxLength="8" minLength="6" />
						&nbsp;<img src="../images/ct_icon_date.gif" width="15" height="15"
						onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)" />
					</td>
				</tr>
			 -->

			<!-- 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">가격 <img
						src="/images/ct_icon_red.gif" width="3" height="3"
						align="absmiddle" />
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="price"
						class="ct_input_g" style="width: 100px; height: 19px"
						maxLength="10">&nbsp;원</td>
				</tr>
			 -->


			<!-- 
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">상품이미지</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01"><input type="text" name="fileName"
						class="ct_input_g" style="width: 200px; height: 19px"
						maxLength="13" /></td>
				</tr>

			
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				 -->

			<!-- /table-->

			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary">등 록</button>
					<a class="btn btn-primary btn" href="#" role="button">취 소</a>
				</div>
			</div>

	
			<!-- table width="100%" border="0" cellspacing="0" cellpadding="0"
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
									<!-- jQuery Event 처리로 변경됨  등록
								</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
								<td width="30"></td>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									<!-- jQuery Event 처리로 변경됨  취소
								</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table-->

		</form>
		<!-- form End /////////////////////////////////////-->

	</div>
	<!--  화면구성 div end /////////////////////////////////////-->



</body>
</html>