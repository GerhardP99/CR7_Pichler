import java.util.Properties;

public class Secret {
    private String user = "root"; // insert your db username here, usually "root"
    private String password = ""; // insert your db password here.

    public String getUser() {
        return user;
    }
    public void setUser(String user){
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password){
        this.password = password;
    }
}
