<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../inc/vars.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>

<%@ page import="org.json.simple.*"%>
<%
try{
	String[] zone2Array = getParam(request,"zone2Array");
	String zone2ArrayResult = "";
	for(int i = 0; i<zone2Array.length;i++){
		zone2ArrayResult += (zone2Array[i]+",");
	}
	zone2ArrayResult = zone2ArrayResult.substring(0,zone2ArrayResult.length()-1);
	
	String sqlList = "SELECT t2.zone2nm,t3.floor,t3.id,t3.zone3nm ";
	sqlList+= "FROM tb_zone3 as t3 JOIN tb_zone2 as t2 ON t2.seq = t3.seq_zone2 ";
	sqlList+= "JOIN tb_zone as t1 ON t1.seq = t2.seq_zone ";
	sqlList+= "WHERE t2.seq in (" + zone2ArrayResult + ")";
	pstmt = dbconn.prepareStatement(sqlList);

    rs = pstmt.executeQuery();
    
    JSONArray jsonArray = new JSONArray();
    JSONObject object = null;

    while (rs.next())
    {
    	object = new JSONObject();
    	object.put("t3floor",rs.getString("t3.floor"));
    	object.put("t2zone2nm",rs.getString("t2.zone2nm"));
    	object.put(" t3id",rs.getString("t3.id"));
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
