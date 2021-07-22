package controller;

import entity.AdminSignIn;
import entity.StudentInformation;
import entity.StudentSignIn;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.SignInService;

import java.util.List;


//学生签到页面操作
@Controller
@RequestMapping(value = "signIn")
public class SignInController {

    @Autowired
    SignInService signInService;

    @RequestMapping(value = "/getStuMessage/{studentId}")
    @ResponseBody
    public StudentInformation getStuMessage(@PathVariable("studentId")Integer id){
        System.out.println(signInService.getStuMessage(id));
        return signInService.getStuMessage(id);
    }

    @RequestMapping(value = "/getStuSignMess/{studentId}")
    @ResponseBody
    public StudentSignIn getStuSignMess(@PathVariable("studentId")Integer id){
        return signInService.getStuSignMess(id);
    }

    @RequestMapping(value = "/getAll")
    @ResponseBody
    public List<AdminSignIn> getAll(String date){
        return signInService.getAll(date);
    }


    @RequestMapping(value = "/updateStuSign",method = RequestMethod.PUT)
    @ResponseBody
    public String updateStuSign(StudentSignIn studentSignIn){
       int count=signInService.getExit(studentSignIn.getStuId());
       if(count==1){
           signInService.updateSign(studentSignIn);
       }else{
           signInService.insertStuSign(studentSignIn);
       }
        return "success";
    }


    @RequestMapping(value = "/getAbnormal/{stuId}")
    @ResponseBody
    public StudentSignIn updateStuSign(@PathVariable(value = "stuId") Integer stuId){
        return signInService.getStuSignMess(stuId);
    }
}
