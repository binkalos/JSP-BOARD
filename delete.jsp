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
<%@ include file="../inc/header.jsp" %>
<script>
function deleteCheck(){
	var form = document.deleteform;
	
	if(!form.boardpw.value){
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return;
	}
	form.submit();
}
</script>
 <%
 	int idx = Integer.parseInt(request.getParameter("idx"));
 %>
 <head>

 <title>게시판</title>
 </head>
 <body>
<%@ include file = "../left.jsp" %>
<%@ include file = "../header.jsp" %>
<table>
	<form name="deleteform" method="post" action="deleteAction.jsp?idx=<%=idx%>"">
		<tr>
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" border="0">
					<tr style="text-align:center;">
      					<td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
     				    <td>삭제</td>
      					<td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
    		 		</tr>
				</table>
				
				<table>
					<tr>
      					<td>&nbsp;</td>
     					<td align="center">비밀번호</td>
      					<td><input name="boardpw" type="password" size="50" maxlength="100"></td>
      					<td>&nbsp;</td>
     				</tr>
     				<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     				<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     				<tr align="center">
      					<td>&nbsp;</td>
      					<td colspan="2"><input type=button value="삭제" OnClick="javascript:deleteCheck();">
      			    	<input type=button value="취소" OnClick="javascript:history.back(-1)">
      					<td>&nbsp;</td>
     				</tr>
				</table>
				
								
			</td>
		</tr>
	</form>
</table>