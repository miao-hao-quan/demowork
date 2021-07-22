package service;

import dao.UpdatePassword;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UpdatePasswordService {

    @Autowired
    UpdatePassword updatePassword;
    public String getStuPwd(String username) {
        return updatePassword.getStuPwd(username);
    }

    public String getAdmPwd(String adminName) {
        return updatePassword.getAdmPwd(adminName);
    }

    public void updateStuPwd(String userName, String nowpasswd) {
        updatePassword.updateStuPwd(userName,nowpasswd);
    }

    public void updateAdmPwd(String adminName, String nowpasswd) {
        updatePassword.updateAdmPwd(adminName,nowpasswd);
    }
}
