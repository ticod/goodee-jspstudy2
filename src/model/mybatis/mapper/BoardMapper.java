package model.mybatis.mapper;

import model.board.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

    @Select("select ifnull(MAX(num), 0) from board")
    int maxNum();

    @Select({"<script>",
            "select count(*) from board ",
            "<if test='col1 != null'> where ${col1} like '%${find}%' </if>",
            "<if test='col2 != null'> or ${col2} like '%${find}%' </if>",
            "<if test='col3 != null'> or ${col3} like '%${find}%' </if>",
            "</script>"})
    int boardCount(Map<String, Object> map);

    @Select({"<script>",
            "select * from board ",
            "<if test='num != null'> where num = #{num} </if>",
            "<if test='col1 != null'> where ${col1} like '%${find}%' </if>",
            "<if test='col2 != null'> or ${col2} like '%${find}%' </if>",
            "<if test='col3 != null'> or ${col3} like '%${find}%' </if>",
            "<if test='start != null'> order by grp desc, ",
            "grpstep limit #{start}, #{limit} </if>",
            "</script>"})
    List<Board> select(Map<String, Object> map);

    @Insert("insert into board " +
            "(num, name, pass, subject, content, file1, " +
            "regdate, readcnt, grp, grplevel, grpstep) " +
            "values " +
            "(#{num}, #{name}, #{pass}, #{subject}, #{content}, #{file1}, " +
            "now(), 0, #{grp}, #{grplevel}, #{grpstep})")
    int insert(Board board);

    @Update("update board set readcnt = readcnt + 1 where num = #{num}")
    void readcntAdd(int num);

    @Update("update board set grpstep = grpstep + 1 where grp = #{grp} and grpstep > #{grpStep}")
    void grpStepAdd(@Param("grp") int grp, @Param("grpStep") int grpStep);

    @Update("update board set " +
            "name = #{name}, subject = #{subject}, " +
            "content = #{content}, file1 = #{file1} " +
            "where num = #{num}")
    int update(Board board);

    @Delete("delete from board where num = #{num}")
    int delete(int num);

    @Select("select name, count(*) cnt from board group by name " +
            "having count(*) > 1 order by cnt desc")
    List<Map<String, Integer>> graph();

    @Select("select date_format(regdate, '%Y-%m-%d') regdate, count(*) cnt from board group by date_format(regdate, '%Y-%m-%d') " +
            "having count(*) > 1 order by date_format(regdate, '%Y-%m-%d') limit 7")
    List<Map<String, Object>> barGraph();
}
