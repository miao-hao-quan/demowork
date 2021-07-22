package controller;


import entity.AdminTemperature;
import entity.StudentTemperature;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import service.TemperatureService;

import java.util.List;


//体温填写操作
@Controller
@RequestMapping(value = "/temperature")
public class TemperatureController {

    @Autowired
    TemperatureService temperatureService;

    @ResponseBody
    @RequestMapping(value = "/getAllById")
    public List<StudentTemperature> getAll(@RequestParam(value = "stu_id") int stu_id){
       return temperatureService.getAllTemperature(stu_id);
    }

    @ResponseBody
    @RequestMapping(value = "/insertmorningtem",method = RequestMethod.POST)
    public String insertmorningtem(Integer stu_id,Double morningtem,String date){
        temperatureService.insertmorningtem(stu_id,morningtem,date);
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/inserteveningtem",method = RequestMethod.PUT)
    public String inserteveningtem(Integer stu_id,Double eveningtem,String date){
        int i=temperatureService.getDatetem(stu_id,date);
        if(i==0){
            temperatureService.inserteveningtem(stu_id,eveningtem,date);
        }else {
            temperatureService.updateEveningtem(stu_id,eveningtem,date);
        }

        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/gettodaytem")
    public StudentTemperature getTodaytem(Integer stu_id,String date){
        return temperatureService.getTodaytem(stu_id,date);
    }

    @ResponseBody
    @RequestMapping(value = "/getTodayAllTem")
    public List<AdminTemperature> getTodayAllTem(String date){
        return temperatureService.getTodayAllTem(date);
    }

    @ResponseBody
    @RequestMapping(value = "/getTodayTemById")
    public AdminTemperature getTodayTemById(@RequestParam(value = "stuid") Integer stu_id, @RequestParam(value = "date") String date){
        return temperatureService.getTodayTemById(stu_id,date);
    }

    @RequestMapping(value = "/updateTodayById",method = RequestMethod.PUT)
    @ResponseBody
    public String updateTodayById(@RequestParam(value = "stuId") Integer stu_id, @RequestParam(value = "date") String date,@RequestParam(value = "morningTem")Double morningTem,@RequestParam(value = "eveningTem")Double eveningTem){
        int datetem = temperatureService.getDatetem(stu_id, date);
        if(datetem==0){
            temperatureService.insertTodayTem(stu_id,morningTem,eveningTem,date);
        }else{
            temperatureService.updateTodayTem(stu_id,morningTem,eveningTem,date);
        }
        return "success";
    }
}
