package controller;


import entity.StudentInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.InformationService;

import java.util.List;



//学生信息
@Controller
@RequestMapping(value = "/information")
public class InformationController {

    @Autowired
    InformationService informationService;

    @RequestMapping(value ="/getById/{stuId}")
    @ResponseBody
    public StudentInformation getById(@PathVariable(value ="stuId" ) Integer stu_id){
        return informationService.getById(stu_id);
    }

    @RequestMapping(value ="/updateById",method = RequestMethod.PUT)
    @ResponseBody
    public String updateById(StudentInformation studentInformation){
        informationService.updateById(studentInformation);
        return "success";
    }

    @RequestMapping(value ="/getAllClass")
    @ResponseBody
    public List<String> getAllClass(){
        return informationService.getAllClass();
    }

    @RequestMapping(value ="/getAllStuByClassId")
    @ResponseBody
    public List<StudentInformation> getAllStuByClassId(String className){
        return informationService.getAllStuByClassId(className);
    }


    @RequestMapping(value ="/getAllCollege")
    @ResponseBody
    public List<String> getAllCollege(){
        return informationService.getAllCollege();
    }


    @RequestMapping(value ="/getStuById/{stu_id}")
    @ResponseBody
    public StudentInformation getStuById(@PathVariable(value ="stu_id")Integer stuId){
        return informationService.getStuById(stuId);
    }


    @RequestMapping(value ="/updateStuById",method = RequestMethod.PUT)
    @ResponseBody
    public String updateStuById(StudentInformation studentInformation){
        informationService.updateStuById(studentInformation);
        return "success";
    }

    @RequestMapping(value ="/insertStu",method = RequestMethod.POST)
    @ResponseBody
    public String insertStu(StudentInformation studentInformation){
        informationService.insertStu(studentInformation);
        return "success";
    }

}
