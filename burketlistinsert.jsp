<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script>
 function outputArea() {
			var textArea = document.getElementById('memo').value; // textarea 태그 의 내용을 가져온다.
			var outputArea = document.getElementById('outputarea'); // div 를 지정한다

			var repl = textArea.replace(/(^|\W)(#[a-z|A-Z|0-9|ㄱ-힣\d]*)/ig, '$1<a href="$2">$2</a>');// 문자열을 #기준으로 a태그를 추가한다.
			outputArea.innerHTML = repl; // div 에 내용 출력				
		}
 
 </script>
 <title>버킷 추가</title>
 </head>
 <body>
<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
    <form action='burketex.jsp'method="post">
   <table>
     <tr>
	   	<input type="radio" name="radiobox" value="1">~ing&nbsp;
		<input type="radio" name="radiobox" value="2">end<br>
     </tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea id="memo" name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=submit value="등록">
       <input type=button value="취소">
      <td>&nbsp;</td>
     </tr>
    </table>
   </form>
   </td>
  </tr>
 </table>


</body> 

</html>