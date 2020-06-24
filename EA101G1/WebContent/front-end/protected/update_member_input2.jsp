<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.member.model.*" %>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>S.F.G首頁</title>
    <!-- TODO: 換title 的icon -->
    <link rel="icon shortcut" href="./img/ICON.ico">
    <!-- Bootstrap官方網站 https://getbootstrap.com/ -->
    <!-- 連結Bootstrap.min.css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- 使用font awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
        integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    <!-- 使用google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Sedgwick+Ave+Display&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lakki+Reddy&display=swap" rel="stylesheet">

    <!-- 使用style.css -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/css/style.css">

    <!-- 連結Bootstrap所需要的js -->
    <!-- jquery.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- popper.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <!-- bootstrap.min.js -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/files/jQuery-TWzipcode-master/jquery.twzipcode.min.js"></script>

<style>
	input#upload {
		display: none;
	}
	img#display {
		width: 300px;
		height: 300px;
	}
</style>


</head>

<body>
    <!-- navbar -->
    <!-- 使用Boostrap Navbar -->
    <!-- 設定Navbar緊貼畫面上緣 -->
    <!-- b4-navbar-default 安裝Bootstrap外掛,可以使用快捷指令 -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/front-end/index.jsp">
            <span class="logo"><i class="fas fa-bomb"></i></span>
            <span class="logo2">S.F.G</span>
            <span class="logo3">{{{</span>
        </a>
        <!-- 手機選單按鈕 -->
        <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#collapsibleNavId"
            aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="navbar2 navbar-dark">
            <div class="row">
                <div class="item col-md-2"><a href="#"></a>商城</div>
                <div class="item col-md-2"><a href="#"></a>團購</div>
                <div class="item col-md-2"><a href="#"></a>交易</div>
                <div class="item col-md-2"><a href="#"></a>討論區</div>
                <div class="item col-md-2"><a href="#"></a>紅利</div>
                <div class="item col-md-2"><a href="#"></a>Q&A</div>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="collapsibleNavId">
            <ul class="navbar-nav ml-auto">
                <c:if test="${memberVO == null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/login.jsp">登入</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊</a>
                </li>
            </c:if>
            <c:if test="${memberVO ne null}">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/front-end/protected/listOneMember.jsp">會員中心</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="<%=request.getContextPath()%>/front-end/member/member.do?action=logout">登出</a>
                </li>
          	</c:if>
                <li class="nav-item">
                    <a class="nav-link" href="#">我的最愛</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">購物車</a>
                </li>

            </ul>
        </div>


    </nav>
    <!-- navbar end -->
    <section class="blank0"></section>
    <!-- 內容 -->
	<form action="<%=request.getContextPath()%>/member/member.do" method="post" enctype="multipart/form-data">
	<table bgcolor="white">
		<tr>
			<td>會員編號：<font><b>*</b></font></td>
			<td><%=memberVO.getMem_id()%></td>
		</tr>
		<tr>
			<td>會員信箱：<font><b>*</b></font></td>
			<td><%=memberVO.getMem_email()%></td>
		</tr>
		<tr>
			<td>會員密碼：</td>
			<td><input type="text" name="mem_pass" size="45" value="<%=memberVO.getMem_pass()%>"></td>
		</tr>
		<tr>
			<td>會員名稱：</td>
			<td><input type="text" name="mem_name" size="45" value="<%=memberVO.getMem_name()%>"></td>
		</tr>
		<tr>
			<td>會員圖片：</td>
			<td>
				<label for="upload">
					<img alt="" src="<%=request.getContextPath()%>/member/ShowMemberPic.do?mem_id=<%=memberVO.getMem_id()%>" id="display" class="rounded-circle border border-success">
				</label>
				<input type="file" name="mem_icon" id="upload">
			</td>
		</tr>
		<tr>
			<td>會員手機：</td>
			<td><input type="text" name="mem_phone" size="45" value="<%=memberVO.getMem_phone()%>"></td>
		</tr>
		<tr>
			<td>會員地址：</td>
			<td>
				<input type="text" name="mem_addr" size="45" value="<%=memberVO.getMem_addr()%>">
				<div id="twzipcode">
				<script>
					$('#twzipcode').twzipcode({
						zipcodeIntoDistrict : true,
					});
				</script>
				
				<input type="text" name="mem_addr" size="45" value="<%=memberVO.getMem_addr()%>" id="address">
			</td>
		</tr>
		<tr>
			<td>銀行帳戶：</td>
			<td><input type="text" name="bank_acc" size="45" value="<%=memberVO.getBank_acc()%>"></td>
		</tr>
		<tr>
			<td>信用卡號：</td>
			<td><input type="text" name="card_no" size="45" value="<%=memberVO.getCard_no()%>"></td>
		</tr>
		<tr>
			<td>到期年份：</td>
			<td><input type="text" name="card_yy" size="45" value="<%=memberVO.getCard_yy()%>"></td>
		</tr>
		<tr>
			<td>到期月份：</td>
			<td><input type="text" name="card_mm" size="45" value="<%=memberVO.getCard_mm()%>"></td>
		</tr>
		<tr>
			<td>卡片安全碼：</td>
			<td><input type="text" name="card_sec" size="45" value="<%=memberVO.getCard_sec()%>"></td>
		</tr>
		<tr>
			<td>會員權限：</td>
			<td>
				<select name="mem_autho">
					<option value="0" ${memberVO.mem_autho eq 0 ? "selected" : ""}>停權</option>
					<option value="1" ${memberVO.mem_autho eq 1 ? "selected" : ""}>一般會員</option>
					<option value="2" ${memberVO.mem_autho eq 2 ? "selected" : ""}>賣家資格會員</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>紅利點數：</td>
			<td><input type="text" name="mem_bonus" size="45" value="<%=memberVO.getMem_bonus()%>"></td>
		</tr>
		<tr>
			<td>加入時間：</td>
			<td><input type="text" name="mem_joindat" size="45" id="f_date1"></td>
		</tr>
		<tr>
			<td>會員生日：</td>
			<td><input type="text" name="mem_birth" size="45" id="f_date2"></td>
		</tr>
		<tr>
			<td>警告次數：</td>
			<td><input type="text" name="mem_warn" size="45" value="<%=memberVO.getMem_warn()%>"></td>
		</tr>
		
	</table>
	<br>
	<input type="hidden" name="action" value="update-front">
	<input type="hidden" name="mem_id" value="<%=memberVO.getMem_id()%>">
	<input type="hidden" name="mem_email" value="<%=memberVO.getMem_email()%>">
	<input type="submit" value="送出修改">
</form>













    <!-- 內容 ---end  -->


        <!-- footer -->
        <footer id="footer" class="pt-5 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5>快速連結</h4>
                        <ul>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/index.jsp">S.F.G首頁</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/member/addMember.jsp">註冊會員</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">商城</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">團購</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">會員互動</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">競標區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">直購區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="<%=request.getContextPath()%>/front-end/post/select_page.jsp">討論區</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">聊天室</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">關於我們</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">關於S.F.G</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">最新消息</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">隱私權政策</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6 footer-list">
                        <h5 class="text-uppercase">技術支援</h5>
                        <ul>
                            <li>
                                <a class="footer-link" href="">新手上路</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">幫助&支援</a>
                            </li>
                            <li>
                                <a class="footer-link" href="">服務條款</a>
                            </li>
                        </ul>                    
                    </div>
                </div>
            </div>

            <div class="footer-end bg-dark mt-5 py-2">
                <p class="text-center">&copy; Copy right 2020</p>
            </div>
        </footer>

        <button id="chatBtn" class="bg-primary">
            <i class="fas fa-comments"></i>
        </button>

</body>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/files/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=memberVO.getMem_joindat()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        $('#f_date2').datetimepicker({
            theme: '',              //theme: 'dark',
  	       timepicker:false,       //timepicker:true,
  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
  		   value: '<%=memberVO.getMem_birth()%>', // value:   new Date(),
            //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
            //startDate:	            '2017/07/10',  // 起始日
            //minDate:               '-1970-01-01', // 去除今日(不含)之前
            //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
         });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
        function init() {
        var display = document.getElementById("display");
        var upload = document.getElementById("upload");

        upload.addEventListener("change", function(e){
            var files = upload.files;
            if (files && files[0]) {
                for (i = 0; i < files.length; i ++) {
                    if (files[i].type.indexOf("image") < 0) {
                        alert("上傳的格式不符");
                        upload.value = null;
                    } else {
                        var file = files[i];
                        var reader = new FileReader();

                        reader.onload = function(e) {
                            var result = e.target.result;

                            display.setAttribute("src", result);

                        }
                        reader.readAsDataURL(file);
                    }
                }
            }
        });
    }
    window.onload = init;
        
</script>

</html>