<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
<link rel="stylesheet" style="text/css" href="./css/mainstyle.css">

</head>
<body>
<%
try{
	//건물구하는sql
	String sqlList = "select t1.seq, t1.zonenm, t2.seq, t2.zone2nm from tb_zone2 as t2 join tb_zone as t1 on t1.seq = t2.seq_zone WHERE t1.seq = ?";
	pstmt = dbconn.prepareStatement(sqlList);
	pstmt.setInt(1, seqZone);
	rs = pstmt.executeQuery();
%>
<%@ include file = "../left.jsp" %>
<%@ include file = "../header.jsp" %>
<div class="main-wrapper"><!-- 전체 공간 -->
	<div class="select-wrapper"><!-- 선택할 때 나오는 공간 -->
		<div class="text-wrapper">
			<br>
			시설선택    
		</div>
		<div class="selectbtn-wrapper">
			<input type="button" value = "선택하기 + " class="selectbtn" name="selectbtn" class="selectbtn">
			<ul class="zone2nm-ul">
			<% 	while(rs.next()){
						String building = rs.getString("t2.zone2nm");//건물
						int t2seq = rs.getInt("t2.seq");%>
						<!-- 건물 -->
				<li id="zone2nm-li" class="zone2nm-li" value=<%=t2seq %>> <%=building%>
					<a href="javascript:;" class="zone2nmA" id="zone2nmA" style="color:black;">
					<img class="rightimg2" src="img/rightimg.png"></a>
				</li>
				<% }%>
			</ul>
			<!-- 층 -->
			<ul class="floor-ul" name="floor-ul" id="floor-ul">
				
			</ul>
			<!-- 시설 -->
			<ul class="zone3nm-ul" name="zone3nm-ul" id="zone3nm-ul">
	
			</ul>
			
			<div class="result-wrapper">
				<!-- 클릭한 결과 나오도록 하기 -->
			</div>
			
		</div><!-- 선택하기 + 버튼 -->

	</div><!-- select-wrapper -->
	<!--  <hr class="hr1">-->
	<div class="btn-wrapper"><!-- 일정 확인 버튼 공간 -->
		<input type="button" value="  일정 확인  " class="checkedbtn" name="checkedbtn" id="checkedbtn" onclick="javascript:;">
	</div>
	<div class="show-wrapper"><!-- 일정확인 버튼 누르면 결과보여줄 공간 -->
		<table class="finalresult">
			   <tr>						  
			  	<th> 건물명 </th>
				<th> 충 </th>
			   	<th> 호수 </th>
				<th> 시설명 </th>
	          </tr>
			<!-- 일정확인 결과 -->
		</table>
	</div><!-- show-wrapper -->
</div>
<script>
//클릭시 드롭다운
//html dom 이 다 로딩된 후 실행된다.
$(document).ready(function(){
	// menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	$(".selectbtn").click(function(){
	   var submenu = $(this).next(".zone2nm-ul");
	   // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	   if( submenu.is(":visible") ){
	       submenu.slideUp();
	   }else{
	       submenu.slideDown();
	   }
	});
	 /*클릭된게 확인 되면 옆 ul보여주기*/
	 $(".zone2nm-li").click(function(){
	 	var submenu2 = $(this).parent(".zone2nm-ul"); //console.log(submenu2);
	 	var submenu3 = $(submenu2).next(".floor-ul");// console.log(submenu3);
	 	/*아이디로 가지고 오는 방법*/
// 	 	var $subMenu3Id = $("#floor-ul");
// 	 	console.log($subMenu3Id);
// 	 	$subMenu3Id.slideDown();
	 	  if( submenu3.is(":visible") ){
// 		      submenu3.slideUp();
// 		      submenu3.slideDown();
		   }else {
		       submenu3.slideDown();
		   }
	 });
	 
	 /*ul외에 다른 곳 클릭하면 전부 ul display:none
	 $('html').click(function(e) {
		if(!$(e.target).hasClass(".select-wrapper")) { 
			alert('영역 밖입니다.'); 
		} 
	});

	 */
});

//결과 값을 누적해줄 배열 선언
//이 배열에는 t3의 seq가 저장 
var arrayResult = [];

