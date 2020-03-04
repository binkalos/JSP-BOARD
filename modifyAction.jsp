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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String boardpw = null;
		String passw = request.getParameter("boardpw");
		
		String sqlList = "select boardpw from tb_board where seq = ?";
		pstmt = dbconn.prepareStatement(sqlList);
		pstmt.setInt(1,idx);
		rs = pstmt.executeQuery();
		
		 if(rs.next()){
			 boardpw = rs.getString(1);
		 }//if
		 rs.close();
		 pstmt.close();
		 if(boardpw.equals(passw)) {
				sqlList = "update tb_board set title = ? , content = ? where seq = ?";		
				pstmt = dbconn.prepareStatement(sqlList);
				pstmt.setString(1,title);
				pstmt.setString(2,content);
				pstmt.setInt(3,idx);
				pstmt.executeUpdate();
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
					location.href="view.jsp?idx=<%=idx%>";
				  </script>
<% }else {%>
	<script language=javascript>
		self.window.alert("비밀번호를 틀렸습니다.");
		location.href="javascript:history.back()";
	</script>
<%			
}//else
 
	}catch(Exception e) {
		out.println(e);
}%>	
<%@ include file="../inc/dbclose.jsp"%>