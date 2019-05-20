package util;


/*
 * Lá»›p nĂ y Ä‘Æ°á»£c viáº¿t Ä‘á»ƒ há»— trá»£ cĂ¡c báº¡n yĂªu thĂ­ch láº­p trĂ¬nh Java. 
 * CĂ¡c báº¡n Ä‘Æ°á»£c phĂ©p sá»­ dá»¥ng miá»…n phĂ­. Tuy nhiĂªn náº¿u cĂ³ lá»—i xáº£y 
 * ra chĂºng tĂ´i sáº½ khĂ´ng chá»‹u trĂ¡ch nhiá»‡m. 
 * TĂ¡c giáº£: Nguyá»…n Nghiá»‡m - 0913745789 - nnghiem@yahoo.com 
 */


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * Lá»›p nĂ y chá»©a má»™t sá»‘ hĂ m tiá»‡n Ă­ch giĂºp gá»­i email 
 * thĂ´ng qua tĂ i khoáº£n google. 
 * Mail sáº½ khĂ´ng Ä‘Æ°á»£c gá»­i ngay mĂ  Ä‘Æ°á»£c Ä‘Æ°a vĂ o hĂ ng Ä‘á»£i 
 * vĂ  sáº½ Ä‘Æ°á»£c má»™t thread Ä‘á»�c vĂ  gá»­i vĂ o thá»�i gian rá»—i.
 * 
 * @see send(String, String, String)
 * @see send(String, String, String, String)
 * @see send(String, String, String, String, String, String, String)
 * @author nnghiem@yahoo.com
 */
public class GMailUtil
{
	// thread chuyĂªn dá»¥ng Ä‘á»�c mail tá»« hĂ ng Ä‘á»£i vĂ  gá»­i Ä‘i
	static MailThread thread = new MailThread();
	
	// your google email
    private static String email = "lycatostore@gmail.com";
    // your google password
    private static String password = "songlong";
    
    private static Session session;
    private static Properties config = new Properties();
    static
    {
        config.setProperty("mail.smtp.host", "smtp.gmail.com");
        config.setProperty("mail.smtp.port", "465");
        config.setProperty("mail.smtp.starttls.enable","true");
        config.setProperty("mail.smtp.auth", "true");
        config.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        config.setProperty("mail.smtp.socketFactory.fallback", "false");
        Authenticator authenticator = new Authenticator()
        {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        };
        session = Session.getInstance(config, authenticator);
    }
    
