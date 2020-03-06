<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="../inc/vars.jsp"%>
<%@ include file="../inc/dbconn.jsp"%>
<%@ include file="../inc/islogin.jsp"%>
<%@ include file="../inc/header.jsp" %>
<script>

function modifyCheck()
  {
   var form = document.modifyform;
   
   if( !form.boardpw.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.boardpw.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.content.focus();
    return;
   }  
 		form.submit();
  }
</script>
<%
	String title = "";
	String content = "";
	String password = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try{
		 String sqlList = "select title, content, boardpw from tb_board where seq = ?";
		 pstmt = dbconn.prepareStatement(sqlList);
		 pstmt.setInt(1,idx);
		 rs = pstmt.executeQuery();
		
		 if(rs.next()){
			 title = rs.getString("title");
			 content = rs.getString("content");
			 password = rs.getString("boardpw");
		 }//if
	} catch (Exception e) {
 		out.println(e);
}%>	
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
 <%@ include file = "../left.jsp" %>
<%@ include file = "../header.jsp" %>
<table>
<form name=modifyform method=post action="modifyAction.jsp?idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>수정</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
   
   	  <tr>
       <td>&nbsp;</td>
       <td align="center">비밀번호</td>
       <td><input type=password name="boardpw" id="bordpw" size=50  maxlength=50 ></td>
       <td>&nbsp;</td>
      </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type=text name=title size=50  maxlength=50 value="<%=title%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
   
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name=content cols=50 rows=13><%=content%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="수정" OnClick="javascript:modifyCheck();">
      <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
  </form>
 </table>
</body>
 </html>