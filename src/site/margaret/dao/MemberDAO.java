package site.margaret.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import site.margaret.dto.MemberDTO;

public class MemberDAO extends JdbcDAO {
   private static MemberDAO _dao;
   
   public MemberDAO() {
   
      // TODO Auto-generated constructor stub
   }
   
   static {
      _dao=new MemberDAO();      
   }
   
   public static MemberDAO getDAO() {
      return _dao;
   }
   
   
   //아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를 검색하여 반환하는 메소드
   public MemberDTO selectIdMember(String id) {
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      MemberDTO member=null;
      try {
         con=getConnection();
         
         String sql="select * from member where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, id);
         
         rs=pstmt.executeQuery();
               
         if(rs.next()) {      
            member=new MemberDTO();
            member.setId(rs.getString("id"));
            member.setPasswd(rs.getString("passwd"));
            member.setName(rs.getString("name"));
            member.setEmail(rs.getString("email"));
            member.setPhone(rs.getString("phone"));
            member.setZipcode(rs.getString("zipcode"));
            member.setAddress1(rs.getString("address1"));
            member.setAddress2(rs.getString("address2"));
            member.setJoindate(rs.getString("join_date"));
            member.setLastLogin(rs.getString("last_login"));
            member.setStatus(rs.getInt("status"));
         }
      } catch (SQLException e) {
         System.out.println("[에러]selectIdMember() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt, rs);
      }
      return member;
   }
   
   //회원정보를 전달받아 MEMBER 테이블에 삽입하고 삽입행의 갯수를 반환하는 메소드
   // => 아이디,비밀번호,이름,이메일,전화번호,우편번호,기본주소,상세주소는 입력값을 이용하여 저장
   // => 회원가입일 :현재(sysdate), 마지막로그인 : null, 회원상태 : 1(일반회원)
   public int insertMember(MemberDTO member) {
      Connection con=null;
      PreparedStatement pstmt=null;
      int rows=0;
      try {
         con=getConnection();
         
         System.out.println("member.getZipcode = "+member.getZipcode());
         
         String sql="insert into member values(?,?,?,?,?,?,?,?,sysdate,null,1)";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, member.getId());
         pstmt.setString(2, member.getPasswd());
         pstmt.setString(3, member.getName());
         pstmt.setString(4, member.getEmail());
         pstmt.setString(5, member.getZipcode());
         pstmt.setString(6, member.getAddress1());
         pstmt.setString(7, member.getAddress2());
         pstmt.setString(8, member.getPhone());
         
         rows=pstmt.executeUpdate();         
      } catch (SQLException e) {
         System.out.println("[에러]insertMember() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt);
      }
      return rows;
   }
   
   //아이디를 전달받아 MEMBER 테이블에 저장된 해당 회원정보의 마지막 로그인 날짜를 변경하고
   //변경행의 갯수는 반환하는 메소드
   public int updateLastLogin(String id) {
      Connection con=null;
      PreparedStatement pstmt=null;
      int rows=0;
      try {
         con=getConnection();
         
         String sql="update member set last_login=sysdate where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, id);
         
         rows=pstmt.executeUpdate();         
      } catch (SQLException e) {
         System.out.println("[에러]updateLastLogin() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt);
      }
      return rows;
   }
   
   //회원정보를 전달받아 MEMBER 테이블에 저장된 행을 변경하고 변경행의 갯수를 반환하는 메소드
   public int updateMember(MemberDTO member) {
      Connection con=null;
      PreparedStatement pstmt=null;
      int rows=0;
      try {
         con=getConnection();
         
         String sql="update member set passwd=?,name=?,email=?,phone=?,zipcode=?,address1=?,address2=? where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, member.getPasswd());
         pstmt.setString(2, member.getName());
         pstmt.setString(3, member.getEmail());
         pstmt.setString(4, member.getPhone());
         pstmt.setString(5, member.getZipcode());
         pstmt.setString(6, member.getAddress1());
         pstmt.setString(7, member.getAddress2());
         pstmt.setString(8, member.getId());
         
         rows=pstmt.executeUpdate();         
      } catch (SQLException e) {
         System.out.println("[에러]updateMember() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt);
      }
      return rows;
   }
   
   //아이디를 전달받아 MEMBER 테이블에 저장된 행을 삭제하고 삭제행의 갯수를 반환하는 메소드
   public int deleteMember(String id) {
      Connection con=null;
      PreparedStatement pstmt=null;
      int rows=0;
      try {
         con=getConnection();
         
         String sql="delete from member where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, id);
         
         rows=pstmt.executeUpdate();         
      } catch (SQLException e) {
         System.out.println("[에러]deleteMember() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt);
      }
      return rows;
   }
   
   //MEMBER 테이블에 저장된 모든 회원정보를 검색하여 반환하는 메소드
   public List<MemberDTO> selectAllMemberList() {
      Connection con=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      List<MemberDTO> memberList=new ArrayList<MemberDTO>();
      try {
         con=getConnection();
         
         String sql="select * from member order by id";
         pstmt=con.prepareStatement(sql);
         
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            MemberDTO member=new MemberDTO();
            member.setId(rs.getString("id"));
            member.setPasswd(rs.getString("passwd"));
            member.setName(rs.getString("name"));
            member.setEmail(rs.getString("email"));
            member.setPhone(rs.getString("phone"));
            member.setZipcode(rs.getString("zipcode"));
            member.setAddress1(rs.getString("address1"));
            member.setAddress2(rs.getString("address2"));
            member.setJoindate(rs.getString("join_date"));
            member.setLastLogin(rs.getString("last_login"));
            member.setStatus(rs.getInt("status"));
            memberList.add(member);
         }
      } catch (SQLException e) {
         System.out.println("[에러]selectAllMemberList() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt, rs);
      }
      return memberList;
   }
   
   //아이디와 상태를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 상태를 변경하고 변경행의 
   //갯수를 반환하는 메소드
   public int updateStatus(String id,int status) {
      Connection con=null;
      PreparedStatement pstmt=null;
      int rows=0;
      try {
         con=getConnection();
         
         String sql="update member set status=? where id=?";
         pstmt=con.prepareStatement(sql);
         pstmt.setInt(1, status);
         pstmt.setString(2, id);
         
         rows=pstmt.executeUpdate();         
      } catch (SQLException e) {
         System.out.println("[에러]updateStatus() 메소드의 SQL 오류 = "+e.getMessage());
      } finally {
         close(con, pstmt);
      }
      return rows;
   }
   
   //회원관리페이지에서 검색 메소드
   //startRow:
   //endRow:
   //search_type:
   //type:
   //sales_type:
   //min_sales_amount:
   //max_sales_amount:
   //dor_date_kind:
   //ord_start_kind:
   //ord_end_date:
   public List<MemberDTO> selectMemberList(int startRow, int endRow, String search_type, String type, String sales_type,String min_sales_amount,String max_sales_amount, String ord_date_kind, String ord_start_date, String ord_end_date) {
      Connection con =null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<MemberDTO> memberList = new ArrayList<MemberDTO>();
      try {
         con = getConnection();
         
         if(type.equals("") && sales_type.equals("") && type.equals("") && ord_start_date.equals("")) {
         String sql="select*from(select rownum rn,temp.* from(select * from member order by id)temp)where rn between ? and ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         } else if(!type.equals("") && !search_type.equals("") && ord_end_date.equals("")){
          String sql="select*from(select rownum rn,temp.* from(select * from member where "+search_type+" like '%'||?||'%' order by id)temp)where rn between ? and ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, type);  
            pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         } else if(!ord_start_date.equals("")&& type.equals("") && ord_start_date.equals(ord_end_date)) {
            String sql="select*from(select rownum rn,temp.* from(select * from member where id in (select DISTINCT id from shop_order where "+ord_date_kind+" like to_date(?) ))temp)where rn between ? and ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, ord_start_date);  
            pstmt.setInt(2, startRow);
            pstmt.setInt(3, endRow);
            
         } else if(!ord_start_date.equals("")&& type.equals("")) {
            String sql="select*from(select rownum rn,temp.* from(select * from member where id in (select DISTINCT id from shop_order where "+ord_date_kind+" like to_date(?) OR "+ord_date_kind+" between to_Date(?) and to_date(?)))temp)where rn between ? and ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, ord_end_date);  
            pstmt.setString(2, ord_start_date);  
            pstmt.setString(3, ord_end_date);  
            pstmt.setInt(4, startRow);
            pstmt.setInt(5, endRow);
            
         }   else if(!ord_start_date.equals("")&& !type.equals("") && ord_start_date.equals(ord_end_date)) {
            String sql="select*from(select rownum rn,temp.* from(select * from member where id in (select DISTINCT id from shop_order where "+ord_date_kind+" like to_date(?) and "+search_type+" like '%'||?||'%'))temp)where rn between ? and ? ";
            pstmt = con.prepareStatement(sql);            
            pstmt.setString(1, ord_end_date);  
            pstmt.setString(2, type);  
            pstmt.setString(3, ord_start_date);  
            pstmt.setString(4, ord_end_date);  
            pstmt.setInt(5, startRow);
            pstmt.setInt(6, endRow);
         } else if(!ord_start_date.equals("")&& !type.equals("")) {
            String sql="select*from(select rownum rn,temp.* from(select * from member where id in (select DISTINCT id from shop_order where "+ord_date_kind+" like to_date(?) OR "+search_type+" like '%'||?||'%' and "+ord_date_kind+" between to_Date(?) and to_date(?)))temp)where rn between ? and ? ";
            pstmt = con.prepareStatement(sql);            
            pstmt.setString(1, ord_end_date);  
            pstmt.setString(2, type);  
            pstmt.setString(3, ord_start_date);  
            pstmt.setString(4, ord_end_date);  
            pstmt.setInt(5, startRow);
            pstmt.setInt(6, endRow);
         }  
         
         rs=pstmt.executeQuery();
         while(rs.next()) {
            MemberDTO member = new MemberDTO();
            member.setId(rs.getString("id"));
            member.setPasswd(rs.getString("passwd"));
            member.setName(rs.getString("name"));
            member.setEmail(rs.getString("email"));
            member.setPhone(rs.getString("phone"));
            member.setZipcode(rs.getString("zipcode"));
            member.setAddress1(rs.getString("address1"));
            member.setAddress2(rs.getString("address2"));
            member.setJoindate(rs.getString("join_date"));
            member.setLastLogin(rs.getString("last_login"));
            member.setStatus(rs.getInt("status"));
            memberList.add(member);
         }      
      }catch (SQLException e) {
         System.out.println("[에러]selectMemberList() 메소드의 SQL 오류 = "+e.getMessage());
      }finally {
         close(con, pstmt, rs);
      }
      
      return memberList;
   }
   

//아이디 찾기(이름,핸드폰번호로 찾기) 메소드 


      public String id_find(String name,String phone){
     String id = null;
     Connection con = null;   //con 디비정보연결        
     PreparedStatement ps = null; //보안적으로 좋음
     ResultSet rs = null; //resultset 은 디비에서 넘어 온값 저장 
     
     try{
     con = getConnection();
     String sql = "select id from member where name=? and phone=?";
      ps = con.prepareStatement(sql);
      ps.setString(1, name);
      ps.setString(2, phone);
      rs = ps.executeQuery();
      while(rs.next()){
       id = rs.getString("id");
      }
     }catch (SQLException e) {
         System.out.println("[에러]selectMemberList() 메소드의 SQL 오류 = "+e.getMessage());
     }finally{
        close(con, ps, rs);
     }
     return id;
    }
     //아이디 찾기(이름,이메일로 찾기) 메소드 
   
     public String id_find2(String name,String email){
     String id = null;
     Connection con = null;
     PreparedStatement ps = null;
     ResultSet rs = null;
     
     try{
     con = getConnection();
     String sql = "select id from member where name=? and email=?";
      ps = con.prepareStatement(sql);
      ps.setString(1, name);
      ps.setString(2, email);
      rs = ps.executeQuery();
      while(rs.next()){
       id = rs.getString("id");
      }
     }catch (SQLException e) {
         System.out.println("[에러]selectMemberList() 메소드의 SQL 오류 = "+e.getMessage());
     }finally{
        close(con, ps, rs);
     }
     return id;
    }
     
 //비밀번호 찾기     
     public String pw_search(String id , String phone) {
      Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String passwd=null;
        
        try { 
           con=getConnection();
           String sql = "select passwd from member where id=? and phone=?";
           ps=con.prepareStatement(sql);
           ps.setString(1, id);
           ps.setString(2, phone);
           rs= ps.executeQuery();
           while(rs.next()) { //rs 끝날때까지 반복 
              passwd= rs.getString("passwd");
             }
        }catch (SQLException e) {
      System.out.println("[에러]selectMemberList() 메소드의 SQL 오류 = "+e.getMessage());
        }finally{
           System.out.println(passwd);
            close(con, ps, rs);
        }
        return passwd;
           
     }
     
     //새로운 비밀번호로 변경 
     
     
   public int new_passwd(String id , String phone, String newpasswd) {
         Connection con = null;
         PreparedStatement ps = null;
         int rows=0;
     try { 
        con=getConnection();
        
      String sql= "update member set passwd=? where id=? and phone=?";
        ps.setString(1, newpasswd);
        ps.setString(2, id);
        ps.setString(3, phone);
        
        rows=ps.executeUpdate();
        
     }catch (SQLException e) {
       System.out.println("[에러]selectMemberList() 메소드의 SQL 오류 = "+e.getMessage());
     } finally {
         close(con, ps);
      }
      return rows;
   }
   
   public int selectmemberCount(String search_type, String type, String sales_type,String min_sales_amount,String max_sales_amount, String ord_date_kind, String ord_start_date, String ord_end_date) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int count = 0; 
      
      try {
         con= getConnection();
         
         if(type.equals("") && sales_type.equals("") && type.equals("") && ord_start_date.equals("")) {
            String sql="select count(*) from member";
            pstmt=con.prepareStatement(sql);
         } else if(!type.equals("") && !search_type.equals("") && ord_end_date.equals("")) {
            String sql="select count(*) from member where "+search_type+" like '%'||?||'%'";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, type);
         } else if(!ord_start_date.equals("") && (ord_start_date == ord_end_date)) {
            String sql="select count(*) from member where id in (select DISTINCT id from shop_order where "+ord_date_kind+" like to_date(?) )";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, ord_start_date);
         } else if(!ord_start_date.equals("")) {
            String sql="select count(*) from member where id in (select DISTINCT id from shop_order where "+ord_date_kind+" between to_date(?) and to_date(?) )";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1, ord_start_date);
            pstmt.setString(2, ord_end_date);
         }
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            count=rs.getInt(1);
         }
      }catch (SQLException e) {
         System.out.println("[에러]selectmemberCount()메소드의 SQL 오류 = "+e.getMessage());
      }finally {
         close(con, pstmt, rs);
      }
      return count;
   }

}






      
      
      
      
      
      
      
      
      
   
   
