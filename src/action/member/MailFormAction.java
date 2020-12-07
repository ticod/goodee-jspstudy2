package action.member;

import action.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

public class MailAction extends AdminLoginAction {

    @Override
    public ActionForward doExecute(HttpServletRequest request,
                                   HttpServletResponse response)
            throws Exception {

        List<String> list = Arrays.asList(
                request.getParameterValues("mailchk")
        );
        request.setAttribute("list", list);
        return null;

    }

}
