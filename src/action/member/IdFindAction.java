package action.member;

import action.Action;
import action.ActionForward;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFindAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String id = new MemberDao().idSearch(email, tel);

        if (id == null) {
            request.setAttribute("msg", "아이디를 찾을 수 없습니다");
            request.setAttribute("url", "idform.me");
            return new ActionForward(false, "../alert.jsp");
        }

        String printId = id.substring(0, id.length() - 2);
        request.setAttribute("id", printId);
        return new ActionForward();
    }
}
