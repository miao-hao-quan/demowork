package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.LoginService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


//登录功能
@Controller
public class LoginController {
    @Autowired
    LoginService LoginService;

    @RequestMapping(value = {"/","/login"})
    public String stulogin(HttpSession httpSession){

        if(httpSession.getAttribute("usertype")!=null){
            if(httpSession.getAttribute("usertype").equals(1)){
                return "studentMainDesktop";
            }else{
                return "adminMainDesktop";
            }
        }
        return "login";
    }


    @RequestMapping(value = "/loginExist")
    @ResponseBody
    public String stuloginExist(String username, String password, Integer usertype, HttpServletRequest request) {
        if (usertype == 1) {
            int exist = LoginService.studentJudgeExist(username);
            if (exist == 0) {
                return "not exist";
            }
            int i = LoginService.studentLogin(username, password);
            if (i == 0) {
                return "password error";
            }
        }
        if(usertype==2){
            int exist = LoginService.adminJudgeExist(username);
            if (exist==0){
                return "not exist";
            }
            int i = LoginService.adminLogin(username, password);
            if (i==0){
                return "password error";
            }
        }
        return "success";
    }



    @RequestMapping(value = "/logintrue",method = RequestMethod.POST)
    public String logintrue(String username, String password, Integer usertype, HttpServletRequest request) {
        if (usertype == 1) {
            HttpSession httpSession = request.getSession();
            int id= LoginService.getstuloginId(username, password);
            httpSession.setAttribute("usertype", usertype);
            httpSession.setAttribute("username", username);
            httpSession.setAttribute("studentId", id);
            return "redirect:/gostudentMainDesktop";
        }
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("usertype", usertype);
            httpSession.setAttribute("adminname", username);
            httpSession.setMaxInactiveInterval(1800);

                return "redirect:/goadminMainDesktop";
    }

    @RequestMapping(value = "/gostudentMainDesktop")
    public String gostudentMainDesktop( ){
        return "studentMainDesktop";
    }

    @RequestMapping(value = "/goadminMainDesktop")
    public String goadminMainDesktop( ){
        return "adminMainDesktop";
    }

}
