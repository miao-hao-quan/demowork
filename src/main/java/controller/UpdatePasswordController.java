package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UpdatePasswordService;


//修改密码操作
@Controller
@RequestMapping(value = "/updatePasword")
public class UpdatePasswordController {
        @Autowired
        UpdatePasswordService updatePasswordService;

        @RequestMapping(value = "/getStuPwd/{username}")
        @ResponseBody
        public String getStuPwd(@PathVariable(value = "username") String username){
            return updatePasswordService.getStuPwd(username);
        }

        @RequestMapping(value = "/getAdmPwd/{adminName}")
        @ResponseBody
        public String getAdmPwd(@PathVariable(value = "adminName") String adminName){
            return updatePasswordService.getAdmPwd(adminName);
        }

        @RequestMapping(value = "/updateStuPwd",method = RequestMethod.PUT)
        @ResponseBody
        public String updateStuPwd(String userName,String nowpasswd){
                updatePasswordService.updateStuPwd(userName,nowpasswd);
                return "success";
        }

        @RequestMapping(value = "/updateAdmPwd",method = RequestMethod.PUT)
        @ResponseBody
        public String updateAdmPwd(String adminName,String nowpasswd){
                updatePasswordService.updateAdmPwd(adminName,nowpasswd);
                return "success";
        }

}
