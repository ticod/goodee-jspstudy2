package action.member;

import action.Action;
import action.ActionForward;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordFindAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String pw = new MemberDao().pwSearch(id, email, tel);

        if (pw == null) {
            request.setAttribute("msg", "비밀번호를 찾을 수 없습니다");
            request.setAttribute("url", "pwform.me");
            return new ActionForward(false, "../alert.jsp");
        }

        String printPw = id.substring(2);
        request.setAttribute("pw", printPw);
        return new ActionForward();
    }
}