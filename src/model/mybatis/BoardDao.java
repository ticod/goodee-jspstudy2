package model.mybatis;

import model.MyBatisConnection;
import model.board.Board;
import model.member.Member;
import model.mybatis.mapper.BoardMapper;
import model.mybatis.mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDao {

    private final Class<BoardMapper> cls = BoardMapper.class;
    private final Map<String, Object> map = new HashMap<>();

    public int maxNum() {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).maxNum();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return 0;
    }

    public int boardCount() {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).boardCount();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return 0;
    }

    public boolean insert(Board board) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).insert(board) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return false;
    }

    public List<Board> list(int pageNum, int limit) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            map.put("page", (pageNum - 1) * limit);
            map.put("limit", limit);
            return session.getMapper(cls).select(map);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            map.clear();
            MyBatisConnection.close(session);
        }
        return null;
    }

    public Board selectOne(int num) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            map.put("num", num);
            return session.getMapper(cls).select(map).get(0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            map.clear();
            MyBatisConnection.close(session);
        }
        return null;
    }

    public void readcntAdd(int num) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            session.getMapper(cls).readcntAdd(num);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
    }

    public void grpStepAdd(int grp, int grpStep) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            session.getMapper(cls).grpStepAdd(grp, grpStep);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
    }

    public boolean update(Board board) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).update(board) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return false;
    }

    public boolean delete(int num) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).delete(num) > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return false;
    }
}
