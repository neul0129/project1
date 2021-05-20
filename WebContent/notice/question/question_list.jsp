<%@page import="site.margaret.dao.MemberDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="site.margaret.dto.MemberDTO"%>
<%@page import="site.margaret.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="site.margaret.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String search = request.getParameter("search");		
	if(search==null) search="";
	String keyword=request.getParameter("keyword");		
	if(keyword==null) keyword="";
	
	//페이지 설정
	int pageNum=1; 
	if(request.getParameter("pageNum")!=null){
		pageNum=Integer.parseInt(request.getParameter("pageNum"));
	}
	
	int pageSize=10;
	
	int totalBoard=BoardDAO.getDAO().selectBoardCount(search, keyword);
	int totalPage =(int)Math.ceil((double)totalBoard/pageSize);			
	
	if(pageNum<=0 || pageNum>totalPage){ 
		pageNum=1;						 
	}
	
	int startRow=(pageNum-1)*pageSize+1;
	int endRow= pageNum*pageSize;
	if(endRow>totalBoard) {
		endRow=totalBoard;
	}
	List<BoardDTO> boardList=BoardDAO.getDAO().selectBoardList(startRow, endRow, search, keyword);
	
	int number = totalBoard-(pageNum-1)*pageSize;
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
	
%>
<style type="text/css">

h2 {
	text-align: left;
}

table {width: 100%; border : 0; border-spacing : 0; border-collapse : collapse;}

#bottom_line {
	border-bottom: 1px solid gray;
}

#writeBtn {
    background: #fff;
    font-family: 'GillSansMTPro-Medium',Helvetica Neue,Helvetica,aritaDotumMedium,Apple SD Gothic Neo,Nanum Barun Gothic,Malgun Gothic,sans-serif;
    margin-right: 15px;
    line-height: 25px;
    text-transform: uppercase;
    text-align: right;
    padding-right: 30px;
}

#writeBtn :hover{
	color: black;
}

.title {
    min-height: 30px;
    margin: 0px 0 20px;
}

.subject {
	text-align: left;
}

td {
	height: 50px;
}


</style>
<div class="xans-element- xans-board xans-board-title-9 xans-board-title xans-board-9 ">
<div class="title">
<h2>Q&amp;A</h2>
</div>

<p class="imgArea"></p>
</div>

<div class="boardSort">
	<span class="xans-element- xans-board xans-board-replysort-9 xans-board-replysort xans-board-9 "></span>
</div>
    

<div class="boardList">
	
	<table>
		<tr id=bottom_line>
			<th width="100">NUMBER</th>
			<th width="600">TITLE</th>
			<th width="100">WRITER</th>
			<th width="150">DATE</th>
		</tr>
	
		<% if(totalBoard==0) { %>
			<tr>
				<td colspan="5">검색결과가 없습니다.</td>
			</tr>
		<% } else { %>
		<% for(BoardDTO board:boardList){ %>
 		<tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
 			<td><%=number %></td>
 			
			<td class="subject">
				<% if(board.getBoardStatus()==0) {	//일반 게시글 %>
					<% if(loginMember!=null) {%>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=notice/question&work=question_detail&boardNo=<%=board.getBoardNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=board.getTitle() %></a>
					<% } else { %>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=member&work=member_login"><%=board.getTitle() %></a>
					<% } %>
				<% } else if(board.getBoardStatus()==1) {//비밀 게시글 %>
					<span class="secret"><img src="img/lock.png" width = "17px"></span>
			<% if(loginMember!=null && (loginMember.getId().equals(board.getId()) || loginMember.getStatus()==9)) { %>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=notice/question&work=question_detail&boardNo=<%=board.getBoardNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=board.getTitle() %></a>
			<% } else {%>
				비밀글입니다
			<% } %>
		<% } else if(board.getBoardStatus()==9) {//삭제 게시글 %>
			<span class="remove">삭제된 게시글입니다.</span>
			
		<% } %>	
        	</td>
        
        <% if(board.getBoardStatus()!=9) { %>
	        <%-- 작성자 --%>
	        <td><%=board.getId() %></td>
	        <%-- 작성일 --%>
	        
	        <td>
	        <% System.out.println(board.getBoardDate()); %>
	        
			<% if(currentDate.equals(board.getBoardDate().substring(0, 10))) {%> 
				<%=board.getBoardDate().substring(11, 19) %>
				<% } else { //과거에 작성한 경우  %>
				<%=board.getBoardDate().substring(02, 19) %>
			<% } %>
			</td>
			
		<% } else { %>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		<% } %>
	</tr>
	<% number--; %>
	<% } %>
<% } %>
</table>
<% if(loginMember!=null) { %>
	<br>
	<br>
	<div id="writeBtn"><a href="index.jsp?workgroup=notice/question&work=question_write">WRITE</a>
	</div>
<% } %>

	
	<% 
		System.out.println("totalPage = "+totalPage); 
	%>
	<% 	
		int blockSize=5;
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		int endPage=startPage+blockSize-1;
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	<div>
	<% if(startPage>blockSize ) { %>
		<a href="<%=request.getContextPath() %>/index.jsp?workgroup=notice/question&work=question_list&pageNum=<%=startPage-blockSize%>&search=<%=search %>&keyword=<%=keyword %>">«</a>
	<% }else { %>
		←
	<% } %>
	
	<%-- 전체 페이지 출력  --%>
	<% for(int i=startPage;i<=endPage;i++) {%>
		<% if(pageNum!=i) { %>
		<a href="<%=request.getContextPath() %>/index.jsp?workgroup=notice/question&work=question_list&pageNum=<%=i%>&search=<%=search %>&keyword=<%=keyword %>">[<%=i %>]</a>
		<% }else {%>
		[<%=i %>]
	<% } %>
	
	<% } %>
	
	<% if(endPage!=totalPage) { %>
		<a href="<%=request.getContextPath() %>/index.jsp?workgroup=notice/question&work=question_list&pageNum=<%=startPage+blockSize%>&search=<%=search %>&keyword=<%=keyword %>">»</a>
	<% }else { %>
		→
	<% } %>
	</div>
	<div>&nbsp;</div>
	
	<%-- 게시글 검색 --%>
	<form action="<%=request.getContextPath() %>/index.jsp?workgroup=notice/question&work=question_list" method="post">
	
		<select name="search" style="border: 1px solid gray; color: gray">
			<option value="id" selected="selected" style="color: gray">&nbsp;WRITER&nbsp;</option>
			<option value="title" style="color: gray">&nbsp;TITLE&nbsp;</option>
		</select>
		<input type="text" name="keyword">
		<button type="submit" style="border: 1px solid gray; cursor: pointer;  background: #fff; padding: 5px; "><p style="text-align: center; color:gray;">SEARCH</p></button>
	</form>
</div>      