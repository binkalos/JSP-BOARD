<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="../inc/vars.jsp"%>
<%@ include file="../inc/dbconn.jsp"%>
<%@ include file="../inc/islogin.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String boardpw = request.getParameter("boardpw");
	
	pstmt = null;
	rs = null;
	sql = null;

	try {

		pstmt = dbconn.prepareStatement("insert into tb_board (seq_user,title, content, seq_zone3, boardpw) values(?, ?, ?, ?, ?)");
		pstmt.setInt(1, seqZone);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setInt(4, 0);
		pstmt.setString(5,boardpw);
		
		pstmt.executeUpdate();

	} catch (Exception e) {
		e.printStackTrace();	
	} 
%>

<script>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 
</script>

<%@ include file="../inc/dbclose.jsp"%>