$(function(){
		var zone2nmA= "";
		$(".zone2nm-li").on("click",function(){
	 		var zone2nmA= $(this).attr('value');
		 	//alert('건물seq : '+zone2nmA);
			 
		 	$.ajax({
		        url: "./submain.jsp",
		        data: {zone2nmA :zone2nmA},
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        type: "POST",
		        dataType : "json" ,
		        success:function(msg){
			        var $selectid = $('.floor-ul');
			        $selectid.empty();
			        $selectid.append('<li id="all" name="all" class="all"><a href="javascript:;" class="allA" style="color:black;">전체</a></li>');
			        
					$('.all').click(function(){
						$.ajax({
					        url: "./allfloor.jsp",
					        data: {zone2nmA: zone2nmA},
					        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					        type: "POST",
					        dataType : "json" ,
					        success:function(msg){
					        	console.log(msg);
						        var $selectid = $('.result-wrapper');
						        $.each(msg, function makeSelect(index, item){
						        	$selectid.append('<button class="result">'+'<img class="closeimg" src="img/closeimg.png">'+item.t2zone2nm+" 전체  "+'</button>');	    
						        	//클릭했을때 요소 제거
						        	$('.closeimg').click(function() {
						        		$('.result').remove();
						        	});
						        });//each
			      			  },//success
			      			  error:function(jqXHR,textStatus,errorThrown) {
			     			     console.log(jqXHR.status+'\n'+jqXHR.statusText)
			      			  }//error
			      });//ajax
				});//all
					
				
			        $.each(msg, function makeSelect(index, item){
			        	$selectid.append('<li class="floor-li" value="'+item.t3floor+'">'+item.t3floor+" 층"+
			        	'<a href="javascript:;" class="floorA" id="floorA" name="floorA" style="color:black;">'+
			        	'<img class="rightimg2" src="img/rightimg.png">'+'</a>'+'</li>');
			  		});
			       
			    	var zone3nmA= "";
					$(".floor-li").on("click",function(){
							var zone3nmA= $(this).attr('value');
						 	$.ajax({
						        url: "./submain2.jsp",
						        data: {zone3nmA :zone3nmA, zone2nmA: zone2nmA},
						        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						        type: "POST",
						        dataType : "json" ,
						        success:function(msg){
						        	//console.log(msg);
							        var $selectid = $('.zone3nm-ul');
							        $selectid.empty(); 
							        $selectid.append('<li class="all2">'+ '<a href="javascript:;" class="allA2" style="color:black;" >' +
							        				  zone3nmA +' 층 전체'+'</a></li>');
							        $.each(msg, function makeSelect(index, item){
							        	$selectid.append('<li class="zone3nm-li" name="zone3nm-li" id="'+item.t3seq+'">'+
							        					 "("+item.t3id+") "+item.t3zone3nm+
							        	'<a href="javascript:;" class="zone3nmA" id="'+item.t3seq+'" name="zone3nmA" style="color:black;">'+'</a>'+'</li>');
							        });//each
							        
							        
							        /*클릭되면 이미지추가  '<img class="checkimg" src="img/checkimg.png">'+*/
							        $('.zone3nm-li').click(function(){
							        	var result = $(this).attr('id');
							        	$(this).append('<img class="checkimg" src="img/checkimg.png" id="img-'+result+'">');//클릭된 그놈
							        });
							        
							        
							        /*클릭되면 이미지추가  '<img class="checkimg" src="img/checkimg.png">'+*/
							        $('.all2').click(function(){
							        	$(this).append('<img class="checkimg" src="img/checkimg.png">');//클릭된 그놈
							        });
							        
							        /*마지막 시설리스트를 클릭하면 클릭한 값이 배열로 들어간다*/
							        $('.zone3nm-li').click(function(){
							        	var result = $(this).attr('id');
							        	//alert('배열에 들어가는 값 : '+result);
							        	arrayResult.push(result);	
							        	//console.log('배열에 들어간 값 : '+arrayResult);
							        });
							        
							        
									$('.all2').click(function(){
										//alert('alljsajax');
										//선택한 건물의 층의 전체
										$.ajax({
									        url: "./allzone3nm.jsp",
									        data: {zone2nmA: zone2nmA,zone3nmA:zone3nmA},
									        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
									        type: "POST",
									        dataType : "json" ,
									        success:function(msg){
										        var $selectid = $('.result-wrapper');
										        $.each(msg, function makeSelect(index, item){
										        	$selectid.append('<button class="result">'+'<img class="closeimg" src="img/closeimg.png">'
										        			+item.t2zone2nm+" "+item.t3floor+"층  전체  "+'</button>');	    
										        	//클릭했을때 요소 제거                                                                                                                                                                                                                                                                                                                  
										        	$('.closeimg').click(function() {
										        		$('.result').remove();
										        		$('.checkimg').remove();
										        		
										        	});
										        });//each
										    	
							      			  },//success
							      			  error:function(jqXHR,textStatus,errorThrown) {
							     			     console.log(jqXHR.status+'\n'+jqXHR.statusText)
							      			  }//error
							      });//ajax
								});//all2
							        						        
							        	
							        	
							    /*여기서부터 zone3nm까지 누르면 전체 값 보여주는 공간*/
						 		//var result= "";
										$(".zone3nm-li").on("click",function(){
												var seqt3= $(this).attr('id');
										 		//alert('건물:'+zone2nmA+' 층:'+zone3nmA+' 시설 :'+ result);
											    
											 	$.ajax({
											        url: "./submain3.jsp",
											        data: {result :seqt3, zone2nmA: zone2nmA, zone3nmA : zone3nmA},
											        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
											        type: "POST",
											        dataType : "json" ,
											        success:function(msg){
												        var $selectid = $('.result-wrapper');
												        $.each(msg, function makeSelect(index, item){
												        	//클릭한 값 나오게 띄워주기
												        	console.log(msg);
												        	$selectid.append('<button class="result" id="selected-'+seqt3+'">'+
												        					 '<img class="closeimg" src="img/closeimg.png" id="img-'+seqt3+'">'+
												        					  item.t2zone2nm+" "+item.t3floor+"층  "+item.t3zone3nm+'</button>');	
												        	
												        	//클릭했을때 요소 제거
												        	$('.closeimg').click(function() {
												        		//1.버튼클릭시 아래 버튼 결과 삭제
												        		var result2 = $(this).attr('id');
												        		var result3 = result2.split('-')[1];//seqt3
												        		$('#selected-'+result3).remove();
												        		//2.체크이미지 삭제
												        		$('#img-'+result3+'.checkimg').remove();
												        		//3.배열에 들어간 값이 지우기버튼과 동일 한 값 클릭시 삭제
												        		//지우기 이미지 누른 값 배열에서 지워주기 이미지 id(result2)와 zone3nm-li의 li값이 같은 것
												        		for(var i = 0; i<arrayResult.length;i++){
												        			if(arrayResult[i]==result3){
													      				arrayResult.splice(i,1);
													      			}//if
												        		}//for
												        	});
												        });//each
												        
												   //중복처리해주기(결과버튼과 클릭한 값이 같을 때 이미지 나오지 않게)
												   $('.zone3nm-li').click(function(){
													   var zone3nmli = $(this).attr('id');
													   var noimg = $('.result').attr('id');
													   var noimg2 = noimg.split('-')[1];
													   var chkimg = $('.closeimg').attr('id');
													   var chkimg2 = chkimg.split('-')[1];
													   for(var i = 0; i<arrayResult.length;i++){
												   	   if(zone3nmli==noimg2){
												   			alert("이미 선택하신 필터입니다.");
												   			$('#selected-'+chkimg2).remove();
												   			$('#img-'+chkimg2+'.checkimg').remove();//이미지 가장 최근에 누른것만 삭제
												   			arrayResult.splice(i,1);
											        		}//if
												   		}//for
												   });
												
												        
									        },//success
									        error:function(jqXHR,textStatus,errorThrown) {
									          console.log(jqXHR.status+'\n'+jqXHR.statusText)
									        }//error
									      });//ajax
										});
										
										/*일정확인 누르면 table로 일정 보여주기*/
										$(".checkedbtn").on("click",function(){

											 	$.ajax({
											        url: "./callResult.jsp",
											        traditional : true,//배열 보내주려고 사용
											        data: {arrayResult:arrayResult},
											        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
											        type: "POST",
											        dataType : "json" ,
											        success:function(msg){
												        var $selectid = $('.finalresult');
												    
												        $.each(msg, function makeSelect(index, item){
												        	//일정확인 한 값 나오게
												        	$selectid.append('<tr>'+
												        						'<td>'+item.t2zone2nm+'</td>'+
												        						'<td>'+item.t3floor+"층  "+'</td>'+
												        						'<td>'+item.t3id+"호  "+'</td>'+
												        						'<td>'+item.t3zone3nm+'</td>'+
												        					  '</tr>');	
												        });//each
									        },//success
									        error:function(jqXHR,textStatus,errorThrown) {
									          console.log(jqXHR.status+'\n'+jqXHR.statusText)
									        }//error
									      });//ajax
										});   
							        
						        },//success
						        error:function(jqXHR,textStatus,errorThrown) {
						          console.log(jqXHR.status+'\n'+jqXHR.statusText)
						        }//error
						     });//ajax
					});
					
								
									
					/*'<img class="checkimg" src="img/checkimg.png">'*/
					
			        /*클릭된게 확인 되면 마지막 ul보여주기*/
			   	 $(".floor-li").click(function(){
			   	 	var submenu4 = $(this).parent(".floor-ul"); console.log(submenu4);
			   	 	var submenu5 = $(submenu4).next(".zone3nm-ul"); console.log(submenu5);
			    	  	if(submenu5.is(":visible") ){
			   	 		   //submenu5.slideUp();
			   		   }else {
			   		       submenu5.slideDown();
			   		   }
			   	 });//click
			   	 
			   	 /*zone3nm-li클릭하면 체크 이미지나오게
		         $(".zone3nm-li").click(function(){
		        	 $('.checkimg').css("display","");
		         }); */
			   	 
		        },//success
		        error:function(jqXHR,textStatus,errorThrown) {
		          console.log(jqXHR.status+'\n'+jqXHR.statusText)
		        }
		     });//ajax
		});
});	//function



</script>
</body>
</html>
<%}
catch (Exception e) {
	e.printStackTrace();
}%>									
<%@ include file="../inc/dbclose.jsp"%>