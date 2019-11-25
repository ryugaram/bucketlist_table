<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="table.js" ></script>        
</head>
 
<body>


<button onclick="location='burketlistinsert.jsp'">행 추가하기</button>

<%
 request.setCharacterEncoding("utf-8");         
 String SQL = "select content from info where divi = 1 ";
 //라디오 박스 1,2추가해야함
if(divi==1){
	 try{
	  Class.forName("com.mysql.jdbc.Driver");
	  String url = "jdbc:mysql://localhost:3306/test3?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	  Connection con = DriverManager.getConnection(url,"root","u1352021");
	  Statement stmt = con.createStatement();
	  rs= stmt.executeQuery(SQL); 
	%>
	  <div style="float:left;margin-right: 300px;">
	  <table id="checkbox1" border="1px">
	  <caption>해본 버킷리스트</caption>
	   <colgroup>
	             <col width="40px;"/>
	             <col width="200px;"/>
	             <col width="100px;"/>
	         </colgroup>
	  <tr>
	             <th><input type="checkbox"/></th>
	             <th>제목</th>
	             <th>날짜</th>
	         </tr>
	  <% while(rs.next()){
	  %>
	  		<tr>
	  		 	 <td><%=rs.getstring("content") %></td>
		           
		    </tr>    
	 <%  } %>
	 </table>
	 </div>
	<%
	catch(Exception e){
	  out.println( e );
	  if(rs!=null) try{rs.close();}catch(Exception e){}
		if(stmt!=null) try{stmt.close();}catch(Exception e){}
		if(con!=null) try{con.close();}catch(Exception e){}
	}}
	 %>
else{
<% 
request.setCharacterEncoding("utf-8");         
String SQL = "select content from info where divi = 2 ";

try{
 Class.forName("com.mysql.jdbc.Driver");
 String url = "jdbc:mysql://localhost:3306/test3?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
 Connection con = DriverManager.getConnection(url,"root","u1352021");
 Statement stmt = con.createStatement();
 rs = stmt.executeQuery(SQL);%>

 <div style="float:right;margin-right: 300px;">
 <table id="checkbox2" border="1px">
 <caption>해본 버킷리스트</caption>
  <colgroup>
            <col width="40px;"/>
            <col width="200px;"/>
            <col width="100px;"/>
        </colgroup>
 <tr>
            <th><input type="checkbox"/></th>
            <th>제목</th>
            <th>날짜</th>
        </tr>
 <% while(rs.next()){
 %>
 		<tr>
 		 	 <td><%=rs.getstring("content") %></td>
          
    	</tr>    
<% } %>
 </table>
 </div>
<%
catch(Exception e){
  out.println( e );
}
finally{
	if(rs!=null) try{rs.close();}catch(Exception e){}
	if(stmt!=null) try{stmt.close();}catch(Exception e){}
	if(con!=null) try{con.close();}catch(Exception e){}
}}
%>
</body>
</html>