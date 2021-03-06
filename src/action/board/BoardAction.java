/*
member와 다르게 모든 알고리즘을 하나의 class가 관리
 => 요청 : method
 */
package action.board;

import action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import model.board.Board;
import model.mybatis.BoardDao;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


public class BoardAction {
    public ActionForward hello(HttpServletRequest request,
                               HttpServletResponse response) {
        request.setAttribute("hello", "Hello World!");
        return new ActionForward();
    }

    public ActionForward write(HttpServletRequest request,
                               HttpServletResponse response) {
        String path = request.getServletContext().getRealPath("/")
                + "model2/board/file/";
        File f = new File(path);
        if (!f.exists()) {
            f.mkdirs();
        }

        MultipartRequest multi = null;
        Board board = new Board();
        BoardDao dao = new BoardDao();
        String msg = "게시물 등록 실패";
        String url = "writeform.do";

        try {
            multi = new MultipartRequest(
                    request, path, 10 * 1024 * 1024, "utf-8");
            board.setName(multi.getParameter("name"));
            board.setPass(multi.getParameter("pass"));
            board.setSubject(multi.getParameter("subject"));
            board.setContent(multi.getParameter("content"));
            board.setFile1(multi.getFilesystemName("file1"));
        } catch (IOException e) {
            e.printStackTrace();
            return new ActionForward(false, "../alert.jsp");
        }

        int num = dao.maxNum();
        board.setNum(++num);
        board.setGrp(num);

        if (dao.insert(board)) {
            return new ActionForward(true, "info.do?num=" + num);
        } else {
            request.setAttribute("msg", msg);
            request.setAttribute("url", url);
            return new ActionForward(false, "../alert.jsp");
        }
    }

