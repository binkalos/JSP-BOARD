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
</head>
<body>
<%
try{
	request.setCharacterEncoding("UTF-8");
	String sqlCount = "select COUNT(*) from tb_board";//전체 글 갯수
	
	pstmt = dbconn.prepareStatement(sqlCount);
	rs = pstmt.executeQuery();
	int total = 0;
	if(rs.next()){
		total = rs.getInt(1);
	}//if
	rs.close();
	
	String sqlList = "select seq, seq_user, title, wdate from tb_board order by seq asc";
	pstmt = dbconn.prepareStatement(sqlList);
	rs = pstmt.executeQuery();

%>
<%@ include file = "../left.jsp" %>
<%@ include file = "../header.jsp" %>
	<div class="table" id="table">
	<% out.println("총 게시물 : " + total + "개"); %>
		<table style="margin-left:auto; margin-right:auto;">
		  <tr height="5"><td width="5"></td></tr>
		 	<tr style="text-align:center;">
			   <td width="73">번호</td>
			   <td width="379">제목</td>
			   <td width="100">작성자</td>
			   <td width="200">작성일</td>
		    </tr>
		<%
			if(total==0){%>
				<tr align="center" bgcolor="#FFFFFF" height="30">
			 	   <td colspan="6">등록된 글이 없습니다.</td>
			 	</tr>
		<%
			}else{
		 		
				while(rs.next()) {
					int idx= rs.getInt("seq");
					String title = rs.getString("title");
					String wdate = rs.getString("wdate");
			
		%>
		<tr height="25" align="center">
			
			<td><%=idx%></td><!-- 번호 -->
			<td><a href="view.jsp?idx=<%=idx %>"><%=title %></a></td><!-- 제목 -->
			<td><%=uname %></td><!-- 작성자-->
			<td><%=wdate %></td><!-- 작성일 -->
		
		</tr>
		  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
		<% 
				}//while
			} //else
			
		} catch(SQLException e) {
			out.println( e.toString() );
		}
		%>
		</tr>

		 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
		 </table>
		 
		<table style="margin-left:auto; margin-right:auto;">
		  <tr><td colspan="4" height="5"></td></tr>
		  <tr align="center">
		   <td>
		   <button class="upbtn" type="button">
		   		<a href="form.jsp">
					<img src="img/writeimg.PNG" class="upimg">
				</a>
		   </button>
		   </td>
		  </tr>
		</table>
	</div>
</body> 
</html>
<%@ include file="../inc/dbclose.jsp"%>
