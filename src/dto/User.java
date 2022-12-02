package dto;

public class User {
    private String email_id;
    private String pwd;
    private String uname;
    private String profile_img;

    private String initImg = "default_profile.svg";
    public User() {
    }

    public User(String email_id, String pwd, String uname) {
        this.email_id = email_id; this.pwd = pwd; this.uname = uname; profile_img=initImg;
    }

    public User(String email_id, String pwd, String uname, String profile_img) {
        this.email_id = email_id; this.pwd = pwd; this.uname = uname; this.profile_img=profile_img;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getProfile_img() {
        return profile_img;
    }

    public void setProfile_img(String profile_img) {
        this.profile_img = profile_img;
    }
}
