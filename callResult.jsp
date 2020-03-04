<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../inc/vars.jsp" %>
<%@ include file="../inc/islogin.jsp" %>
<%@ include file="../inc/funcEtc.jsp" %>
<%@ include file="../inc/dbconn.jsp" %>

<%@ page import="org.json.simple.*"%>
<%
try{
	//배열을 받아와서 할 때는 배열의 길이가 정해져 있지 않기 때문에 ?를 가변적으로 만들어 줘야 함
	String[] arrayResult = getParam(request,"arrayResult"); //클릭한 값들의 seq번호가 담기는 배열
	//zone3nmResult에 배열의 값을 담아서 set하지 않고 바로 쿼리문에 적용
	String zone3nmResult = "";
	for(int i = 0 ; i < arrayResult.length; i++) {
		zone3nmResult += (arrayResult[i]+",");
	}
	//[1],[2],[3],
	zone3nmResult = zone3nmResult.substring(0,zone3nmResult.length()-1);//맨마지막에 생기는 , 빼주기 위해 -1함
	
	String sqlList = "SELECT t2.zone2nm,t3.floor,t3.id,t3.zone3nm ";
	sqlList+= "FROM tb_zone3 as t3 JOIN tb_zone2 as t2 ON t2.seq = t3.seq_zone2 ";
	sqlList+= "JOIN tb_zone as t1 ON t1.seq = t2.seq_zone ";
	sqlList+= "WHERE t3.seq in (" + zone3nmResult + ")";
	pstmt = dbconn.prepareStatement(sqlList);
	rs = pstmt.executeQuery(); //할당 

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
