package action.member;

import action.Action;
import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.getSession().invalidate();
        request.setAttribute("msg", "로그아웃하셨습니다");
        request.setAttribute("url", "loginform.me");
        return new ActionForward(false, "../alert.jsp");
    }
}
