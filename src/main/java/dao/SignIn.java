package dao;

import entity.AdminSignIn;
import entity.StudentInformation;
import entity.StudentSignIn;

//学生签到
import java.util.List;

public interface SignIn {
    StudentInformation getStuMessage(Integer id);

    StudentSignIn getStuSignMess(Integer id);

    int getExit(int stuId);

    void updateSign(StudentSignIn studentSignIn);

    void insertStuSign(StudentSignIn studentSignIn);

    List<AdminSignIn> getAll(String date);
}
