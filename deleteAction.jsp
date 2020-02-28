<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ include file="../jslib.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>

<%@ page import = "java.sql.*"%>

<%
try{
	 int idx = Integer.parseInt(request.getParameter("idx"));
	 
	 String boardpw = null;
	 String passw = request.getParameter("boardpw");
	 
	 String sqlList = "select boardpw from tb_board where seq = ?";
	 pstmt = dbconn.prepareStatement(sqlList);
	 pstmt.setInt(1,idx);
	 rs = pstmt.executeQuery();
		
	 if(rs.next()){
			boardpw = rs.getString(1);
	 }
	 rs.close();
	 pstmt.close();
	 //conn.close();
	 
	 if(boardpw.equals(passw)) {	
		 sqlList = "delete from tb_board where seq = ?";
		 pstmt = dbconn.prepareStatement(sqlList);
		 pstmt.setInt(1,idx);
		 pstmt.executeUpdate();	 
%>
			<script>
				self.window.alert("해당 글을 삭제하였습니다.");
				location.href="list.jsp";
			</script>
<%
		 } else { 
%>
			<script>
			 	self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch (Exception e) {
 		out.println(e);
 	}%>	
<%@ include file="../inc/dbclose.jsp"%>