    /**
     * Gá»­i email tá»« há»‡ thá»‘ng Ä‘áº¿n má»™t hay má»™t sá»‘ ngÆ°á»�i.
     * 
     * @param to chá»©a danh sĂ¡ch email cá»§a ngÆ°á»�i nháº­n. Má»—i email cĂ¡ch nhau dáº¥u pháº©y, cháº¥m pháº©y hay khoáº£n tráº¯ng
     * @param subject tiĂªu Ä‘á»� cá»§a email
     * @param body ná»™i dung email
     * @return MimeMessage Ä‘Ă£ gá»­i
     */
    public static void send(String to, String subject, String body) throws MessagingException, UnsupportedEncodingException
    {
        String from = String.format("Web Master <%s>", email);
        GMailUtil.send(from, to, subject, body);
    }
    /**
     * Gá»­i email tá»« má»™t ngÆ°á»�i Ä‘áº¿n má»™t hay má»™t sá»‘ ngÆ°á»�i.
     * 
     * @param from email cá»§a ngÆ°á»�i gá»­i (vĂ­ dá»¥: <b>Nguyen Nghiem &lt;nnghiem@yahoo.com&gt;</b>)
     * @param to chá»©a danh sĂ¡ch email cá»§a ngÆ°á»�i nháº­n. Má»—i email cĂ¡ch nhau dáº¥u pháº©y, cháº¥m pháº©y hay khoáº£n tráº¯ng
     * @param subject tiĂªu Ä‘á»� cá»§a email
     * @param body ná»™i dung email
     */
    public static void send(String from, String to, String subject, String body)
    {
    	String cc = "", bcc = "";
        GMailUtil.send(from, to, cc, bcc, subject, body, "");
    }
    /**
     * Gá»­i email tá»« má»™t ngÆ°á»�i Ä‘áº¿n má»™t hay má»™t sá»‘ ngÆ°á»�i, cĂ³ cc, bcc vĂ  attached files
     * 
     * @param from email cá»§a ngÆ°á»�i gá»­i (vĂ­ dá»¥: <b>Nguyen Nghiem &lt;nnghiem@yahoo.com&gt;</b>)
     * @param to chá»©a danh sĂ¡ch email cá»§a ngÆ°á»�i nháº­n. Má»—i email cĂ¡ch nhau dáº¥u pháº©y, cháº¥m pháº©y hay khoáº£n tráº¯ng
     * @param cc chá»©a danh sĂ¡ch email cá»§a nhá»¯ng ngÆ°á»�i Ä‘á»“ng nháº­n. Má»—i email cĂ¡ch nhau dáº¥u pháº©y, cháº¥m pháº©y hay khoáº£n tráº¯ng. Danh sĂ¡ch email nĂ y sáº½ Ä‘Æ°á»£c nhĂ¬n tháº¥y trĂªn email.
     * @param bcc chá»©a danh sĂ¡ch email cá»§a nhá»¯ng ngÆ°á»�i Ä‘á»“ng nháº­n. Má»—i email cĂ¡ch nhau dáº¥u pháº©y, cháº¥m pháº©y hay khoáº£n tráº¯ng. Danh sĂ¡ch email nĂ y sáº½ khĂ´ng Ä‘Æ°á»£c nhĂ¬n tháº¥y trĂªn email.
     * @param subject tiĂªu Ä‘á»� cá»§a email
     * @param body ná»™i dung email
     * @param attachments danh sĂ¡ch Ä‘Æ°á»�ng dáº«n cĂ¡c táº­p tin Ä‘Ă­nh kĂ¨m. Má»—i Ä‘Æ°á»�ng dáº«n cĂ¡ch nhau dáº¥u pháº©y hoáº·c cháº¥m pháº©y.
     */
    public static void send(String from, String to, String cc, String bcc, String subject, String body, String attachments)
    {
    	try{
	        MimeMessage mail = new MimeMessage(session);
	
	        InternetAddress fromAddress = toInternetAddress(from);
	        mail.setFrom(fromAddress);
	        
	        mail.setReplyTo(new InternetAddress[]{fromAddress});
	        
	        final String toEmails = to.trim().replaceAll("[,;\\s]+", ",");
	        mail.addRecipients(Message.RecipientType.TO, toEmails);
	
	        if(cc != null && cc.trim().length() > 0)
	        {
	            final String ccEmails = cc.trim().replaceAll("[,;\\s]+", ",");
	            mail.addRecipients(Message.RecipientType.CC, ccEmails);
	            System.out.println(ccEmails);
	        }
	
	        if(bcc != null && bcc.trim().length() > 0)
	        {
	            final String bccEmails = bcc.trim().replaceAll("[,;\\s]+", ",");
	            mail.addRecipients(Message.RecipientType.BCC, bccEmails);
	            System.out.println(bccEmails);
	        }
	        mail.setSubject(subject, "utf8");
	        mail.setContent(body, "text/html; charset=\"UTF-8\"");
	        mail.setSentDate(new Date());
	
	        if(attachments != null && attachments.trim().length() > 0)
	        {
	            MimeMultipart multiPart = new MimeMultipart();
	            
	            MimeBodyPart textBodyPart = new MimeBodyPart();
	            textBodyPart.setContent(body, "text/html; charset=\"UTF-8\"");
	            multiPart.addBodyPart(textBodyPart);
	
	            String[] paths = attachments.split("[,;\\s]+");
	            for(String path : paths)
	            {
	                File file = new File(path.trim());
	                multiPart.addBodyPart(GMailUtil.createMimeBodyPart(file));
	            }
	            mail.setContent(multiPart);
	        }
	        
	        //Transport.send(mail);
	        thread.queue(mail);
    	}
    	catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    
    private static MimeBodyPart createMimeBodyPart(File file) throws MessagingException
    {
        MimeBodyPart bodyPart = new MimeBodyPart();
        FileDataSource fds = new FileDataSource(file);
        bodyPart.setDataHandler(new DataHandler(fds));
        bodyPart.setFileName(file.getName());
        return bodyPart;
    }
    
    private static InternetAddress toInternetAddress(String emailAddress) throws UnsupportedEncodingException
    {
        String[] addresses = emailAddress.split("[<>]");
        String namePart = addresses[0].trim();
        String emailPart = (addresses.length > 1 ? addresses[1] : addresses[0]).trim();
        return new InternetAddress(emailPart, namePart, "utf8");
    }
}

class MailThread extends Thread{
	List<MimeMessage> mails = new ArrayList<MimeMessage>();
	boolean running = false, stopped = false;
	
	public MailThread(){
		this.start();
	}
	
	@SuppressWarnings("deprecation")
	@Override
	public void run() {
		while(!stopped){
			if(mails.size() > 0){
				MimeMessage mail = mails.remove(0);
				try {
					Transport.send(mail);
				} 
				catch (MessagingException e) {
					e.printStackTrace();
				}
			}
			else{
				this.suspend();
				running = false;
			}
		}
	}
	
	@SuppressWarnings("deprecation")
	public void queue(MimeMessage mail){
		mails.add(mail);
		if(running == false){
			this.resume();
			running = true;
		}
	}
	
	public void stopThread(){
		stopped = true;
	}
}