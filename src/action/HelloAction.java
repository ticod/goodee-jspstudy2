package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("hello", "Hello World");
        return new ActionForward(false, "hello.jsp");
    }
}
