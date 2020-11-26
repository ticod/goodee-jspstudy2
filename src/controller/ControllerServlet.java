package controller;

import action.Action;
import action.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@WebServlet(urlPatterns = {"*.me"}, // *.me url 요청은 모두 해당 서블릿으로 들어옴
        initParams = {
        @WebInitParam(name = "properties",
                value="action.properties") // 해당 parameter는 config 객체로 들어감
        })
public class ControllerServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Map<String, Action> commandMap = new HashMap<>();

    public ControllerServlet() {
        super();
    }

    @Override // Servlet 호출시 초기 1회 호출되는 메서드
    public void init(ServletConfig config) throws ServletException {
        // ServletConfig : 위 어노테이션에서
        // WebInitParam으로 전달한 객체가 전달됨 (Map 형식)

        // properties라는 이름의 value를 가져옴. => action.properties
        String props = config.getInitParameter("properties");

        // Properties : Hashtable의 하위 클래스. 즉 맵 객체임
        // Map<String, String> 형식
        Properties pr = new Properties();
        FileInputStream f = null;

        try {
            // action.properties 파일을 읽기 위한 입력 스트림
            f = new FileInputStream(config.getServletContext().getRealPath("/") + "WEB-INF/" + props);
            // 줄 단위, =를 중심으로 우측은 key, 좌측은 value
            // Map 객체로 해서 넣음
            pr.load(f);
        } catch (IOException e) {
            throw new ServletException(e);
        } finally {
            try {
                if (f != null) f.close();
            } catch (IOException e) {}
        }

        for (Object k : pr.keySet()) {
            String command = (String)k;
            String className = pr.getProperty(command);
            try {
                // action.*을 class로 만듦.
                Class commandClass = Class.forName(className.trim());

                // newInstance(): 객체화, commandObj에 저장
                Object commandObj = commandClass.newInstance();

                // command를 key로, 객체를 value로
                // Action 인터페이스를 구현했기 때문에 형변환 가능
                commandMap.put(command, (Action)commandObj);
            } catch (Exception e) {
                throw new ServletException(e);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");

        Action action = null;
        ActionForward forward = null;
        String command = null;

        try {
            // getRequestURI() : /model2/hello.me
            // getContextPath() : /
            command = request.getRequestURI().substring(request.getContextPath().length());
            action = commandMap.get(command);
            forward = action.execute(request, response);
        } catch (NullPointerException e) {
            forward = new ActionForward();
        } catch (Exception e) {
            throw new ServletException();
        }

        if (forward != null) {
            if (forward.isRedirect()) {
                response.sendRedirect(forward.getView());
            } else {
                // forward.getView() : *.jsp
                if (forward.getView() == null) {
                    forward.setView(command.replace(".me", ".jsp"));
                }
                RequestDispatcher disp = request.getRequestDispatcher(forward.getView());
                disp.forward(request, response);
            }
        }
    }
}
