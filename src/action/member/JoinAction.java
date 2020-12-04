package action.member;

import action.Action;
import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.member.Member;
import model.mybatis.MemberDao;

public class JoinAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member mem = new Member();
        mem.setId(request.getParameter("id"));
        mem.setPass(request.getParameter("pass"));
        mem.setName(request.getParameter("name"));
        mem.setGender(Integer.parseInt(request.getParameter("gender")));
        mem.setTel(request.getParameter("tel"));
        mem.setEmail(request.getParameter("email"));
        mem.setPicture(request.getParameter("picture"));

        String msg = "회원가입 실패";
        String url = "joinform.me";
        if (new MemberDao().insert(mem) > 0) {
            msg = mem.getName() + "님 회원가입 완료";
            url = "loginform.me";
        }
        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false, "../alert.jsp");
    }
}
