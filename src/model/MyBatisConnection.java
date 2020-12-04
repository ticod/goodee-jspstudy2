package model;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisConnection {

    private final static String Resource = "model/mybatis/mybatis-config.xml";
    private static final SqlSessionFactory sqlMap;

    private MyBatisConnection() {}

    static {
        InputStream input = null;

        try {
            input = Resources.getResourceAsStream(Resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        sqlMap = new SqlSessionFactoryBuilder().build(input);
    }

    public static SqlSession getConnection() {
        return sqlMap.openSession();
    }

    public static void close(SqlSession session) {
        session.commit();
        session.close();
    }

}
