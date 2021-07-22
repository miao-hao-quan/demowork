package dao;

import entity.StudentInformation;

import java.util.List;

//学生信息
public interface Information {

    StudentInformation getById(Integer stu_id);

    void updateById(StudentInformation studentInformation);

    List<String> getAllClass();

    List<StudentInformation> getAllStuByClassId(String className);

    List<String> getAllCollege();

    StudentInformation getStuById(Integer stuId);

    void updateStuById(StudentInformation studentInformation);

    void insertStu(StudentInformation studentInformation);
}
