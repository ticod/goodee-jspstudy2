/*
member와 다르게 모든 알고리즘을 하나의 class가 관리
 => 요청 : method
 */
package action.board;

import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardAction {
    public ActionForward hello(HttpServletRequest request,
                               HttpServletResponse response) {
        request.setAttribute("hello", "Hello World!");
        return new ActionForward();
    }
}
