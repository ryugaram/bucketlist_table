<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
 Date nowTime = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
 request.setCharacterEncoding("utf-8");         
 String memo=request.getParameter("memo");
 String radiobox = request.getParameter("radiobox"); //라디오 박스 1,2추가해야함
 
 try{
  Class.forName("com.mysql.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/test3?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
  Connection con = DriverManager.getConnection(url,"root","**");
  Statement stat = con.createStatement();

  String query = "INSERT INTO info(content,divi) VALUES('"+memo+"','"+radiobox+"')";
  stat.executeUpdate(query);
  stat.close();
  con.close();
  pageContext.forward("wish.jsp");
 }
 catch(Exception e){
  out.println( e );
 }

%>


