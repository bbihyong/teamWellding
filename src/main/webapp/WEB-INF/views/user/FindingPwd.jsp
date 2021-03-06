<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	<title>Login V2</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/bootstrap/css/bootstrap.min.css.map">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/fonts/loginfonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/fonts/loginfonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/vendor/loginvendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/css/loginutil.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/loginmain.css">
<!--===============================================================================================-->
	<script src="../resources/js/jquery-3.5.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/js/icia.common.js"></script>
<script>


	
$(function(){
	
	$("#userEmail").on("keypress", function(e){
		if(e.which == 13)
		{	
			fn_findCheck();
		}
		
	});
	
	$("#btn_cc").on("click", function(){

	    Swal.fire({ 
		icon: 'warning',
		text: '????????? ???????????? ???????????????.'
	  }).then(function(){
		  location.href = "/board/login";
	  });
	});

  
});
	
function fn_findCheck()
{
		document.contact.receiveMail.value = $("#email").val();
		
		var emailtest = $("#email").val();
		var id = $("#id").val();
		var name = $("#name").val();

		
		if ($.trim(id).length == 0) {
			//alert('???????????? ??????????????????');
			Swal.fire({ 
				icon: 'warning',
				text: '???????????? ???????????????.'
			});
			$("#id").val("");
			$("#id").focus();
			return;
		}
		
		if ($.trim(name).length == 0) {
			//alert('???????????? ??????????????????');
			Swal.fire({ 
				icon: 'warning',
				text: '????????? ???????????????.'
			});
			$("#name").val("");
			$("#name").focus();
			return;
		}
		
		if ($.trim(emailtest).length == 0) {
			//alert('???????????? ??????????????????');
			Swal.fire({ 
				icon: 'warning',
				text: '???????????? ???????????????.'
			});
			$("#email").val("");
			$("#email").focus();
			return;
		}
		
		
		

		if (!fn_validateEmail(emailtest)) {
			//alert("???????????? ????????? ??????????????????.");
			Swal.fire({ 
				icon: 'error',
				text: '???????????? ????????? ??????????????????.'
			});
			$("#email").val("");
			$("#email").focus();
			return;
		}

		$("#Findbtn").prop("disabled", true);

			var form = $("#contact")[0];
			var formData = new FormData(form);

			$.ajax({
						type : "POST",
						url : "/board/tpwd.do",
						data : formData,
						processData : false,
						contentType : false,
						cache : false,
						timeout : 600000,
						beforeSend : function(xhr) 
						{
							xhr.setRequestHeader("AJAX","true");
						},
						success : function(response) 
						{
							if (response.code == 0) 
							{
								//alert("????????? ???????????????");
								//alert("?????? ??????????????? ????????? ?????????????????????");
								/*const Toast = Swal.mixin({
								    toast: true,
								    position: 'center-center',
								    showConfirmButton: false,
								    timer: 2000,
								    timerProgressBar: true,
								    didOpen: (toast) => {
								        toast.addEventListener('mouseenter', Swal.stopTimer)
								        toast.addEventListener('mouseleave', Swal.resumeTimer)
								    }

								});
								
								Toast.fire({
								    icon: 'success',
								    title: '????????????  ????????????????????? ?????????????????????!'
								});*/
								Swal.fire({ 
									icon: 'success',
									title: '?????????????????? ?????? ??????!',
									text: '???????????? ????????? ????????? ?????? ??????????????? ??????????????????. ????????? ??? ????????????????????? ??????????????? ???????????????!'
								}).then(function(){
									location.href="/board/login";
								});
							}
							else if(response.code == 400){
								Swal.fire({ 
									icon: 'error',
									title: '???????????? ?????? ???????????? ?????????.'
								}).then(function(){
									return;
								});
							}
							else 
							{
								//alert("??????!");
								//alert("???????????? ????????? ????????????");
								//alert("????????? ????????????");
								//$("#btnEmailCheck").prop("disabled", false);
								/*Swal.fire({ 
									icon: 'error',
									text: '????????? ???????????? ????????????!'
								}).then(function(){
									$("#Findbtn").prop("disabled", false);
								});*/

								Swal.fire({ 
									icon: 'error',
									title: '????????? ????????????,,'
								}).then(function(){
									return;
								});
							}
						},
						complete : function(data) 
						{
							icia.common.log(data);
						},
						error : function(xhr, status, error) 
						{
							icia.common.error(error);
						}
					});
	}
function fn_validateEmail(value) {
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

	return regExp.test(value);
};
</script>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
					<span class="login100-form-title">
						<h1 id="logo"><img src="../resources/images/theWellding.png" width="150" height="auto" onclick="fn_index()" style="cursor: pointer;" /></h1>

					</span>
					<div>
							<ul>
                     		</ul>
                     	</div>
					<span class="login100-form-title">
						<!-- <i class="zmdi zmdi-font"></i> -->
						
						<div class="mTab eTab">	
								<ol id="gusdkqkqh">
									<h3>???????????? ??????</h3>
									<p class="id_list">???????????? ??????, ???????????? ????????? ????????? ??????????????????.</p>	
								</ol>
						</div>
					</span>
					<div>
					<form id="contact" name="contact" method="post">
					
						<div class="wrap-input1002 validate-input" data-validate = "Valid email is: a@b.c">
							<input id="id" name="id" data-bind="id" type="text" class="input100" value="">
							<span class="focus-input100" data-placeholder="ID"></span>
						</div>
						
						<div class="wrap-input1002 validate-input" data-validate = "Valid email is: a@b.c">
							<input id="name" name="name" data-bind="name" type="text" class="input100" value="">
							<span class="focus-input100" data-placeholder="NAME"></span>
						</div>
						
						<div class="wrap-input1002 validate-input" data-validate = "Valid email is: a@b.c">
							<input id="email" name="email" data-bind="email" type="text"  class="input100" value="">
							<span class="focus-input100" data-placeholder="EMAIL"></span>							
						</div>	
										
							<input name="senderName" type="hidden" id="senderName" value="??????" />
							<input name="senderMail" type="hidden" id="senderMail" value="wellding@gmail.com" />
							<input type="hidden" name="receiveMail" id="receiveMail" value="" />
					</form>
					</div>
						
					
					<div class="container-login100-form-btn3">
						<div class="wrap-login100-form-btn2">
							<div class="login100-form-bgbtn2"></div>
							<button type="button" id="Findbtn" onclick="fn_findCheck()" class="login100-form-btn2" >
								??????
							</button>
						</div>
						<div class="wrap-login100-form-btn2">
							<div class="login100-form-bgbtn2"></div>
							<button type="button" id="btn_cc" class="login100-form-btn2">
								????????????
							</button>
						</div>
						
						
					</div>
					
						<input type="button" onclick="plusNum()" value="d" style="width: 50px; height: 50px; background-color: white; color: white; cursor: default;"/>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	
<!--===============================================================================================-->
	<script src="../resources/vendor/loginvendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/loginvendor/bootstrap/js/popper.js"></script>
	<script src="../resources/vendor/loginvendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/loginvendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/loginvendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/vendor/loginvendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../resources/vendor/loginvendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../resources/js/loginmain.js"></script>

</body>
</html>