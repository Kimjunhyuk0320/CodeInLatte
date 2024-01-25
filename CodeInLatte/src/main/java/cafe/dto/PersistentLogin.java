package cafe.dto;

import java.util.Date;

public class PersistentLogin {
    private int pNo;
    private String userId;
    private String token;
    private Date date; // Timestamp를 Date로 변경

    public int getpNo() {
        return pNo;
    }

    public void setpNo(int pNo) {
        this.pNo = pNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "PersistentLogin{" +
                "pNo=" + pNo +
                ", userId='" + userId + '\'' +
                ", token='" + token + '\'' +
                ", date=" + date +
                '}';
    }
}
