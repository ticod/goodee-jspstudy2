package action.member;

import action.Action;
import action.ActionForward;
import model.mybatis.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PasswordAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberDao dao = new MemberDao();
        String sessionId = (String)request.getSession().getAttribute("login");
        String parameterCurrentPassword = request.getParameter("pass");
        String changePassword = request.getParameter("chgpass");
        String dbPassword = dao.select(sessionId).getPass();

        boolean opener = false; // opener 페이지의 url
        boolean closer = false; // 현재 페이지 close?
        String msg = "비밀번호 오류입니다.";
        String url = "passwordform.me";

        if (parameterCurrentPassword.equals(dbPassword)) {
            opener = true;
            closer = true;
            if (dao.updatePassword(sessionId, changePassword) > 0) {
                msg = "비밀번호 변경 성공";
                url = "info.me?id=" + sessionId;
            } else {
                msg = "비밀번호 변경 실패!";
                url = "updateform.me?id=" + sessionId;
            }
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        request.setAttribute("opener", opener);
        request.setAttribute("closer", closer);

        return new ActionForward();
    }
}
