package action.member;

import action.Action;
import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
로그인 검증
로그인 상태인 경우 : doExecute
로그아웃 상태인 경우 : 로그인 하세요 출력 후, loginform.me로 이동
id parameter가 존재하는 경우
 - 로그인 정보와 파라미터 정보 비교
 - 관리자가 아니면서, 로그인 정보 != 파라미터 정보
     본인 정보만 수정 가능 메세지 출력, main.me 페이지로 이동
 - 관리자인 경우
 */
public abstract class UserLoginAction implements Action {

    protected String sessionId;
    protected String parameterId;

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        sessionId = (String)request.getSession().getAttribute("login");
        parameterId = request.getParameter("id");

        // 로그아웃 상태
        if (sessionId == null) {
            request.setAttribute("msg", "로그인 후 이용해주세요");
            request.setAttribute("url", "loginform.me");
            return new ActionForward(false, "../alert.jsp");
        }
        
        // 관리자가 아닌 경우
        if (parameterId != null) {
            if (!parameterId.equals(sessionId) && !sessionId.equals("admin")) {
                request.setAttribute("msg", "본인의 정보만 접근 가능합니다.");
                request.setAttribute("url", "main.me");
                return new ActionForward(false, "../alert.jsp");
            }
        }

        return doExecute(request, response);
    }

    public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
