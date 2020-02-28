<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../inc/vars.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>

<%@ page import="org.json.simple.*"%>
<%
try{
	String zone3nmA = getParam(request,"zone3nmA","");//String type으로 받아오기 위해 마지막 파라미터 값을 0 -> " "으로 바꿔줌
	int zone2nmA = getParam(request,"zone2nmA",0);
	int result = getParam(request,"result",0);

<<<<<<< HEAD
	//application.log("건물:"+zone2nmA+" 층:"+zone3nmA+" 시설 :"+ result);
=======
	application.log("건물:"+zone2nmA+" 층:"+zone3nmA+" 시설 :"+ result);
>>>>>>> e974d1cd294b4393a629619cc31fb4caae15198e
	
	String sqlList = "SELECT t3.id ,t3.zone3nm, t3.floor,t2.zone2nm ";
	sqlList+="FROM tb_zone3 as t3 JOIN tb_zone2 as t2 ON t2.seq = t3.seq_zone2 ";
	sqlList+="JOIN tb_zone as t1 ON t1.seq = t2.seq_zone ";
<<<<<<< HEAD
	sqlList+="WHERE t3.floor = ? and t2.seq = ? and t3.seq = ? ";
	pstmt = dbconn.prepareStatement(sqlList);
    pstmt.setString(1,zone3nmA);
    pstmt.setInt(2,zone2nmA);
    pstmt.setInt(3,result);
=======
	sqlList+="WHERE t3.floor = ? and t2.seq = ?";
	pstmt = dbconn.prepareStatement(sqlList);
    pstmt.setString(1,zone3nmA);
    pstmt.setInt(2,zone2nmA);
>>>>>>> e974d1cd294b4393a629619cc31fb4caae15198e
    rs = pstmt.executeQuery();
    
    JSONArray jsonArray = new JSONArray();
    JSONObject object = null;

    while (rs.next())
    {
    	object = new JSONObject();
    	object.put("t3id",rs.getString("t3.id"));
    	object.put("t3zone3nm",rs.getString("t3.zone3nm"));
    	object.put("t3floor",rs.getString("t3.floor"));
    	object.put("t2zone2nm",rs.getString("t2.zone2nm"));
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
