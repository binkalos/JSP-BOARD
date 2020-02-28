<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../inc/vars.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>

<%@ page import="org.json.simple.*"%>
<%
try{
	int zone2nmA = getParam(request,"zone2nmA",0);
	//application.log(""+zone2nmA);
<<<<<<< HEAD
	String sqlList = "SELECT t2.zone2nm,t3.floor,t3.id,t3.zone3nm ";
	sqlList+= "FROM tb_zone3 as t3 JOIN tb_zone2 as t2 ON t2.seq = t3.seq_zone2 ";
	sqlList+= "JOIN tb_zone as t1 ON t1.seq = t2.seq_zone ";
	sqlList+= "WHERE t2.seq = ?";
=======
	String sqlList = "SELECT MIN(t3.seq),t3.floor, t2.zone2nm FROM tb_zone3 as t3 JOIN tb_zone2 as t2 ON t2.seq = t3.seq_zone2 JOIN tb_zone as t1 ON t1.seq = t2.seq_zone WHERE t2.seq = ? GROUP BY t3.floor order by t3.floor desc";
>>>>>>> e974d1cd294b4393a629619cc31fb4caae15198e
	pstmt = dbconn.prepareStatement(sqlList);
    pstmt.setInt(1,zone2nmA);
    rs = pstmt.executeQuery();
    
    JSONArray jsonArray = new JSONArray();
    JSONObject object = null;

    while (rs.next())
    {
    	object = new JSONObject();
<<<<<<< HEAD
    	object.put("t3floor",rs.getString("t3.floor"));
    	object.put("t2zone2nm",rs.getString("t2.zone2nm"));
    	object.put("t3id",rs.getString("t3.id"));
    	object.put("t3zone3nm",rs.getString("t3.zone3nm"));
=======
    	object.put("t3seq",rs.getString("MIN(t3.seq)"));
    	object.put("t3floor",rs.getString("t3.floor"));
    	object.put("t2zone2nm",rs.getString("t2.zone2nm"));
>>>>>>> e974d1cd294b4393a629619cc31fb4caae15198e
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
