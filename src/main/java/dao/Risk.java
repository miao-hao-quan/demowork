package dao;

import entity.RiskArea;

import java.util.List;


//风险地区
public interface Risk {
    List<RiskArea> getHighRisk();
    List<RiskArea> getMediumRisk();
    int delArea(int id);
    RiskArea getRiskAreaById(int id);
    int updateArea(RiskArea riskArea);
    int insertArea(RiskArea riskArea);
}
