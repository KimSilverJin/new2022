package com.sample.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; 
	// 난수 발생(여러분들 맘대러)
	
		public void makeRandomNumber() {
			// 난수의 범위 111111 ~ 999999 (6자리 난수)
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			if(checkNum <= 999999)
			authNumber = checkNum;
		}
	
				//이메일 보낼 양식! 
		public String joinEmail(String email) {
			makeRandomNumber();
			String setFrom = ".com"; // email-config에 설정한 자신의 이메일 주소를 입력 
			String toMail = email;
			String title = "회원 가입 인증 이메일 입니다."; // 이메일 제목 
			String content = 
					"<h3>이지풋볼을 방문해주셔서 감사합니다.</h3>" + 	//html 형식으로 작성 ! 
	                "<br>" + 
				    "<h1>인증 번호는 [" + authNumber + "]입니다.</h3>" + 
				    "<br>" + 
				    "<h3>해당 인증번호를 인증번호 확인란에 기입하여 주세요.</h3>"; //이메일 내용 삽입
			mailSend(setFrom, toMail, title, content);
			return Integer.toString(authNumber);
		}
		
		//이메일 전송 메소드
		public void mailSend(String setFrom, String toMail, String title, String content) { 
			System.out.println("투메일에 이메일 들어와? : " +toMail);
			// 메일 제목, 내용
			String subject = "이지풋볼 인증번호 입니다";
			
			// 보내는 사람
			String from = "dragon695@naver.com";
			
			// 받는 사람
//			String[] to = new String[1];
//			to[0] = toMail;
//			to[1] = "mute3489@naver.com";
			
//			System.out.println("to에 이메일 들어와? : " +to[0]);
			try {
				// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

				// 메일 내용을 채워줌
				mailHelper.setFrom(from);	// 보내는 사람 셋팅
				mailHelper.setTo(toMail);		// 받는 사람 셋팅
				mailHelper.setSubject(subject);	// 제목 셋팅
				mailHelper.setText(content,true);	// 내용 셋팅

				// 메일 전송
				mailSender.send(mail);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
				
		}
}
