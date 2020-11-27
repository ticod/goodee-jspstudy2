package action.member;

import action.ActionForward;
import model.member.Member;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ListAction extends AdminLoginAction {
    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<Member> members = new MemberDao().selectAll();
        request.setAttribute("members", members);
        return new ActionForward();
    }
}
