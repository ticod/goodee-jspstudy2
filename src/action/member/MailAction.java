package action.member;

import action.ActionForward;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Properties;

public class MailAction extends AdminLoginAction {

    @Override
    public ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        try {
            String sendId = request.getParameter("naverId");
            String sendPw = request.getParameter("naverPw");
            String recipient = request.getParameter("recipient");
            String title = request.getParameter("title");
            String mType = request.getParameter("mtype");
            String contents = request.getParameter("contents");

            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.naver.com");
            props.put("mail.smtp.port", "465");
            props.put("mail.smtp.starttls.enable", "true"); // 없어도 됨
            props.put("mail.smtp.auth", "true"); // 인증 받아서 보냄
            props.put("mail.debug", "true"); // 보통 개발시에 true, 배포시 false로 둠. 시간이 오래 걸림
            props.put("mail.smtp.user", sendId); // 전송자
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.socketFactory.fallback", "false");

            MyAuthenticator auth = new MyAuthenticator(sendId, sendPw);
            Session session = Session.getInstance(props, auth);
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress(sendId));

            String[] recAddr = recipient.split(",");
            InternetAddress[] address = new InternetAddress[recAddr.length];
            for (int i = 0; i < recAddr.length; i++) {
                address[i] = new InternetAddress(recAddr[i]);
            }

            mail.setRecipients(Message.RecipientType.TO, address);
            mail.setSubject(title);
            mail.setSentDate(new Date());
            mail.setText(contents);

            MimeMultipart multipart = new MimeMultipart();
            MimeBodyPart body = new MimeBodyPart();
            body.setContent(contents, mType);
            multipart.addBodyPart(body);
            mail.setContent(multipart);

            Transport.send(mail);

            request.setAttribute("msg", String.join("\\n", recipient + "\\n메일 전송 완료."));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "메일 전송 중 오류 발생!");
        }
        request.setAttribute("url", "list.me");
        return new ActionForward(false, "../alert.jsp");
    }

    private final class MyAuthenticator extends Authenticator {

        private String id;
        private String pw;

        public MyAuthenticator(String id, String pw) {
            this.id = id;
            this.pw = pw;
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(id, pw);
        }
    }

}
