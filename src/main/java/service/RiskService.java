package service;

import dao.Risk;
import entity.RiskArea;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RiskService {
    @Autowired
    Risk risk;

    public List<RiskArea> getHighRisk(){
        List<RiskArea> highRisk = risk.getHighRisk();
        return highRisk;
    }

    public List<RiskArea> getMediumRisk(){
        List<RiskArea> mediumRisk = risk.getMediumRisk();
        return mediumRisk;
    }

    public int delArea(int id){
        int i = risk.delArea(id);
        return i;
    }

    public RiskArea getAreaById(int id){
        RiskArea riskArea = risk.getRiskAreaById(id);
        return riskArea;
    }

    public int updateArea(RiskArea riskArea) {
        int i = risk.updateArea(riskArea);
        return i;
    }

    public int insertArea(RiskArea riskArea) {
        int i = risk.insertArea(riskArea);
        return i;
    }
}
