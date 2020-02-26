<%--
  Created by IntelliJ IDEA.
  User: shareit
  Date: 2019-07-18
  Time: 오후 6:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../jslib.jsp" %>
<%@ include file="../inc/islogin.jsp"%>

<html>
<head>

    <%@ include file="../inc/header.jsp" %>

</head>
<body>

    <div class="wrap" id="wrap">
        <%@ include file = "../left.jsp" %>
        <%@ include file = "../header.jsp" %>

        <!-- container -->
        <div class="container-big" id="container">
            <%@ include file = "../popup.jsp" %>
            <!-- here is your code -->
                <div id="content" class="content">
                    <div id="content-outter" class="content-outter">
                        <div id="content-inner" class="content-inner">
                            <div id="top" style="position: relative; float: left; font-family: Demilight; font-size: 2.26rem; font-weight: 300; font-style: normal; font-stretch: normal; line-height: 1.54; letter-spacing: -0.061rem; text-align: left; color: #1a1a1a;">운영관리</div><div class="sub-title">운영정보</div>
                            <div id="middle" style="position: relative; float: left; width: 100%; margin-top: 4rem;">
                                <img id="btn-blue-circle" src="../css/icon/submenu-circle.png" style="position: absolute; float: left; height: 0.5rem; top:0.5rem; left: 0.5%; z-index: 200;"/>
                                <div id="btn-pay" class="btn-selected js-mouse-over-bold" style="width: 10%; height: 2.89rem;" onclick="showData(1);">결제정보</div>
                                <div id="btn-user" class="btn-normal js-mouse-over-bold" style="width: 10%; height: 2.89rem; margin-left: 0.5%;" onclick="showData(2);">사용자 정보</div>
                                <div id="btn-refund" class="btn-normal js-mouse-over-bold" style="width: 10%; height: 2.89rem; margin-left: 0.5%;" onclick="showData(3);">환불 정보</div>
                                <div id="btn-excel" class="btn-normal js-mouse-over-bold" style="width: 10%; height: 2.89rem; margin-left: 0.5%;" onclick="goExcel();">엑셀 다운</div>
                                <div style="position: relative; float: right; width: 24%; margin-left: 0.7%; height: 2.7rem;  border-radius: 4px; border: solid 1px #b3b3b3;">
                                    <div style="position: relative; float: left;width: 30%; height: 100%; border-right: 1px solid #b3b3b3;">
                                        <img src="../css/icon/search.png" style="position: relative; float: left; margin-left: 11%; margin-top: 0.8rem; height: 1.1rem;" onclick="searchTable();"/>
                                        <div style="position:relative; float: right; height: 2.7rem; margin-right: 37%; font-family: Medium; font-size: 1.54rem; font-weight: 500; font-style: normal; font-stretch: normal; line-height: 2.7rem; letter-spacing: -0.083rem; color: #5e5e5e;">검색</div>
                                    </div>
                                    <input id="search-string" class="input-search" style="position: relative; width: 65.9%; height: 100%; margin-left: 3%; border: 0;" onkeydown="enterkey();">

                                </div>
                                <div style="position: relative; float: right; width: 14%; height: 2.89rem; border-radius: 4px; background-color: #f2f2f2;">
                                    <img id="popup-arrow" src="../css/icon/downArrow3.png" style="position: relative; float: right; margin-right: 7.5%; margin-top: 0.8rem; height: 1.3rem; cursor: pointer;" onclick="showPopup();"/>
                                    <div id="search-option" class="js-mouse-over-bold" style="position: relative; float: left; height: 2.89rem; margin-left: 13%; line-height: 2.89rem; font-family: Medium; font-size: 1.54rem; letter-spacing: -0.083rem; color: #333333; cursor: pointer;" onclick="showPopup();">날짜 검색</div>

                                    <%@ include file = "../popupNoBackground.jsp" %>

                                </div>
                            </div>

                            <%@ include file="./detailPopup.jsp" %>

                            <div id="bottom" style="position: relative; float: left; width: 100%; height: 80%; margin-top: 2.8rem;">
                                <div id="tableList" style="position: relative; width: 100%; height: 10%;">
                                    <div id="table-head-pay" class="hide" style="position: relative; width: 100%; height: 100%; border-top: 1px solid #f2f2f2; border-bottom: 1px solid #f2f2f2;">
                                        <div class="table-head DEFAULT js-head" style="width: 15.6%; " onclick="sortItem('day', this, 1);">날짜</div>
                                        <div class="table-head DEFAULT js-head" style="width: 12.4%; height: 48%; padding-top: 1.2%; padding-bottom: 1%;">호스트</div>
                                        <div class="table-head DEFAULT js-head" style="width: 15.9%;" onclick="sortItem('zone2nm', this, 1);">건물</div>
                                        <div class="table-head DEFAULT js-head" style="width: 15.4%; " onclick="sortItem('zone3nm', this, 1);">시설</div>
                                        <div class="table-head DEFAULT js-head" style="width: 16%; " onclick="sortItem('clubnm', this, 1);">커뮤니티</div>
                                        <div class="table-head DEFAULT js-head" style="width: 11.8%; " onclick="sortItem('price', this, 1);">가격</div>
                                        <div class="table-head DEFAULT js-head" style="width: 12.1%; " onclick="sortItem('status', this, 1);">상태</div>
                                    </div>

                                    <div id="table-head-user" class="hide" style="position: relative; width: 100%; height: 100%; border-top: 1px solid #f2f2f2; border-bottom: 1px solid #f2f2f2;">
                                        <div class="table-head DEFAULT js-head" style="width: 15.6%; " onclick="sortItem('day', this, 2);">날짜</div>
                                        <div class="table-head DEFAULT js-head" style="width: 12.4%; ">호스트</div>
                                        <div class="table-head DEFAULT js-head" style="width: 15.9%; " onclick="sortItem('zone2nm', this, 2);">건물</div>
                                        <div class="table-head DEFAULT js-head" style="width: 12.4%; " onclick="sortItem('zone3nm', this, 2);">시설</div>
                                        <div class="table-head DEFAULT js-head" style="width: 16%; " onclick="sortItem('clubnm', this, 2);">커뮤니티</div>
                                        <div class="table-head DEFAULT js-head" style="width: 11.8%; " onclick="sortItem('uname', this, 2);">이름</div>
                                        <div class="table-head DEFAULT js-head" style="width: 15.1%; " onclick="sortItem('cDay', this, 2);">출석시간</div>
                                    </div>

                                    <div id="table-head-refund" class="hide" style="position: relative; width: 100%; height: 100%; border-top: 1px solid #f2f2f2; border-bottom: 1px solid #f2f2f2;">
                                        <div class="table-head DEFAULT js-head" style="width: 15.6%;" onclick="sortItem('day', this, 3);">날짜</div>
                                        <div class="table-head DEFAULT js-head" style="width: 12.4%;">호스트</div>
                                        <div class="table-head DEFAULT js-head" style="width: 15.9%;" onclick="sortItem('zone2nm', this, 3);">건물</div>
                                        <div class="table-head DEFAULT js-head" style="width: 12.4%;" onclick="sortItem('zone3nm', this, 3);">시설</div>
                                        <div class="table-head DEFAULT js-head" style="width: 16%;" onclick="sortItem('clubnm', this, 3);">커뮤니티</div>
                                        <div class="table-head DEFAULT js-head" style="width: 11.8%;" onclick="sortItem('price', this, 3);">가격</div>
                                        <div class="table-head DEFAULT js-head" style="width: 15.1%;" onclick="sortItem('status', this, 3);">상태</div>
                                    </div>
                                    <%--257.8--%>
                                    <%--204.67--%>
                                    <%--261.74--%>
                                    <%--204.67--%>
                                    <%--264.7--%>
                                    <%--194.8--%>
                                    <%--249--%>

                                    <%--4.33--%>
                                    <%--595.8--%>
                                    <div id="table-content" style="position: relative; float: left; width: 100%; height: 810%;">
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 2.53rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                        <%--<div style="position: relative; width: 100%; float:left; margin-top: 4.33rem;">--%>
                                            <%--<div class="table-content FR" style="width: 15.6%;">2019.06 02 08:00~10:00</div>--%>
                                            <%--<div class="table-content FR" style="width: 12.4%;">경기대학교</div>--%>
                                            <%--<div class="table-content FR" style="width: 15.9%;">체육대학 운동장1</div>--%>
                                            <%--<div class="table-content FM" style="width: 12.4%; color: #0050a4;">대운동장</div>--%>
                                            <%--<div class="table-content FR" style="width: 16%;">수지다이나믹스</div>--%>
                                            <%--<div class="table-content FR" style="width: 11.8%;">60,000</div>--%>
                                            <%--<div class="table-content FM" style="width: 15.1%; color: #0050a4;">결제완료</div>--%>
                                        <%--</div>--%>
                                    </div>
                                    <div id="paginate" style="position: relative; float: left; width: 100%; height: 5%; text-align: center;">
                                        <%--&lt;%&ndash;<div class="paginate-img">&ndash;%&gt;--%>
                                        <%--<img class="paginate-img" src="../css/icon/leftArrow.png" style="height: 1.5rem; margin-bottom: 0.3rem;">--%>
                                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                        <%--&lt;%&ndash;<div class="paginate-img" style="width: 5.5%; margin-left: 1%;">&ndash;%&gt;--%>
                                        <%--<img class="paginate-img" src="../css/icon/leftArrow2.png" style="height: 1.5rem; margin-bottom: 0.3rem;">--%>
                                        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                        <%--<div class="paginate-text" style="margin-left: 14%;">1</div>--%>
                                        <%--<div class="paginate-text">2</div>--%>
                                        <%--<div class="paginate-text">3</div>--%>
                                        <%--<div class="paginate-text">4</div>--%>
                                        <%--<div class="paginate-text" style="margin-right: 14%;">5</div>--%>

                                        <%--<div class="paginate-img" style="width: 5.5%; margin-right: 1%;">--%>
                                        <%--<img src="../css/icon/rightArrow2.png" style="height: 1.5rem; margin-bottom: 0.3rem;">--%>
                                        <%--</div>--%>
                                        <%--<div class="paginate-img">--%>
                                        <%--<img src="../css/icon/rightArrow.png" style="height: 1.5rem; margin-bottom: 0.3rem;">--%>
                                        <%--</div>--%>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
        </div>
        <!-- // container -->
    </div>

    <input id="now-page" value="1" type="hidden"/>

