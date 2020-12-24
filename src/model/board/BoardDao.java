package model.board;

import model.DbConnection;
import model.MyBatisConnection;
import org.apache.ibatis.session.SqlSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BoardDao {

    private Board setBoard(ResultSet rs) throws SQLException {
        Board b = new Board();
        b.setNum(rs.getInt("num"));
        b.setName(rs.getString("name"));
        b.setPass(rs.getString("pass"));
        b.setSubject(rs.getString("subject"));
        b.setContent(rs.getString("content"));
        b.setFile1(rs.getString("file1"));
        b.setGrp(rs.getInt("grp"));
        b.setGrplevel(rs.getInt("grplevel"));
        b.setGrpstep(rs.getInt("grpstep"));
        b.setReadcnt(rs.getInt("readcnt"));
        b.setRegdate(rs.getTimestamp("regdate"));
        return b;
    }

    public int maxNum() {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement("SELECT ifnull(MAX(num), 0) FROM board");
            rs = pstmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return 0;
    }

    public boolean insert(Board board) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into board" +
                "(num, name, pass, subject, content, file1, regdate, readcnt, " +
                "grp, grplevel, grpstep)" +
                "values (?, ?, ?, ?, ?, ?, now(), 0, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board.getNum());
            pstmt.setString(2, board.getName());
            pstmt.setString(3, board.getPass());
            pstmt.setString(4, board.getSubject());
            pstmt.setString(5, board.getContent());
            pstmt.setString(6, board.getFile1());
            pstmt.setInt(7, board.getGrp());
            pstmt.setInt(8, board.getGrplevel());
            pstmt.setInt(9, board.getGrpstep());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return false;
    }

    public int boardCount() {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = conn.prepareStatement("select count(*) from board");
            rs = pstmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return 0;
    }

    public List<Board> list(int pageNum, int limit) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Board> list = new ArrayList<>();

        // limit X, Y
        // X번째 row부터 Y개만큼 가져온다.
        // oracle에서는 rownum을 사용한다.
        String sql = "select * from board order by grp desc, grpstep limit ?, ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (pageNum - 1) * limit);
            pstmt.setInt(2, limit);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(setBoard(rs));
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return null;
    }

    public Board selectOne(int num) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from board where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return setBoard(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, rs);
        }
        return null;
    }

    public void readcntAdd(int num) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update board set readcnt = readcnt + 1 where num = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
    }

    public void grpStepAdd(int grp, int grpStep) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update board set grpstep = grpstep + 1 where grp = ? and grpstep > ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, grp);
            pstmt.setInt(2, grpStep);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
    }

    public boolean update(Board board) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "update board set" +
                " name = ?, subject = ?, content = ?, file1 = ?" +
                "where num = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getName());
            pstmt.setString(2, board.getSubject());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.getFile1());
            pstmt.setInt(5, board.getNum());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return false;
    }

    public boolean delete(int num) {
        Connection conn = DbConnection.getConnection();
        PreparedStatement pstmt = null;
        String sql = "delete from board where num = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbConnection.close(conn, pstmt, null);
        }
        return false;
    }
}
