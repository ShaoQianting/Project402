package com.rain.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class Mail {
	String to = ""; 
    String from = "shaoqianting@163.com"; 
    String host = "smtp.163.com";
    String username = "shaoqianting@163.com";
    String password = "TNXKWRHJKVKZIGVK";
    String subject = ""; 
    String content = ""; 
    String port = "25";
    public Mail() {
    }
    public Mail(String to, String from, String host, String username,
            String password, String subject, String content, String port) {
        this.to = to;
        this.from = from;
        this.host = host;
        this.username = username;
        this.password = password;
        this.subject = subject;
        this.content = content;
        this.port = port;
    }
    
    public String transferChinese(String strText) {

        try {
            strText = MimeUtility.encodeText(new String(strText.getBytes(),
                    "GB2312"), "GB2312", "B");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return strText;
    }
    
    public boolean sendMail() {

        Properties props = System.getProperties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.ssl.trust", host);
        props.put("mail.debug", "true");
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.user", username);
        Session session = Session.getDefaultInstance(props,
                new Authenticator() {
                    public PasswordAuthentication getPasswordAuthentication() {
                    	//System.out.print(props);
                        return new PasswordAuthentication(username, password);
                    }
                });
        //Session session = Session.getDefaultInstance(props);
        
        try {

            MimeMessage msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress(from));
            //System.out.println(from);
         
            InternetAddress[] address = { new InternetAddress(to) };

            msg.setRecipients(Message.RecipientType.TO, address);
            
            subject = transferChinese(subject);
            msg.setSubject(subject);
           
            Multipart mp = new MimeMultipart();

            MimeBodyPart mbpContent = new MimeBodyPart();
    
            // mbpContent.setText(content);

            mbpContent.setContent(content, "text/html;charset=utf-8");
           
            mp.addBodyPart(mbpContent);
    
            msg.setContent(mp);
           
            msg.setSentDate(new Date());
            
            Transport.send(msg);
            
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
   
}
