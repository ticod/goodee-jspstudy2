package action.member;

import action.ActionForward;
import model.member.Member;
import model.member.MemberDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InfoAction extends UserLoginAction {

    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Member member =  new MemberDao().selectOne(parameterId);
        request.setAttribute("member", member);
        return new ActionForward();
    }
}
