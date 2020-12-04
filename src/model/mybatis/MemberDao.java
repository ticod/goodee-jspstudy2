package model.mybatis;

import model.MyBatisConnection;
import model.member.Member;
import model.mybatis.mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberDao {

    private final Class<MemberMapper> cls = MemberMapper.class;
    private Map<String, Object> map = new HashMap<>();

    public int insert(Member member) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).insert(member);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return 0;
    }

    public Member select(String id) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            map.put("id", id);
            return session.getMapper(cls).select(map).get(0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            map.clear();
            MyBatisConnection.close(session);
        }
        return null;
    }
    
    public List<Member> select() {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).select(null);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return null;
    }

    public String idSearch(String email, String tel) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            map.put("email", email);
            map.put("tel", tel);
            return session.getMapper(cls).select(map).get(0).getId();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            map.clear();
            MyBatisConnection.close(session);
        }
        return null;
    }

    public String pwSearch(String id, String email, String tel) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            map.put("id", id);
            map.put("email", email);
            map.put("tel", tel);
            return session.getMapper(cls).select(map).get(0).getPass();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            map.clear();
            MyBatisConnection.close(session);
        }
        return null;
    }

    public int update(Member member) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).update(member);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return 0;
    }

    public int updatePassword(String id, String password) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).updatePassword(id, password);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return 0;
    }

    public int delete(String id) {
        SqlSession session = MyBatisConnection.getConnection();

        try {
            return session.getMapper(cls).delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            MyBatisConnection.close(session);
        }
        return 0;
    }
}
