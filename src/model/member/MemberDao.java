package model.member;

import model.DbConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao {

    private Member setMember(ResultSet rs) throws SQLException {
        Member member = new Member();
        member.setId(rs.getString("id")); // column 명으로 접근
        member.setPass(rs.getString("pass"));
        member.setName(rs.getString("name"));
        member.setGender(rs.getInt("gender"));
        member.setTel(rs.getString("tel"));
        member.setEmail(rs.getString("email"));
        member.setPicture(rs.getString("picture"));
        return member;
    }

    /* insert into member (id, pass, name, gender, tel, picture)
    * values (?, ?, ?, ?, ?, ?, ?) */
    public int insert(Member mem) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into member" +
                " (id, pass, name, gender, email, tel, picture)" +
                " values (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mem.getId());
            pstmt.setString(2, mem.getPass());
            pstmt.setString(3, mem.getName());
            pstmt.setInt(4, mem.getGender());
            pstmt.setString(5, mem.getEmail());
            pstmt.setString(6, mem.getTel());
            pstmt.setString(7, mem.getPicture());
            return pstmt.executeUpdate(); // 성공시 양수 (> 0)를 return = 변경된 레코드 수
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return 0;
    }

    /* select * from member where id = ? */
    public Member selectOne(String id) {
        String sql = "select * from member where id = ?";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return setMember(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return null;
    }

    public int update(Member member) {
        String sql = "update member set pass = ?, name = ?, gender = ?, tel = ?, email = ?, picture = ? where id = ?";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getPass());
            pstmt.setString(2, member.getName());
            pstmt.setInt(3, member.getGender());
            pstmt.setString(4, member.getTel());
            pstmt.setString(5, member.getEmail());
            pstmt.setString(6, member.getPicture());
            pstmt.setString(7, member.getId());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return 0;
    }

    public List<Member> selectAll() {
        String sql = "select * from member";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Member> members = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                members.add(setMember(rs));
            }
            return members;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return null;
    }

    public int delete(String id) {
        String sql = "delete from member where id = ?";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return 0;
    }

    public int updatePassword(String id, String pw) {
        String sql = "update member set pass = ? where id = ?";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pw);
            pstmt.setString(2, id);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return 0;
    }

    public String idSearch(String email, String tel) {
        String sql = "select id from member where email = ? and tel = ?";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, tel);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return null;
    }

    public String pwSearch(String id, String email, String tel) {
        String sql = "select pass from member where id = ? and email = ? and tel = ?";
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            pstmt.setString(3, tel);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString("pass");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return null;
    }
}
