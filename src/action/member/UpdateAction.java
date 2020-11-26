package action.member;

import action.ActionForward;
import model.member.Member;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateAction extends UserLoginAction {

    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        MemberDao dao = new MemberDao();

        Member member = new Member();
        member.setId(request.getParameter("id"));
        member.setPass(request.getParameter("pass"));
        member.setName(request.getParameter("name"));
        member.setGender(Integer.parseInt(request.getParameter("gender")));
        member.setTel(request.getParameter("tel"));
        member.setEmail(request.getParameter("email"));
        member.setPicture(request.getParameter("picture"));

        Member dbMember = dao.selectOne(sessionId);

        String msg = "비밀번호가 틀렸습니다.";
        String url = "updateform.me?id=" + member.getId();

        if (member.getPass().equals(dbMember.getPass())) {
            if (dao.update(member) > 0) {
                return new ActionForward(true, "info.me?id=" + member.getId());
            } else {
                msg = "수정 실패! 관리자에게 문의하세요.";
            }
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false, "../alert.jsp");
    }
}
