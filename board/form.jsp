<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../jslib.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page autoFlush="true" buffer="1094kb"%>

<%@ page import = "java.sql.*"%>
<html>
<head>
<%@ include file="../inc/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<%@ include file="../inc/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
//게시글 공백 확인 유효성 검사
function postCheck(){
	var form = document.form;
	if(!form.title.value){
		alert("제목을 입력해주세요!");
		form.title.focus();
		return;
	}
	if(!form.content.value){
		alert("내용을 입력해주세요!");
		form.content.focus();
		return;
	}
	form.submit();
	
}
function callAjax(){
	$.ajax({
        url: "./subselect.jsp",
        data: { t2seq : $("#mainselect option:selected").val()},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        type: "POST",
        dataType : "json" ,
        success:function(msg){
        	//var str = '<option value="">--선택해주세요--</option>';
        	//alert("sss");
	        var $selectid = $('#subselect');
	        //console.log($selectid);
	        $selectid.empty();
	        $.each(msg, function makeSelect(index, item){
	        	$selectid.append('<option value="'+item.t3seq+'">'+item.t3zone3nm+'</option>');
	        });
           
        },
        error:function(jqXHR,textStatus,errorThrown) {
          console.log(jqXHR.status+'\n'+jqXHR.statusText)
        }
     });
}
</script>
<%
try{
	//String sqlList = "SELECT t1.zonenm, t2.zone2nm, t3.zone3nm FROM tb_zone3 as t3 JOIN tb_zone2 as t2 ON t2.seq = t3.seq_zone2 JOIN tb_zone as t1 ON t1.seq = t2.seq_zone WHERE t1.seq = ? ";
	String sqlList = "select t1.zonenm, t2.zone2nm, t2.seq from tb_zone2 as t2 join tb_zone as t1 on t1.seq = t2.seq_zone WHERE t1.seq = ?";
	pstmt = dbconn.prepareStatement(sqlList);
	pstmt.setInt(1, seqZone);
	rs = pstmt.executeQuery();
%>
</head>
<body>
<%@ include file = "../left.jsp" %>
<%@ include file = "../header.jsp" %>
				<div class="well" style="position: relative;">
					<form class="upload" name="form" action="./formAction.jsp" method="post">
						<div class="title-wrapper">
							<h4>글 제목</h4>
							<input type="text" class="title" name="title" placeholder="글 제목을 입력하세요.">
						</div>
						<div class="check-wrapper">	
							<h4>건물 선택</h4>
							<select name= "mainselect" id="mainselect" onchange="callAjax()">
								<option value="">건물을 선택해주세요</option>
								<%	
									while(rs.next()){
										String building = rs.getString("t2.zone2nm");
										int t2seq = rs.getInt("t2.seq");%>
										<option value=<%=t2seq %>><%=building%></option>
									<%	
									}							
								%>
							</select>
							
							<h4>시설 선택</h4>
							<select name="subselect" id="subselect">
								<option value="">시설을 선택해주세요</option>
								<!-- 여기 아래부터 json으로 받아온 데이터 값 뿌려주기 -->
							</select>
						</div>
						<div class="pw">
							<h4>비밀번호 입력</h4>
							<input type="password" name="boardpw" placeholder="비밀번호를 입력하세요.">
						</div>
						<div class="content-wrapper">
						<h4>글 내용</h4>
							<textarea class="memo" name="content" placeholder="글 내용을 입력하세요." rows="30" cols="50"></textarea>
						</div>
						
						
					</form>
				</div><!-- well -->
				
				<div class="button-wrapper">
					<input type="button" value="글쓰기" onclick="postCheck()">
					<input type="button" value="취소" OnClick="javascript:history.back(-1)">
				</div><!-- button-wrapper -->

<%}
catch (Exception e) {
	e.printStackTrace();
}%>									
<%@ include file="../inc/dbclose.jsp"%>