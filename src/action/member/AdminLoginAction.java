package action.member;

import action.Action;
import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
관리자 로그인 검증
로그아웃 상태인 경우 : 로그인 하세요 출력 후, loginform.me로 이동
로그인 상태인 경우
  1. 일반 사용자 : main.me 페이지 이동
  2. doExecute() 메서드 호출
 */
public abstract class AdminLoginAction implements Action {

    protected String sessionId;

    @Override
    public ActionForward execute(HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
        sessionId = (String)request.getSession().getAttribute("login");

        /* 로그아웃 상태 */
        if (sessionId == null) {
            request.setAttribute("msg", "로그인 후 이용해주세요");
            request.setAttribute("url", "loginform.me");
            return new ActionForward(false, "../alert.jsp");
        }
        
        /* 관리자가 아닌 경우 */
        if (!sessionId.equals("admin")) {
            request.setAttribute("msg", "관리자만 접근 가능합니다.");
            request.setAttribute("url", "main.me");
            return new ActionForward(false, "../alert.jsp");
        }

        return doExecute(request, response);
    }

    public abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
