package action.member;

import action.Action;
import action.ActionForward;
import model.member.Member;
import model.mybatis.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        Member mem = new MemberDao().select(id);

        // id에 해당하는 member가 없는 경우
        if (mem == null) {
            request.setAttribute("msg", "아이디를 확인하세요");
            request.setAttribute("url", "loginform.me");
        } else {
            // 비밀번호가 일치하는 경우
            if (pass.equals(mem.getPass())) {
                request.getSession().setAttribute("login", id);
                request.setAttribute("msg", mem.getName() + "님이 로그인 했습니다");
                request.setAttribute("url", "main.me");
            } else {
                request.setAttribute("msg", "비밀번호를 확인하세요");
                request.setAttribute("url", "loginform.me");
            }
        }
        return new ActionForward(false, "../alert.jsp");
    }
}
