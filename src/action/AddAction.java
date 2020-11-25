package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddAction implements Action{
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        int num1 = Integer.parseInt(request.getParameter("num1"));
        int num2 = Integer.parseInt(request.getParameter("num2"));
        request.setAttribute("result", num1 + num2);
        return new ActionForward(false, "addform.jsp");
    }
}
