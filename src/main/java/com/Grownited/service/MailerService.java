package com.Grownited.service;

import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.Grownited.entity.UserEntity;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerService {
	
	@Autowired
	JavaMailSender javaMailSender;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	public void sendWelcomeMail(UserEntity user)
	{
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		Resource resource = resourceLoader.getResource("classpath:templates/WelcomeMailTemplate.html");
		
		MimeMessageHelper hepler;
		try {
			String html = new String(resource.getInputStream().readAllBytes(), StandardCharsets.UTF_8);

			String body = html.replace("${name}", user.getFirstName()).replace("${email}", user.getEmail())
					.replace("${loginUrl}", "http://localhost:9999/login").replace("${companyName}", "CodeVerse");

			hepler = new MimeMessageHelper(message, true);
			hepler.setTo(user.getEmail());
			hepler.setSubject("CodeVerse - Welcome aboard !!! ");
			hepler.setText(body, true);

			javaMailSender.send(message);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	public void sendOtpMail(String toEmail, String otp) {
	    try {
	        MimeMessage message = javaMailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);
	        
	        helper.setTo(toEmail);
	        helper.setSubject("Your CodeVerse Password Reset OTP");
	        
	        // You can use a simple HTML string here
	        String content = "<h3>Password Reset Request</h3>" +
	                         "<p>Use the following OTP to reset your password:</p>" +
	                         "<h2 style='color:#007bff;'>" + otp + "</h2>" +
	                         "<p>This code will expire soon.</p>";
	        
	        helper.setText(content, true);
	        javaMailSender.send(message);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public void sendJudgeInviteMail(UserEntity user, String tempPassword) {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
			String body = "<div style='font-family:Arial,sans-serif;line-height:1.6'>"
					+ "<h2>CodeVerse Judge Invitation</h2>"
					+ "<p>Hello " + safe(user.getFirstName()) + ",</p>"
					+ "<p>You have been invited as a <b>Judge</b> in CodeVerse.</p>"
					+ "<p><b>Login Email:</b> " + safe(user.getEmail()) + "<br/>"
					+ "<b>Temporary Password:</b> " + safe(tempPassword) + "</p>"
					+ "<p>Please login and change your password immediately.</p>"
					+ "<p><a href='http://localhost:9797/login'>Login to CodeVerse</a></p>"
					+ "<p>Thanks,<br/>CodeVerse Team</p></div>";

			MimeMessageHelper helper = new MimeMessageHelper(message, true);
			helper.setTo(user.getEmail());
			helper.setSubject("CodeVerse - Judge Invitation");
			helper.setText(body, true);
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	private String safe(String text) {
		return text == null ? "" : text;
	}
}
