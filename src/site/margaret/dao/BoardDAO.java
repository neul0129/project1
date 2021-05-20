package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.margaret.dto.BoardDTO;


public class BoardDAO extends JdbcDAO{
	private static BoardDAO _dao;
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
	}
	
	static {
		_dao=new BoardDAO();
	}
	
	public static BoardDAO getDAO() {
		return _dao;
	}
	
	
	//���� : �������� �����ΰ���, ����� search ���� 
	
	
	//�Խñ� ��(����¡ ó����)
	public int selectBoardCount(String search, String keyword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; 
		
		try {
			con= getConnection();
			
			if(keyword.equals("")) {
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			} else {
				String sql="select count(*) from board where "+search+" like '%'||?||'%' and board_status!=9";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
			}
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch (SQLException e) {
			System.out.println("[����]selectBoardCount()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return count;
	}
	
	//�Խñ� �߰�
	public int insertBoard(BoardDTO board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
		
		try {
			con=getConnection();
			
				String sql = "insert into board values(?,?,?,?,?,sysdate,?,?,?,?,?,?)";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, board.getBoardNo());
				pstmt.setString(2, board.getId());
				pstmt.setInt(3, board.getSection());
				pstmt.setString(4, board.getTitle());
				pstmt.setString(5, board.getBoardContent());
				pstmt.setString(6, board.getReviewGrade());
				pstmt.setInt(7, board.getProductNo());
				pstmt.setInt(8, board.getWhetherReply());
				pstmt.setInt(9, board.getBoardStatus());
				pstmt.setString(10, board.getBoardFile());
				pstmt.setInt(11, board.getqNo());
			
			rows=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("[����]insertBoard()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�Խñ� ���� 
	public int updateBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		int rows=0;
		try {
			con=getConnection();
			
			String sql="update board set title=?,board_content=?,board_date=?, board_file=? where board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setString(3, board.getBoardDate());
			pstmt.setString(4, board.getBoardFile());
			pstmt.setInt(5, board.getBoardNo());
			
			rows=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("[����]updateBoard() �޼ҵ��� SQL ���� = "+e.getMessage());
		} finally {
			close(con, pstmt);
		}
		return rows;
	}	
	
	//�Խñ� ������ ó�� 
	public int deleteBoard(int boardNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int rows=0;
				
		try {
		con=getConnection();
				
			String sql = "update board set board_status=9 where board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
					
			rows=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("[����]deleteBoard()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//�Խñ� ��ȣ�� ���޹޾� BOARD ���̺� ����� �ش� �Խñ��� �˻� (�Խñ� ������������ ���)
	public BoardDTO selectNumboard(int boardNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board = null;
		try {
			con= getConnection();
			String sql = "select*from board where board_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
					
			rs=pstmt.executeQuery();
					
			if(rs.next()) {
				board=new BoardDTO();
				board.setBoardNo(rs.getInt("board_no"));
				board.setId(rs.getString("id"));
				board.setSection(rs.getInt("section"));
				board.setTitle(rs.getString("title"));
				board.setBoardContent(rs.getString("board_content"));
				board.setBoardDate(rs.getString("board_date"));
				board.setReviewGrade(rs.getString("review_grade"));
				board.setProductNo(rs.getInt("product_no"));
				board.setWhetherReply(rs.getInt("whether_reply"));
				board.setBoardStatus(rs.getInt("board_status"));
				board.setBoardFile(rs.getString("board_file"));
				board.setqNo(rs.getInt("q_no"));
			}
		}catch (Exception e) {
			System.out.println("[����]selectNumboard()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return board;
	}
	
	//�Խñ� ��� (if status?)
	public List<BoardDTO>selectBoardList(int startRow, int endRow, String search, String keyword){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> boardList=new ArrayList<BoardDTO>();
		
		try {
			con =getConnection();
			if(keyword.equals("")) {
				String sql="select*from(select rownum rn,temp.* from(select * from board where section=0 order by board_date desc)temp)where rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
			} else {
				String sql="select * from(select rownum rn,temp.* from (select * "
						+ "from board where "+search+" like '%'||?||'%' and board_status!=9 order by board_date desc) temp) where section=0 and rn between ? and ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, keyword);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
			}
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					BoardDTO board=new BoardDTO();
					board.setBoardNo(rs.getInt("board_no"));
					board.setId(rs.getString("id"));
					board.setSection(rs.getInt("section"));
					board.setTitle(rs.getString("title"));
					board.setBoardContent(rs.getString("board_content"));
					board.setBoardDate(rs.getString("board_date"));
					board.setReviewGrade(rs.getString("review_grade"));
					board.setProductNo(rs.getInt("product_no"));
					board.setWhetherReply(rs.getInt("whether_reply"));
					board.setBoardStatus(rs.getInt("board_status"));
					board.setBoardFile(rs.getString("board_file"));
					board.setqNo(rs.getInt("q_no"));
					boardList.add(board);
			}
		}catch (SQLException e) {
			System.out.println("[����]selectBoardList()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return boardList;
	}
	
	
	public int selectNextNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int nextNum=0;
			
		try {
			con= getConnection();
			String sql = "select board_seq.nextval from dual";
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
				
			if(rs.next()) {
				nextNum=rs.getInt(1);
			}
		}catch (SQLException e) {
			System.out.println("[����]selectNextNum()�޼ҵ��� SQL ���� = "+e.getMessage());
			
		}finally {
			close(con, pstmt, rs);
		}
		return nextNum;
	}

	// ������
	public List<BoardDTO> selectReviewList(int productNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> reviewList=new ArrayList<BoardDTO>();
		
		try {
			con =getConnection();
			String sql="select * from board where section=1 and product_no=? order by board_date desc";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, productNo);
			rs=pstmt.executeQuery();
				
			while(rs.next()) {
				BoardDTO review=new BoardDTO();
				review.setBoardNo(rs.getInt("board_no"));
				review.setId(rs.getString("id"));
				review.setSection(rs.getInt("section"));
				review.setTitle(rs.getString("title"));
				review.setBoardContent(rs.getString("board_content"));
				review.setBoardDate(rs.getString("board_date"));
				review.setReviewGrade(rs.getString("review_grade"));
				review.setProductNo(rs.getInt("product_no"));
				review.setWhetherReply(rs.getInt("whether_reply"));
				review.setBoardStatus(rs.getInt("board_status"));
				review.setBoardFile(rs.getString("board_file"));
				review.setqNo(rs.getInt("q_no"));

				reviewList.add(review);
			}
		}catch (SQLException e) {
			System.out.println("[����]selectReviewList()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return reviewList;
	}
}
