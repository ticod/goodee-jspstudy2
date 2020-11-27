package action.member;

import action.Action;
import action.ActionForward;
import model.member.Member;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteAction extends UserLoginAction {
    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (parameterId.equals("admin")) {
            request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
            request.setAttribute("url", "main.me");
            return new ActionForward(false, "../alert.jsp");
        }

        MemberDao dao = new MemberDao();
        String parameterPassword = request.getParameter("pass");
        String dbPassword = dao.selectOne(sessionId).getPass();
        boolean isAdmin = sessionId.equals("admin");

        String msg = null;
        String url = isAdmin ? "list.me" : "loginform.me";

        if (parameterPassword.equals(dbPassword)) {
            if (dao.delete(parameterId) > 0) {
                /* DB에서 삭제 성공시 */
                if (isAdmin) {
                    /* 현재 로그인한 사람이 관리자면 */
                    msg = parameterId + " 사용자 강제 탈퇴 성공";
                } else {
                    msg = parameterId + "님의 회원 탈퇴가 완료되었습니다.";
                    request.getSession().invalidate();
                }
            } else {
                /* 탈퇴 실패 */
                msg = parameterId + "님의 탈퇴에서 오류 발생";
                if (!isAdmin) {
                    url = "info.me?id=" + parameterId;
                }
            }
        } else {
            /* 비밀번호 오류 */
            msg = sessionId + "님의 비밀번호가 틀립니다.";
            url = "deleteform.me?id=" + parameterId;
        }

        request.setAttribute("msg", msg);
        request.setAttribute("url", url);
        return new ActionForward(false, "../alert.jsp");
    }
}
