package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


//菜单栏跳转iframe的页面
@Controller
public class PageController {

    @RequestMapping("/preventionControlKnowledge")
    public String preventionControlKnowledge(){
        return "jsp/preventionControlKnowledge";
    }

    @RequestMapping("/adminRiskArea")
    public String adminRiskArea(){
        return "jsp/adminRiskArea";
    }

    @RequestMapping("/adminSignIn")
    public String adminSignIn(){
        return "jsp/adminSignIn";
    }

    @RequestMapping("/adminTemDesktop")
    public String adminTemDesktop(){
        return "jsp/adminTemDesktop";
    }

    @RequestMapping("/adminStuInformation")
    public String adminStuInformation(){
        return "jsp/adminStuInformation";
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(){
        return "jsp/updatePassword";
    }

    @RequestMapping("/studentRiskArea")
    public String studentRiskArea(){
        return "jsp/studentRiskArea";
    }

    @RequestMapping("/studentSignIn")
    public String studentSignIn(){
        return "jsp/studentSignIn";
    }

    @RequestMapping("/temperatureTable")
    public String temperatureTable(){
        return "jsp/temperatureTable";
    }
    @RequestMapping("/studentInformation")
    public String studentInformation(){
        return "jsp/studentInformation";
    }

}
