package action.member;

import action.ActionForward;
import model.member.Member;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction extends UserLoginAction {

    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        if (parameterId.equals("admin")) {
            request.setAttribute("msg", "관리자는 탈퇴할 수 없습니다.");
            request.setAttribute("url", "main.me");
            return new ActionForward(false, "../alert.jsp");
        }

        return new ActionForward();
    }
}