</body>
</html>

<script>

  $(document).ready(function() {
    doUncheckImg();
    $('#left-manage-sub').removeClass('hide');
    $('.js-left-menu-3 > .left-title').css('color', '#333333');
    $('.js-left-menu-3 > .left-title').css('font-family', 'Bold');
    $('#bullet-31').removeClass('hide');
    $('#menu-31').css('color', '#333333');
    $('#img-3').attr('src','../css/icon/check_control.png');
  });

  $(document).on('click','.js-table-detail',function () {

    var category = $(this).attr('id').split('-')[0];
    var seq = $(this).attr('id').split('-')[1];

    if(category === 'pay'){
      showPopupTest('../pay/payDetail.jsp?parameter1='+seq,'','pay-detail');

    }else if(category === 'refund'){

      showPopupTest('../pay/refundDetail.jsp?parameter1='+seq,'','refund-detail');

    }else if(category === 'user'){

      showPopupTest('../user/userDetail.jsp?parameter1='+seq,'','user-detail');

    }

  });

  $(document).mouseup(function (e) {

    if($('#popup-arrow').is(e.target)){

    }else if($('#search-option').is(e.target)){

    }else{

      var $container = $('.js-popup-content');
      if (!$container.is(e.target) && $container.has(e.target).length === 0){

        if(!($container.hasClass('hide'))){
          hidePopup();
        }

      }
    }
  });


    var originJson = null;
    var workJson = null;
    var totalPage = 0;
    var countPage = 5;
    var countList = 8;

    $(document).on('click','.js-page',function () {

      var page = $(this).attr('id').split('-')[1];
      var num = $(this).attr('id').split('-')[2];

      if( page === 'pay' ) {

        payTable2(num);

      } else if ( page === 'user' ) {

        userTable2(num);

      } else if( page === 'refund' ) {

        refundTable2(num);

      }

    });



    payTable();
    // userTable(1);


    function payTable() {
      LoadingWithMask('loading_blocks.gif', 35);
      $.ajax({
        url : '../pay/payRead.jsp',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType :'json',
        success:function (data) {

          originJson = data.slice();
          // originJson = clone(data);
          workJson = data.slice();
          // workJson = clone(data);

          totalPage = parseInt((originJson.length) / countList);
          if ((originJson.length) % countList > 0) {
            totalPage++;
          }

          payTable2(1);

        },
        error:function(jqXHR,textStatus,errorThrown) {

          alert(jqXHR.status+'\n'+jqXHR.statusText);
          closeLoadingWithMask();
        }
      });
    }

    function payTable2(cpage) {
      var $content = $('#table-content');
      var $page = $('#paginate');

      $('#table-head-pay').removeClass('hide');
      $content.empty();

      for(var i = (8 * cpage - 8); i <= Math.min(8 * cpage - 1, workJson.length - 1); ++i){

        $content.append(
            '<div id="pay-'+workJson[i].seq+'" class="js-table-detail" style="position: relative; width: 100%; float:left; height: 11%; cursor: pointer;">'
            + '<div class="table-content FR" style="width: 15.6%; ">'+workJson[i].day+' '+workJson[i].time+'</div>'
            + '<div class="table-content FR" style="width: 12.4%; ">'+workJson[i].zonenm+'</div>'
            + '<div class="table-content FR" style="width: 15.9%; ">'+workJson[i].zone2nm+'</div>'
            + '<div class="table-content FM" style="width: 15.4%; color: #0050a4;">'+workJson[i].zone3nm+'</div>'
            + '<div class="table-content FR" style="width: 16%; ">'+workJson[i].clubnm+'</div>'
            + '<div class="table-content FR" style="width: 11.8%; ">'+addComma(workJson[i].price)+'</div>'
            + '<div class="table-content FM" style="width: 12.1%; color: '+changeTextColor(workJson[i].status)+'">'+workJson[i].status+'</div>'
            + '</div>');

      }

      var startPage = (parseInt((cpage - 1) / countPage)) * countPage + 1;
      var endPage = startPage + countPage - 1;

      if (endPage > totalPage) {
        endPage = totalPage;
      }

      $page.empty();
      $page.append('<div id="pageFirst-pay-1" class="paginate-img js-page">'
          + '<img src="../css/icon/leftArrow.png" style="height: 1.5rem;">'
          + '</div>'
          + '<div id="pagePrev-pay-'+(startPage === 1 ? 1 : startPage - 1)+'" class="paginate-img js-page" style="margin-left: 0.3%; margin-right: 3%;">'
          + '<img src="../css/icon/leftArrow2.png" style="height: 1.5rem;">'
          + '</div>');

      for(var i = startPage ; i <= endPage; ++i) {

        $page.append('<div id="page-pay-'+i+'" class="paginate-text js-page" style="margin-left:'+(i===startPage?"0%":"1%")+';">'+i+'</div>');

      }

      $('#page-pay-'+cpage).css('color','#0050a4');
      $('#page-pay-'+cpage).css('border','1px solid #f2f2f2');

      $page.append('<div id="pageNext-pay-'+(endPage === totalPage ? endPage : endPage + 1)+'" class="paginate-img js-page" style="margin-left: 3%; margin-right: 0.3%;">'
          + '<img src="../css/icon/rightArrow2.png" style="height: 1.5rem;">'
          + '</div>'
          + '<div id="pageLast-pay-'+totalPage+'" class="paginate-img js-page">'
          + '<img src="../css/icon/rightArrow.png" style="height: 1.5rem; ">'
          + '</div>');
      closeLoadingWithMask();
    }

    function searchPay() {

      var str = $('#search-string').val().trim();
      var coption = $('#search-option').text();

      if(str === ""){
        workJson = originJson.slice();
        // workJson = clone(originJson);
        totalPage = parseInt((originJson.length) / countList);
        if ((originJson.length) % countList > 0) {
          totalPage++;
        }
        payTable2(1);
        return;
      }

      var option = 0;
        if(coption === '날짜 검색'){
          option = 1;
          str = replaceAll(str,"/",".");
          str = replaceAll(str,":",".");
          str = replaceAll(str,".",".");
          str = replaceAll(str,"-",".");
        }else if(coption === '건물 검색'){
          option = 2;
        }else if(coption === '시설 검색'){
          option = 3;
        }else if(coption === '커뮤니티 검색'){
          option = 4;
        }else if(coption === '가격 검색'){
          option = 5;
        }else if(coption === '상태 검색'){
          option = 6;
        }

      var aJsonArray = [];

        for(var i = 0; i < originJson.length; ++i){
          switch (option) {
            case 1: if(originJson[i].day.indexOf(str) !== -1){
              aJsonArray.push(originJson[i]);
            } break;
            case 2:if(originJson[i].zone2nm.indexOf(str) !== -1){
              aJsonArray.push(originJson[i]);
            } break;
            case 3:if(originJson[i].zone3nm.indexOf(str) !== -1){
              aJsonArray.push(originJson[i]);
            } break;
            case 4:if(originJson[i].clubnm.indexOf(str) !== -1){
              aJsonArray.push(originJson[i]);
            } break;
            case 5:if(replaceAll(originJson[i].price,",","").indexOf(str) !== -1){
              aJsonArray.push(originJson[i]);
            } break;
            case 6:if(originJson[i].status.indexOf(str) !== -1){
              aJsonArray.push(originJson[i]);
            } break;
          }
        }
      workJson = aJsonArray.slice();
      // workJson = clone(aJsonArray);
      totalPage = parseInt((workJson.length) / countList);
      if ((workJson.length) % countList > 0) {
        totalPage++;
      }

      payTable2(1);
    }

    function userTable() {
      LoadingWithMask('loading_blocks.gif', 35);
      $.ajax({
        url : '../user/userRead.jsp',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType :'json',
        success:function (data) {

          originJson = data.slice();
          // originJson = clone(data);
          workJson = data.slice();
          // workJson = clone(data);

          totalPage = parseInt((originJson.length) / countList);
          if ((originJson.length) % countList > 0) {
            totalPage++;
          }

          userTable2(1);

        },
        error:function(jqXHR,textStatus,errorThrown) {

          alert(jqXHR.status+'\n'+jqXHR.statusText);
          closeLoadingWithMask();
        }
      });
    }


    function userTable2(cpage) {

      var $content = $('#table-content');
      var $page = $('#paginate');

      $('#table-head-user').removeClass('hide');
      $content.empty();

      for(var i = (8 * cpage - 8); i <= Math.min(8 * cpage - 1, workJson.length - 1); ++i){

        $content.append(
              '<div id="user-'+workJson[i].seq+'" class="js-table-detail" style="position: relative; width: 100%; float:left; height : 11%; cursor: pointer;">'
              + '<div class="table-content FR" style="width: 15.6%;">'+workJson[i].day+' '+workJson[i].time+'</div>'
              + '<div class="table-content FR" style="width: 12.4%; ">'+workJson[i].zonenm+'</div>'
              + '<div class="table-content FR" style="width: 15.9%; ">'+workJson[i].zone2nm+'</div>'
              + '<div class="table-content FM" style="width: 12.4%;  color: #0050a4;">'+workJson[i].zone3nm+'</div>'
              + '<div class="table-content FR" style="width: 16%; ">'+workJson[i].clubnm+'</div>'
              + '<div class="table-content FR" style="width: 11.8%; ">'+workJson[i].uname+'</div>'
              + '<div class="table-content FM" style="width: 15.1%; ">'+workJson[i].cDay+' '+workJson[i].cTime+'</div>'
              + '</div>');

      }

      var startPage = (parseInt((cpage - 1) / countPage)) * countPage + 1;
      var endPage = startPage + countPage - 1;

      if (endPage > totalPage) {
        endPage = totalPage;
      }

      $page.empty();
      $page.append('<div id="pageFirst-user-1" class="paginate-img js-page">'
          + '<img src="../css/icon/leftArrow.png" style="height: 1.5rem;">'
          + '</div>'
          + '<div id="pagePrev-user-'+(startPage === 1 ? 1 : startPage - 1)+'" class="paginate-img js-page" style="margin-left: 0.3%; margin-right: 3%;">'
          + '<img src="../css/icon/leftArrow2.png" style="height: 1.5rem;">'
          + '</div>');

      for(var i = startPage ; i <= endPage; ++i) {

        $page.append('<div id="page-user-'+i+'" class="paginate-text js-page" style="margin-left:'+(i===startPage?"0%":"1%")+';">'+i+'</div>');

      }

      $('#page-user-'+cpage).css('color','#0050a4');
      $('#page-user-'+cpage).css('border','1px solid #f2f2f2');

      $page.append('<div id="pageNext-user-'+(endPage === totalPage ? endPage : endPage + 1)+'" class="paginate-img js-page" style="margin-left: 3%; margin-right: 0.3%;">'
          + '<img src="../css/icon/rightArrow2.png" style="height: 1.5rem;">'
          + '</div>'
          + '<div id="pageLast-user-'+totalPage+'" class="paginate-img js-page">'
          + '<img src="../css/icon/rightArrow.png" style="height: 1.5rem; ">'
          + '</div>');
      closeLoadingWithMask();
    }

    function searchUser() {

      var str = $('#search-string').val().trim();
      var coption = $('#search-option').text();

      if(str === ""){
        workJson = originJson.slice();
        // workJson = clone(originJson);
        totalPage = parseInt((originJson.length) / countList);
        if ((originJson.length) % countList > 0) {
          totalPage++;
        }
        userTable2(1);
        return;
      }

      var option = 0;
      if(coption === '날짜 검색'){
        option = 1;
        str = replaceAll(str,"/",".");
        str = replaceAll(str,":",".");
        str = replaceAll(str,".",".");
        str = replaceAll(str,"-",".");
      }else if(coption === '건물 검색'){
        option = 2;
      }else if(coption === '시설 검색'){
        option = 3;
      }else if(coption === '커뮤니티 검색'){
        option = 4;
      }else if(coption === '이름 검색'){
        option = 5;
      }

      var aJsonArray = [];

      for(var i = 0; i < originJson.length; ++i){
        switch (option) {
          case 1: if(originJson[i].day.indexOf(str) !== -1){
            aJsonArray.push(originJson[i]);
          } break;
          case 2:if(originJson[i].zone2nm.indexOf(str) !== -1){
            aJsonArray.push(originJson[i]);
          } break;
          case 3:if(originJson[i].zone3nm.indexOf(str) !== -1){
            aJsonArray.push(originJson[i]);
          } break;
          case 4:if(originJson[i].clubnm.indexOf(str) !== -1){
            aJsonArray.push(originJson[i]);
          } break;
          case 5:if(originJson[i].uname.indexOf(str) !== -1){
            aJsonArray.push(originJson[i]);
          } break;
        }
      }
      workJson = aJsonArray.slice();
      // workJson = clone(aJsonArray);
      totalPage = parseInt((workJson.length) / countList);
      if ((workJson.length) % countList > 0) {
        totalPage++;
      }

      userTable2(1);
    }

    function refundTable() {
      LoadingWithMask('loading_blocks.gif', 35);
      $.ajax({
        url : '../pay/refundRead.jsp',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType :'json',
        success:function (data) {

          originJson = data.slice();
          // originJson = clone(data);
          workJson = data.slice();
          // workJson = clone(data);

          totalPage = parseInt((originJson.length) / countList);
          if ((originJson.length) % countList > 0) {
            totalPage++;
          }

          refundTable2(1);

        },
        error:function(jqXHR,textStatus,errorThrown) {

          alert(jqXHR.status+'\n'+jqXHR.statusText);
          closeLoadingWithMask();

        }
      });
    }

    function refundTable2(cpage) {

      var $content = $('#table-content');
      var $page = $('#paginate');


      $('#table-head-refund').removeClass('hide');
      $content.empty();

      for(var i = (8 * cpage - 8); i <= Math.min(8 * cpage - 1, workJson.length - 1); ++i){

        $content.append(
              '<div id="refund-'+workJson[i].seq+'" class="js-table-detail" style="position: relative; width: 100%; float:left; height : 11%;cursor: pointer;">'
              + '<div class="table-content FR" style="width: 15.6%; ">'+workJson[i].day+' '+workJson[i].time+'</div>'
              + '<div class="table-content FR" style="width: 12.4%; ">'+workJson[i].zonenm+'</div>'
              + '<div class="table-content FR" style="width: 15.9%; ">'+workJson[i].zone2nm+'</div>'
              + '<div class="table-content FM" style="width: 12.4%; color: #0050a4;">'+workJson[i].zone3nm+'</div>'
              + '<div class="table-content FR" style="width: 16%;">'+workJson[i].clubnm+'</div>'
            + '<div class="table-content FR" style="width: 11.8%; ">' + addComma(
            workJson[i].refundPrice) + '</div>'
              + '<div class="table-content FM" style="width: 15.1%; color: '+changeTextColor(workJson[i].status)+'">'+workJson[i].status+'</div>'
              + '</div>');
      }

      var startPage = (parseInt((cpage - 1) / countPage)) * countPage + 1;
      var endPage = startPage + countPage - 1;

      if (endPage > totalPage) {
        endPage = totalPage;
      }

      $page.empty();
      $page.append('<div id="pageFirst-refund-1" class="paginate-img js-page">'
          + '<img src="../css/icon/leftArrow.png" style="height: 1.5rem;">'
          + '</div>'
          + '<div id="pagePrev-refund-'+(startPage === 1 ? 1 : startPage - 1)+'" class="paginate-img js-page" style="margin-left: 0.3%;margin-right: 3%;">'
          + '<img src="../css/icon/leftArrow2.png" style="height: 1.5rem;">'
          + '</div>');

      for(var i = startPage ; i <= endPage; ++i) {

        $page.append('<div id="page-refund-'+i+'" class="paginate-text js-page" style="margin-left:'+(i===startPage?"0%":"1%")+';">'+i+'</div>');

      }

      $('#page-refund-'+cpage).css('color','#0050a4');
      $('#page-refund'+cpage).css('border','1px solid #f2f2f2');

      $page.append('<div id="pageNext-refund-'+(endPage === totalPage ? endPage : endPage + 1)+'" class="paginate-img js-page" style="margin-left: 3%; margin-right: 0.3%;">'
          + '<img src="../css/icon/rightArrow2.png" style="height: 1.5rem;">'
          + '</div>'
          + '<div id="pageLast-refund-'+totalPage+'" class="paginate-img js-page">'
          + '<img src="../css/icon/rightArrow.png" style="height: 1.5rem; ">'
          + '</div>');

      closeLoadingWithMask();
    }

    function searchRefund() {

      var str = $('#search-string').val().trim();
      var coption = $('#search-option').text();

      if(str === ""){
        workJson = originJson.slice();
        // workJson = clone(originJson);
        totalPage = parseInt((originJson.length) / countList);
        if ((originJson.length) % countList > 0) {
          totalPage++;
        }
        refundTable2(1);
        return;
      }

      var option = 0;
      if(coption === '날짜 검색'){
        option = 1;
        str = replaceAll(str,"/",".");
        str = replaceAll(str,":",".");
        str = replaceAll(str,".",".");
        str = replaceAll(str,"-",".");
      }else if(coption === '건물 검색'){
        option = 2;
      }else if(coption === '시설 검색'){
        option = 3;
      }else if(coption === '커뮤니티 검색'){
        option = 4;
      }else if(coption === '가격 검색'){
        option = 5;
      }else if(coption === '상태 검색'){
        option = 6;
      }

      var aJsonArray = [];

            for(var i = 0; i < originJson.length; ++i){
              switch (option) {
                case 1: if(originJson[i].day.indexOf(str) !== -1){
                  aJsonArray.push(originJson[i]);
                } break;
                case 2:if(originJson[i].zone2nm.indexOf(str) !== -1){
                  aJsonArray.push(originJson[i]);
                } break;
                case 3:if(originJson[i].zone3nm.indexOf(str) !== -1){
                  aJsonArray.push(originJson[i]);
                } break;
                case 4:if(originJson[i].clubnm.indexOf(str) !== -1){
                  aJsonArray.push(originJson[i]);
                } break;
                case 5:if(replaceAll(originJson[i].price,",","").indexOf(str) !== -1){
                  aJsonArray.push(originJson[i]);
                } break;
                case 6:if(originJson[i].status.indexOf(str) !== -1){
                  aJsonArray.push(originJson[i]);
          } break;
        }
      }

      workJson = aJsonArray.slice();
      // workJson = clone(aJsonArray);
      totalPage = parseInt((workJson.length) / countList);
      if ((workJson.length) % countList > 0) {
        totalPage++;
      }

      refundTable2(1);
    }


  function changeTextColor(param) {
    if(param === '환불승인' || param === '결제완료') {
      return '#0050a4;';
    } else {
      return '#5e5e5e;';
    }
  }

   function showData(param) {
      var $now = $('#now-page');

     hidePopup();
     hideAllTable();
     changeBtnColor(param);
     tableHeadDefault();

     $('#search-option').text('날짜 검색');
     $('#search-string').val('');
     if( param === 1 ) {

       $now.val(1);
       payTable();

     } else if ( param === 2 ) {

       $now.val(2);
       userTable();

     } else if ( param === 3 ) {

       $now.val(3);
       refundTable();

     }
   }

    function hideAllTable() {
      var $tablePay = $('#table-head-pay');
      var $tableUser = $('#table-head-user');
      var $tableRefund = $('#table-head-refund');

      if(!$tablePay.hasClass('hide') ) {
        $tablePay.addClass('hide');
      }

      if(!$tableUser.hasClass('hide') ) {
        $tableUser.addClass('hide');
      }

      if(!$tableRefund.hasClass('hide') ) {
        $tableRefund.addClass('hide');
      }
    }

   function changeBtnColor(param) {

     changeAllBtnNormal();
     var $btnPay = $('#btn-pay');
     var $btnUser = $('#btn-user');
     var $btnRefund = $('#btn-refund');
     var $btnBlueCircle = $('#btn-blue-circle');


     if( param === 1) {

       $btnBlueCircle.css('left','0.5%');
       $btnPay.removeClass('btn-normal');
       $btnPay.addClass('btn-selected');

     } else if ( param === 2) {

       $btnBlueCircle.css('left','10.9%');
       $btnUser.removeClass('btn-normal');
       $btnUser.addClass('btn-selected');

     } else if ( param === 3 ) {

       $btnBlueCircle.css('left','21.5%');
       $btnRefund.removeClass('btn-normal');
       $btnRefund.addClass('btn-selected');

     }
   }
   function changeAllBtnNormal() {
     var $btnPay = $('#btn-pay');
     var $btnUser = $('#btn-user');
     var $btnRefund = $('#btn-refund');

     if($btnPay.hasClass('btn-selected') ) {
       $btnPay.removeClass('btn-selected');
       $btnPay.addClass('btn-normal');
     }

     if($btnUser.hasClass('btn-selected') ) {
       $btnUser.removeClass('btn-selected');
       $btnUser.addClass('btn-normal');
     }

     if($btnRefund.hasClass('btn-selected') ) {
       $btnRefund.removeClass('btn-selected');
       $btnRefund.addClass('btn-normal');
     }
   }

    function showPopup() {
      var $popupContent = $('.js-popup-content');
      var $now = $('#now-page');
      var $arrow = $('#popup-arrow');

      if( $popupContent.hasClass('hide') ) {

        $arrow.attr('src','../css/icon/upArrow3.png');
        $popupContent.removeClass('hide');

        var url = './makePopupSearchOption.jsp';
        $popupContent.addClass('popup-control-bg');

        if($now.val() === '1' || $now.val() === '3' ) {

          $popupContent.css('height','24rem');

        } else {

          $popupContent.css('height','21rem');

        }

        $.ajax({
          url: url,
          data: {cpage : $now.val()},
          contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          type: "POST",
          success:function(msg){
            $popupContent.empty();
            $popupContent.html(msg);
          },
          error:function(jqXHR,textStatus,errorThrown) {
            alert(jqXHR.status+'\n'+jqXHR.statusText)
          }
        });

      }else {

        $arrow.attr('src','../css/icon/downArrow3.png');
        $popupContent.removeClass();
        $popupContent.addClass('hide');
        $popupContent.addClass('js-popup-content');

      }
    }

    function hidePopup() {
      var $popupContent = $('.js-popup-content');
      if( !$popupContent.hasClass('hide') ) {
        $('#popup-arrow').attr('src','../css/icon/downArrow3.png');
        $popupContent.removeClass();
        $popupContent.addClass('hide');
        $popupContent.addClass('js-popup-content');
      }
    }

    function searchTable() {
        var tmp = parseInt($('#now-page').val());
        if(tmp === 1) {
            searchPay();
        } else if(tmp === 2 ) {
            searchUser();
        } else if(tmp === 3) {
            searchRefund();
        }
    }

    function goExcel() {
      LoadingWithMask('loading_blocks.gif', 35);
      $.ajax({
        url : './makeExcel.jsp',
        data : {ctitle : parseInt($('#now-page').val()) - 1, jsonData : JSON.stringify(workJson)},
        type : 'POST',
        dataType : 'text',
        success:function (data) {

          var url = './downloadExcel.jsp?cpage=';
          url += $('#now-page').val();
          location.href = url;
          closeLoadingWithMask();

        },
        error:function(jqXHR,textStatus,errorThrown) {

          alert(jqXHR.status+'\n'+jqXHR.statusText);
          closeLoadingWithMask();

        }
      });
    }


    function sortItem(param, data, num) {
      var $obj = $(data);
      if(param==='day'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortBydayDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortBydayASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortBydayASC);
        }
      }else if(param==='zone2nm'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortByzone2nmDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortByzone2nmASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortByzone2nmASC);
        }
      }else if(param==='zone3nm'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortByzone3nmDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortByzone3nmASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortByzone3nmASC);
        }
      }else if(param==='clubnm'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortByclubnmDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortByclubnmASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortByclubnmASC);
        }
      }else if(param==='price'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortBypriceDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortBypriceASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortBypriceASC);
        }
      }else if(param==='uname'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortBynameDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortBynameASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortBynameASC);
        }
      }else if(param==='cDay'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortBycDayDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortBycDayASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortBycDayASC);
        }
      }else if(param==='status'){
        if($obj.hasClass('ASC')){
          $obj.removeClass('ASC');
          $obj.addClass('DESC');
          workJson.sort(sortBystatusDESC);
        }else if($obj.hasClass('DESC')){
          $obj.removeClass('DESC');
          $obj.addClass('ASC');
          workJson.sort(sortBystatusASC);
        }else if($obj.hasClass('DEFAULT')){
          $obj.removeClass('DEFAULT');
          $obj.addClass('ASC');
          workJson.sort(sortBystatusASC);
        }
      }

      if(num === 1){
        payTable2(1);
      }else if(num === 2){
        userTable2(1);
      }else if(num === 3){
        refundTable2(1);
      }
    }

    function tableHeadDefault() {

      var $obj = $('.js-head');

      for(var i=0;i<$obj.length;++i){
        var $ob = $($obj[i]);
        if($ob.hasClass('ASC')){
          $ob.removeClass('ASC');
        }
        if($ob.hasClass('DESC')){
          $ob.removeClass('DESC');
        }
        if(!$ob.hasClass('DEFAULT')){
          $ob.addClass('DEFAULT');
        }
      }
    }
  function enterkey() {
    if (window.event.keyCode == 13) {

      // 엔터키가 눌렸을 때 실행할 내용
      searchTable();
    }
  }


</script>
