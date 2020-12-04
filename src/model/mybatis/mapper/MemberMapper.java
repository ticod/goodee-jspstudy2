package model.mybatis.mapper;

import model.member.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface MemberMapper {

    @Insert("insert into member " +
            " (id, pass, name, gender, email, tel, picture) " +
            " values (#{id}, #{pass}, #{name}, #{gender}, #{email}, #{tel}, #{picture})")
    int insert(Member member);

    @Select({"<script>",
            "select * from member",
            "<if test='condition != null'>",
              "<trim prefix='where' prefixOverrides='AND || OR'>",
                "<foreach item='value' index='index' collection='condition'>",
                  " and ${index} = #{value} ",
                "</foreach>",
              "</trim>",
            "</if>",
            "</script>"})
    List<Member> select(@Param("condition") Map<String, Object> map);

//    @Select({"<script>",
//            "select * from member",
//            "<trim prefix='where' prefixOverrides='AND || OR'>",
//            "<if test='#{id} != null'> id = #{id} </if>",
//            "<if test='#{email} != null'> email = #{email} </if>",
//            "<if test='#{tel} != null'> tel = #{tel} </if>",
//            "</trim>",
//            "</script>"})
//    List<Member> select(Map<String, Object> map);

    @Update("update member set " +
            "name = #{name}, gender = #{gender}, email = #{email}, tel = #{tel}, picture = #{picture} " +
            "where id = #{id}")
    int update(Member member);

    @Update("update member " +
            "set pass = #{pass} " +
            "where id = #{id}")
    int updatePassword(@Param("id") String id, @Param("pass") String pass);

    @Delete("delete from member where id = #{id}")
    int delete(String id);
}
