package service;

import dao.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
    @Autowired
    Login login;

    public int studentJudgeExist(String username) {
        int Exist = login.stuJudgeExist(username);
        return Exist;
    }

    public int studentLogin(String username, String password){
        int stulogin = login.stulogin(username, password);
        return stulogin;
    }
    public int adminJudgeExist(String username) {
        int Exist = login.adminJudgeExist(username);
        return Exist;
    }

    public int adminLogin(String username, String password){
        int stulogin = login.adminlogin(username, password);
        return stulogin;
    }

    public int getstuloginId(String username, String password){
        int id = login.getstuloginId(username, password);
        return id;
    }
}