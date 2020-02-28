<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../inc/vars.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>

<%@ page import="org.json.simple.*"%>
<%
try{
	int t2seq = getParam(request,"t2seq",0);
	//application.log(""+t2seq);
	String sqlList = "select t2.zone2nm, t3.seq ,t3.zone3nm from tb_zone3 as t3 join tb_zone2 as t2 on t2.seq = t3.seq_zone2 where t2.seq = ?";
	pstmt = dbconn.prepareStatement(sqlList);
    pstmt.setInt(1,t2seq);
    rs = pstmt.executeQuery();
    
    JSONArray jsonArray = new JSONArray();
    JSONObject object = null;

    while (rs.next())
    {
    	object = new JSONObject();
    	object.put("t3seq",rs.getString("t3.seq"));
    	object.put("t3zone3nm",rs.getString("t3.zone3nm"));
    	jsonArray.add(object);
        object = null;
    }

    rs.close();
    pstmt.close();

    sql = null;
    pstmt = null;
    rs = null;

    out.clear();
    out.print(jsonArray.toString());


}catch (Exception e){

    out.clear();
    application.log(e.getMessage());

}

%>

<%@ include file="../inc/dbclose.jsp" %>
