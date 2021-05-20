package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import site.margaret.dto.ReplyDTO;

public class ReplyDAO extends JdbcDAO {
	private static ReplyDAO _dao;
	
	public ReplyDAO() {}
	
	static {
		_dao=new ReplyDAO();
	}
	
	public static ReplyDAO getDAO() {
		return _dao;
	}
	
	//��������� ���� �޾� REPLY���̺� ����
	public int insertReply(ReplyDTO reply) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql = "insert into reply values (reply_seq.nextval,?,?,?,sysdate)"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, reply.getBoardNo());
			pstmt.setString(2, reply.getId());
			pstmt.setString(3, reply.getReplyContent());
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[����]intsertReply()�޼ҵ���  SQL ���� ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��������� ���� �޾� REPLY���̺� ���� ��� ���� (������ �� �ð� ���⼭ sysdate ����� �´���)
	public int updateReply(ReplyDTO reply) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql = "update reply set reply_content=? where reply_no=?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, reply.getReplyContent());
			pstmt.setInt(2, reply.getReplyNo());
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[����]updateReply()�޼ҵ���  SQL ���� ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��۹�ȣ�� ���� �޾� �����Ͽ� REPLY���̺� ����
	public int deleteReply(int replyNo) {
		Connection con = null;
		PreparedStatement pstmt=null;
		int rows=0;
		
		try {
			con=getConnection();
			String sql = "delete from reply where reply_no=?"; 
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, replyNo);
			
			rows=pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("[����]deleteReply()�޼ҵ���  SQL ���� ="+e.getMessage());
		}finally {
			close(con, pstmt);
		}
		return rows;
	}
	
	//��� ��ȣ�� ���޹޾� REPLY ���̺� ����� �ش� �Խñ��� �˻� 
		public ReplyDTO selectNumReply(int boardNo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ReplyDTO reply = null;
			try {
				con= getConnection();
				String sql = "select * from reply where board_no=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, boardNo);
						
				rs=pstmt.executeQuery();
						
				if(rs.next()) {
					reply=new ReplyDTO();
					reply.setReplyNo(rs.getInt("reply_no"));
					reply.setBoardNo(rs.getInt("board_no"));
					reply.setId(rs.getString("id"));
					reply.setReplyContent(rs.getString("reply_content"));
					reply.setReplyDate(rs.getString("reply_date"));
							
				}
			}catch (Exception e) {
				System.out.println("[����]selectNumReply()�޼ҵ��� SQL ���� = "+e.getMessage());
			}finally {
				close(con, pstmt, rs);
			}
			return reply;
		}
		

	
	public int selectReplyCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0; //�Խñ��� ����
		
		try {
			con= getConnection();
			
				String sql="select count(*) from board";
				pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//��ȯ�ޱ�
			if(rs.next()) {
				count=rs.getInt(1);
			}
		}catch (SQLException e) {
			System.out.println("[����]selectReplyCount()�޼ҵ��� SQL ���� = "+e.getMessage());
		}finally {
			close(con, pstmt, rs);
		}
		return count;
	}
}