    public ActionForward list(HttpServletRequest request,
                              HttpServletResponse response) {
        BoardDao dao = new BoardDao();

        String find = request.getParameter("find");
        String column = request.getParameter("column");

        if (column == null || column.trim().equals("")
                || find == null || find.trim().equals("")) {
            column = null;
            find = null;
        }

        int pageNum = 1;
        try {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
        } catch (NumberFormatException e) {}
        int limit = 10;
        List<Board> boardList = new BoardDao().list(pageNum, limit, column, find);
        int boardCount = dao.boardCount(column, find);

        int maxPage = (int)((double) boardCount / limit + 0.95);
        int startPage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
        int endPage = startPage + 9;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        int boardNum = boardCount - (pageNum - 1) * limit;

        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String today = sf.format(new Date());

        request.setAttribute("boardCount", boardCount);
        request.setAttribute("boardList", boardList);
        request.setAttribute("pageNum", pageNum);
        request.setAttribute("maxPage", maxPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("boardNum", boardNum);
        request.setAttribute("today", today);
        return new ActionForward();
    }

    public ActionForward info(HttpServletRequest request,
                              HttpServletResponse response) {
        int num = 0;
        try {
            num = Integer.parseInt(request.getParameter("num"));
        } catch (NumberFormatException e) {}
        
        if (num == 0) {
            request.setAttribute("msg", "잘못된 접근입니다");
            request.setAttribute("url", "list.do");
            return new ActionForward(false, "../alert.jsp");
        } else {
            BoardDao dao = new BoardDao();
            if (request.getRequestURI().contains("info")) {
                dao.readcntAdd(num);  // 조회수 상승
            }
            Board board = dao.selectOne(num);
            request.setAttribute("board", board);
            return new ActionForward();
        }
    }

    public ActionForward reply(HttpServletRequest request,
                              HttpServletResponse response) {
        String path = request.getServletContext().getRealPath("/")
                + "model2/board/file/";
        File f = new File(path);
        MultipartRequest multi = null;
        Board board = new Board();
        BoardDao dao = new BoardDao();

        if (!f.exists()) {
            f.mkdirs();
        }

        try {
            multi = new MultipartRequest(
                    request, path, 10 * 1024 * 1024, "utf-8");
            int num = 0;
            try {
                num = Integer.parseInt(multi.getParameter("num"));
            } catch (NumberFormatException e) {}
            if (num == 0) {
                request.setAttribute("msg", "잘못된 접근입니다");
                request.setAttribute("url", "list.do");
                return new ActionForward(false, "../alert.jsp");
            }
            board.setName(multi.getParameter("name"));
            board.setPass(multi.getParameter("pass"));
            board.setSubject(multi.getParameter("subject"));
            board.setContent(multi.getParameter("content"));
            board.setFile1(multi.getFilesystemName("file1"));
            board.setGrp(Integer.parseInt(multi.getParameter("grp")));
            board.setGrplevel(Integer.parseInt(multi.getParameter("grplevel")));
            board.setGrpstep(Integer.parseInt(multi.getParameter("grpstep")));
        } catch (IOException e) {
            e.printStackTrace();
            return new ActionForward(false, "../alert.jsp");
        }

        dao.grpStepAdd(board.getGrp(), board.getGrpstep());
        board.setNum(dao.maxNum() + 1);
        board.setGrplevel(board.getGrplevel() + 1);
        board.setGrpstep(board.getGrpstep() + 1);

        String msg = "답변 등록 실패";
        String url = "replyform.jsp?num=" + board.getNum();

        if (dao.insert(board)) {
            return new ActionForward(true, "info.do?num=" + board.getNum());
        } else {
            request.setAttribute("msg", msg);
            request.setAttribute("url", url);
            return new ActionForward(false, "../alert.jsp");
        }
    }

    public ActionForward update(HttpServletRequest request,
                               HttpServletResponse response) {
        MultipartRequest multi = null;
        String path = request.getServletContext().getRealPath("/")
                + "model2/board/file/";
        File f = new File(path);
        if (!f.exists()) {
            f.mkdirs();
        }

        try {
            multi = new MultipartRequest(
                    request, path, 10 * 1024 * 1024, "utf-8");
        } catch (IOException e) {
            e.printStackTrace();
            return new ActionForward(false, "../alert.jsp");
        }

        int num = 0;
        try {
            num = Integer.parseInt(multi.getParameter("num"));
        } catch (NumberFormatException e) {}
        if (num == 0) {
            request.setAttribute("msg", "잘못된 접근입니다");
            request.setAttribute("url", "list.do");
            return new ActionForward(false, "../alert.jsp");
        }

        Board board = new Board();
        BoardDao dao = new BoardDao();

        String msg = "게시물 수정 실패";
        String url = "updateform.do?num=" + num;
        String dbPassword = dao.selectOne(num).getPass();
        String password = multi.getParameter("pass");

        if (!password.equals(dbPassword)) {
            request.setAttribute("msg", "비밀번호를 확인하세요");
            request.setAttribute("url", url);
            return new ActionForward(false, "../alert.jsp");
        }

        board.setNum(num);
        board.setName(multi.getParameter("name"));
        board.setSubject(multi.getParameter("subject"));
        board.setContent(multi.getParameter("content"));
        board.setFile1(multi.getFilesystemName("file1"));

        if (board.getFile1() == null || board.getFile1().equals("")) {
            board.setFile1(multi.getParameter("file2"));
        }

        if (dao.update(board)) {
            return new ActionForward(true, "info.do?num=" + num);
        } else {
            request.setAttribute("msg", msg);
            request.setAttribute("url", url);
            return new ActionForward(false, "../alert.jsp");
        }
    }

    public ActionForward delete(HttpServletRequest request,
                                HttpServletResponse response) {
        String pass = request.getParameter("pass");
        int num = 0;
        try {
            num = Integer.parseInt(request.getParameter("num"));
        } catch (NumberFormatException e) {}

        String msg = "잘못된 접근입니다.";
        String url = "list.do";
        if (num != 0) {
            BoardDao dao = new BoardDao();
            if (!pass.equals(dao.selectOne(num).getPass())) {
                msg = "비밀번호가 틀렸습니다.";
                url = "deleteform.do?num=" + num;
            } else {
                if (dao.delete(num)) {
                    msg = "삭제 성공";
                } else {
                    msg = "삭제 실패";
                    url = "deleteform.do?num=" + num;
                }
            }
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false, "../alert.jsp");
    }

    public ActionForward imgupload(HttpServletRequest request,
                                   HttpServletResponse response)
            throws IOException {
        String path = request.getServletContext().getRealPath("/")
                + "model2/board/imgfile/";
        File f = new File(path);
        if (!f.exists()) f.mkdirs();
        MultipartRequest multi = new MultipartRequest(
                request, path, 10 * 1024 * 1024, "utf-8"
        );
        String fileName = multi.getFilesystemName("upload");
        request.setAttribute("fileName", fileName);
        request.setAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));
        return new ActionForward(false, "ckeditor.jsp");
    }

    public ActionForward pieGraph(HttpServletRequest request,
                               HttpServletResponse response) {

        BoardDao dao = new BoardDao();
        List<Map<String, Integer>> list = dao.boardGraph();
        StringBuilder json = new StringBuilder("[");
        int i = 0;
        for (Map<String, Integer> map : list) {
            for (Map.Entry<String, Integer> entry : map.entrySet()) {
                if (entry.getKey().equals("name")) {
                    json.append("{\"name\":\"")
                            .append(entry.getValue())
                            .append("\",");
                }
                if (entry.getKey().equals("cnt")) {
                    json.append("\"cnt\":")
                            .append(entry.getValue())
                            .append("}");
                }
            }
            i++;
            if (i < list.size()) {
                json.append(",");
            }
        }

        json.append("]");
        request.setAttribute("json", json.toString().trim());

        return new ActionForward();
    }

    public ActionForward barGraph(HttpServletRequest request,
                                  HttpServletResponse response) {
        BoardDao dao = new BoardDao();
        List<Map<String, Object>> list = dao.barGraph();
        request.setAttribute("list", list);
        return new ActionForward();
    }

    public ActionForward exchange(HttpServletRequest request,
                                  HttpServletResponse response) {

        String URL = "https://www.koreaexim.go.kr/site/program/financial/exchange?menuid=001001004002001";
        Document doc = null;
        List<String> list = new ArrayList<>();
        List<String> list2 = new ArrayList<>();

        try {
            doc = Jsoup.connect(URL).get();
            Elements e1 = doc.select(".tc");
            Elements e2 = doc.select(".tl2.bdl");

            for (int i = 0; i < e1.size(); i++) {
                if (e1.get(i).html().equals("USD")) {
                    list.add(e1.get(i).html());
                    for (int j = 1; j <= 6; j++) {
                        list.add(e1.get(i + j).html());
                    }
                    break;
                }
            }

            for (Element element : e2) {
                if (element.html().contains("미국")) {
                    list2.add(element.html());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("list", list); // 통화코드, 환율 정보
        request.setAttribute("list2", list2); // 국가 명
        request.setAttribute("today", new Date());

        return new ActionForward();
    }

    public ActionForward exchange2(HttpServletRequest request,
                                  HttpServletResponse response) {

        Map<String, List<String>> map = new HashMap<>();
        try {
            String kebhana = Jsoup.connect("http://fx.kebhana.com/FER1101M.web").get().text();
            String strJson = kebhana.substring(kebhana.indexOf("{"));
            JSONParser jsonParser = new JSONParser();
            JSONObject json = (JSONObject) jsonParser.parse(strJson.trim());
            JSONArray array = (JSONArray) json.get("리스트");
            for (int i = 0; i < array.size(); i++) {
                JSONObject obj = (JSONObject) array.get(i);
                if (obj.get("통화명").toString().contains("미국")
                    || obj.get("통화명").toString().contains("일본")
                    || obj.get("통화명").toString().contains("유로")
                    || obj.get("통화명").toString().contains("중국")
                    || obj.get("통화명").toString().contains("영국")) {

                    String str = obj.get("통화명").toString();
                    String[] sarr = str.split(" ");
                    String key = sarr[0];
                    String code = sarr[1];
                    List<String> list = new ArrayList<>();
                    list.add(code);
                    list.add(obj.get("매매기준율").toString());
                    list.add(obj.get("현찰파실때").toString());
                    list.add(obj.get("현찰사실때").toString());
                    map.put(key, list);
                }
            }
            request.setAttribute("date", json.get("날짜").toString());
            request.setAttribute("map", map);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ActionForward();
    }
}
