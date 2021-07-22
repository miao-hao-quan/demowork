package service;

import dao.Temperature;
import entity.AdminTemperature;
import entity.StudentTemperature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TemperatureService {

    @Autowired
    Temperature temperature;

    public List<StudentTemperature> getAllTemperature(int stu_id){
        return temperature.getAllTemperature(stu_id);
    }

    public void insertmorningtem(int stu_id, double morningtem, String date) {
        temperature.insertMorningTemperature(stu_id,morningtem,date);
    }

    public void inserteveningtem(Integer stu_id, Double eveningtem, String date) {
        temperature.insertEveningTemperature(stu_id,eveningtem,date);
    }

    public int getDatetem(Integer stu_id,String date) {
        return temperature.getDatetem(stu_id,date);
    }

    public void updateEveningtem(Integer stu_id, Double eveningtem, String date) {
        temperature.updateEveningtem(stu_id,eveningtem,date);
    }

    public StudentTemperature getTodaytem(Integer stu_id, String date) {
        return temperature.getTodaytem(stu_id,date);
    }


    public List<AdminTemperature> getTodayAllTem(String date) {
        return temperature.getTodayAllTem(date);
    }

    public AdminTemperature getTodayTemById(Integer stu_id, String date) {
        return temperature.getTodayTemById(stu_id,date);
    }

    public void insertTodayTem(Integer stu_id, Double morningTem, Double eveningTem, String date) {
        temperature.insertTodayTem(stu_id,morningTem,eveningTem,date);
    }

    public void updateTodayTem(Integer stu_id, Double morningTem, Double eveningTem, String date) {
        temperature.updateTodayTem(stu_id,morningTem,eveningTem,date);
    }
}
