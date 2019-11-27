<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--  -----------스크립트 끌어온거라 안건들이는게 좋아 ㅎ----------------- -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
 $(document).ready(function(){
            var tbl = $("#checkbox1");
             
            // 테이블 헤더에 있는 checkbox 클릭시
            $(":checkbox:first", tbl).click(function(){
                // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
                if( $(this).is(":checked") ){
                    $(":checkbox", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox", tbl).removeAttr("checked");
                }
 
                // 모든 체크박스에 change 이벤트 발생시키기               
                $(":checkbox", tbl).trigger("change");
            });
             
            // 헤더에 있는 체크박스외 다른 체크박스 클릭시
            $(":checkbox:not(:first)", tbl).click(function(){
                var allCnt = $(":checkbox:not(:first)", tbl).length;
                var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
                 
                // 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단
                if( allCnt==checkedCnt ){
                    $(":checkbox:first", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox:first", tbl).removeAttr("checked");
                }
            }).change(function(){
                if( $(this).is(":checked") ){
                    // 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
                    $(this).parent().parent().addClass("selected");
                }
                else{
                    $(this).parent().parent().removeClass("selected");
                }
            });
        });
        $(document).ready(function(){
            var tbl = $("#checkbox2");
             
            // ---------------테이블 헤더에 있는 checkbox 클릭시-------------------
            $(":checkbox:first", tbl).click(function(){
                // 클릭한 체크박스가 체크상태인지 체크해제상태인지 판단
                if( $(this).is(":checked") ){
                    $(":checkbox", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox", tbl).removeAttr("checked");
                }
 
                // 모든 체크박스에 change 이벤트 발생시키기               
                $(":checkbox", tbl).trigger("change");
            });
             
            // -------------헤더에 있는 체크박스외 다른 체크박스 클릭시 -----------------
            $(":checkbox:not(:first)", tbl).click(function(){
                var allCnt = $(":checkbox:not(:first)", tbl).length;
                var checkedCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
                 
                //  ------------------전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판단-----------------
                if( allCnt==checkedCnt ){
                    $(":checkbox:first", tbl).attr("checked", "checked");
                }
                else{
                    $(":checkbox:first", tbl).removeAttr("checked");
                }
            }).change(function(){
                if( $(this).is(":checked") ){
                 
                    $(this).parent().parent().addClass("selected");
                }
                else{
                    $(this).parent().parent().removeClass("selected");
                }
            });
        });
    </script>
</head>
<body>
	<!--  ------------추가 화면으로 넘기는것-------------- -->
	<button onclick="location='burketlistinsert.jsp'">행 추가하기</button>
	<%
	 Connection con = null;
    //SQL문 실행을 위한 객체
    Statement stmt = null;
    //SQL문 실행 후 반환될 객체
    ResultSet rs = null;
 	request.setCharacterEncoding("utf-8");         
 	
 	//변경해야함! db변경
	 try{
	  String SQL = "select content from info where divi=1";
	  Class.forName("com.mysql.jdbc.Driver");
	  String url = "jdbc:mysql://localhost:3306/test3?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	  con = DriverManager.getConnection(url,"root","u1352021");
	  stmt = con.createStatement();
	  rs= stmt.executeQuery(SQL); 
	%> <!-- 여기부터 테이블 만들고 추가하면서 while 도는곳 여기에 1주일씀-->
		<div style="float: left; margin-right: 300px;">
		<table id="checkbox1" border="1px">
			<caption>해본 버킷리스트</caption>
			<colgroup>
				<col width="40px;" />
				<col width="200px;" />
				<col width="100px;" />
			</colgroup>
			<tr>
				<th><input type="checkbox" /></th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<% while(rs.next()){
		  %>
			<tr>
				<td><input type="checkbox"></td>
				<td><%=rs.getString("content") %></td>

			</tr>
			<%} %>
		</table>
	</div>
	 <% }catch(SQLException e){
		   out.println( e );
	   }
	   finally{
		   try{
		   if(rs!=null) try{rs.close();}catch(Exception e){}
			if(stmt!=null) try{stmt.close();}catch(Exception e){}
			if(con!=null) try{con.close();}catch(Exception e){}
	          }
		   catch(Exception e){
			   out.println( e );
		                     }
			   
		   }%>
  <% 
  try{
	  String SQL = "select content from info where divi=2";
	  Class.forName("com.mysql.jdbc.Driver");
	  String url = "jdbc:mysql://localhost:3306/test3?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC";
	  con = DriverManager.getConnection(url,"root","u1352021");
	  stmt = con.createStatement();
	  rs= stmt.executeQuery(SQL); 
	%>
	<div style="float: right; margin-right: 300px;">
		<table id="checkbox2" border="1px">
			<caption>해본 버킷리스트</caption>
			<colgroup>
				<col width="40px;" />
				<col width="200px;" />
				<col width="100px;" />
			</colgroup>
			<tr>
				<th><input type="checkbox" /></th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
			<% while(rs.next()){
			  %>
					<tr>
					    <td><input type="checkbox"></td>
						<td><%=rs.getString("content") %></td>
		
					</tr>
				<%} %>
		</table>
	</div>
	<%    
	 }catch(SQLException e){
		   out.println( e );
	   }
	   finally{
		   try{
		   if(rs!=null) try{rs.close();}catch(Exception e){}
			if(stmt!=null) try{stmt.close();}catch(Exception e){}
			if(con!=null) try{con.close();}catch(Exception e){}
	          }
		   catch(Exception e){
			   out.println( e );
		                     }
			   
		   }
	 %>
</body>
</html>
