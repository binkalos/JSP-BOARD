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
<html>
<head>
<title>게시판</title>
</head>
 <body>
<%

	try{
		request.setCharacterEncoding("UTF-8");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		String sqlList = "select seq,title,content,wdate from tb_board where seq = ?";
		pstmt = dbconn.prepareStatement(sqlList);
		pstmt.setInt(1,idx);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String title = rs.getString("title");
			String content = rs.getString("content");
			String wdate = rs.getString("wdate");
			
%>
<%@ include file = "../left.jsp" %>
<%@ include file = "../header.jsp" %>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
   
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=uname%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=wdate%></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
      <td width="319"><%=title %></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0"></td>
                   <td width="399" colspan="2" height="200"><%=content %>
                </tr>

     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="글쓰기" OnClick="window.location='form.jsp'">
		<input type=button value="목록" OnClick="window.location='list.jsp'">
		<input type=button value="수정"OnClick="window.location='modify.jsp?idx=<%=idx%>'">
		<input type=button value="삭제" OnClick="window.location='delete.jsp?idx=<%=idx%>'">
      	<td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
<% }//if
}catch(Exception e) {
	out.println(e);
}%>	
</body>
 </html>
<%@ include file="../inc/dbclose.jsp"%>
