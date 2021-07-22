package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.Risk;
import entity.Msg;
import entity.RiskArea;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.RiskService;

import java.util.List;


//风险地区操作
@Controller
@RequestMapping(value = "/risk")
public class RiskController {
    @Autowired
    RiskService riskService;

    @RequestMapping(value = "/getHighArea")
    @ResponseBody
    public Msg highArea(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        List<RiskArea> highRisk = riskService.getHighRisk();
        PageInfo pageInfo=new PageInfo(highRisk,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/getMediumArea")
    @ResponseBody
    public Msg mediumArea(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,5);
        List<RiskArea> mediumRisk = riskService.getMediumRisk();
        PageInfo pageInfo=new PageInfo(mediumRisk,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/deleteArea")
    @ResponseBody
    public String deleteArea(@Param("id")Integer id){
        int i = riskService.delArea(id);
        if(i==1){
            return "success";
        }
        return "delete fail";
    }

    @RequestMapping(value = "/getArea")
    @ResponseBody
    public RiskArea getAreaById(@RequestParam(value = "id")Integer id){
        RiskArea riskArea = riskService.getAreaById(id);
        return riskArea;
    }

    @RequestMapping(value = "/updateArea")
    @ResponseBody
    public String updateArea(RiskArea riskArea){
        int i=riskService.updateArea(riskArea);
            return "success";
    }

    @RequestMapping(value = "/insertArea")
    @ResponseBody
    public String insertArea(RiskArea riskArea){
        int i=riskService.insertArea(riskArea);
        return "success";
    }
}
