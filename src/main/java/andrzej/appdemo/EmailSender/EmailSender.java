package andrzej.appdemo.EmailSender;

public interface EmailSender {
    void sendEmail(String to, String subject, String content);
}
