package mail;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailforme {
public void sendmail(String to,String pass) throws Exception{
        
        Properties p=new Properties();
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.gmail.com");
        p.put("mail.smtp.port", "587");
        
        String myemail="scribblerismailing@gmail.com"; 
        String password="scribbler2021";
        
        Session s=Session.getInstance(p, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myemail, password);
            }
            
        });
        Message msg=prepareMessage(s,myemail,to,pass);
        
        Transport.send(msg);
        
       
    }
    

    private static Message prepareMessage(Session s, String myemail, String to,String pass) {
        Message msg=new MimeMessage(s);
        try {
            
            msg.setFrom(new InternetAddress(myemail));
            msg.setRecipient(Message.RecipientType.TO,new InternetAddress(to));
            String htmlcode="<table border='1'><tr ><th colspan='2'><b>Scribbler</b></th></tr><tr><td >Your one time password:</td><td>"+pass+"</td></tr></table>";
            
            msg.setContent(htmlcode,"text/html");
            return msg;
        } catch (Exception e) {
            //Logger.getLogger(JavaMailUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return msg;
    }

}
