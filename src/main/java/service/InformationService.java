package service;

import dao.Information;
import entity.StudentInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InformationService {

    @Autowired
    Information information;

    public StudentInformation getById(Integer stu_id) {
        return information.getById(stu_id);
    }

    public void updateById(StudentInformation studentInformation) {
        information.updateById(studentInformation);
    }

    public List<String> getAllClass() {
        return information.getAllClass();
    }

    public List<StudentInformation> getAllStuByClassId(String className) {
        return information.getAllStuByClassId(className);
    }

    public List<String> getAllCollege() {
        return information.getAllCollege();
    }

    public StudentInformation getStuById(Integer stuId) {
        return information.getStuById(stuId);
    }

    public void updateStuById(StudentInformation studentInformation) {
        information.updateStuById(studentInformation);
    }


    public void insertStu(StudentInformation studentInformation) {
        information.insertStu(studentInformation);
    }
}
