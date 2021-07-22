package service;

import dao.SignIn;
import entity.AdminSignIn;
import entity.StudentInformation;
import entity.StudentSignIn;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SignInService {

    @Autowired
    SignIn signIn;

    public StudentInformation getStuMessage(Integer id) {
        return signIn.getStuMessage(id);
    }

    public StudentSignIn getStuSignMess(Integer id) {
        return signIn.getStuSignMess(id);
    }

    public int getExit(int stuId) {
        return signIn.getExit(stuId);
    }

    public void updateSign(StudentSignIn studentSignIn) {
        signIn.updateSign(studentSignIn);
    }

    public void insertStuSign(StudentSignIn studentSignIn) {
        signIn.insertStuSign(studentSignIn);
    }

    public List<AdminSignIn> getAll(String date) {
        return signIn.getAll(date);
    }
}
