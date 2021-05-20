<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	table.type03 {
	  border-collapse: collapse;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  border-left: 3px solid #369;
	  margin : 20px 10px;
	}
	table.type03 th {
	  width: 200px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  color: #153d73;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	
	}
	table.type03 td {
	  width: 1000px;
	  padding: 10px;
	  vertical-align: top;
	  border-right: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	}
</style>
<title>review 작성</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_edit_pop_action" method="post" id="reviewForm">
		<input name="productNo" type="hidden" value="<%=request.getParameter("productNo") %>" />
		<input name="id" type="hidden" value="<%=request.getParameter("id") %>" />
		<input name="orderNo" type="hidden" value="<%=request.getParameter("orderNo") %>" />
		<input name="orderSeq" type="hidden" value="<%=request.getParameter("orderSeq") %>" />
		<table class="type03">
		  <tr>
		    <th scope="row">TITLE</th>
		    <td>
		    	<input type="text" name="title" id="review_title"/>
		    </td>
		  </tr>
		  <tr>
		    <th scope="row">GRADE</th>
		    <td>
		    	<select name="REVIEW_GRADE">
					<option value="5" selected="selected" >★★★★★</option>
					<option value="4">★★★★☆</option>
					<option value="3">★★★☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="1">★☆☆☆☆</option>
				</select>
		    </td>
		  </tr>
		  <tr>
		    <th scope="row">REVIEW</th>
		    <td>
				<textarea rows="7" cols="60" name="boardContent" id="review_detail"></textarea>
		    </td>
		  </tr>
		</table>
		<div style="width: 100%;text-align: center;">
			<button type="button" onclick="inputCheck()">작성</button>
			<button type="button" onclick="window.close()">닫기</button>
		</div>
	</form>
</body>
</html>
<script type="text/javascript">
	function inputCheck() {
		if(document.getElementById("review_title").value=="") {
			alert("제목을 입력하세요.");
			return;
		}
		if(document.getElementById("review_detail").value=="") {  
			alert("내용을 입력하세요.");
			return;
		}
		document.getElementById("reviewForm").submit();
	}
</script>