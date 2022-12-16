package com.sample.service;

import org.springframework.stereotype.Service;

import com.sample.vo.EmailVO;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class EmailService {
	private String nickName = "밍찌";
    private String sendMail = "dragon695@naver.com";
    private String username = "dragon695";
    private String password = "rnel5252";

    public boolean mailSend(EmailVO emailvo){
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.naver.com");
        props.put("mail.smtp.port", 465);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", "smtp.naver.com");
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        session.setDebug(true);

        try {
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(sendMail, nickName));		// 별명 설정
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(emailvo.getReceiveMail()));
            mimeMessage.setSubject(emailvo.getTitle());
            mimeMessage.setContent(emailvo.getContent(), "text/html;charset=euc-kr");
            Transport.send(mimeMessage);
            return true;
        } catch (Exception e){
            return false;
        }
    }
}
