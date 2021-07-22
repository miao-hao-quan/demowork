package dao;

import entity.AdminTemperature;
import entity.StudentTemperature;
import org.apache.ibatis.annotations.Param;

import java.util.List;


//学生体温登记
public interface Temperature {
    List<StudentTemperature> getAllTemperature(int stu_id);
    void insertMorningTemperature(@Param("stu_id")int stu_id,@Param("morningTemperature")double morningTemperature, @Param("date") String now_date);

    void insertEveningTemperature(@Param("stu_id")Integer stu_id,@Param("eveningTemperature") Double eveningtem, @Param("date")  String date);

    int getDatetem(@Param("stu_id") Integer stu_id,@Param("date") String date);

    void updateEveningtem(@Param("stu_id")Integer stu_id,@Param("eveningTemperature")Double eveningtem,  @Param("date")String date);

    StudentTemperature getTodaytem(@Param("stu_id")Integer stu_id,@Param("date") String date);

    List<AdminTemperature> getTodayAllTem(@Param("date")String date);

    AdminTemperature getTodayTemById(@Param("stu_id")Integer stu_id, @Param("date")String date);

    void insertTodayTem(@Param("stu_id")Integer stu_id, @Param("morningTem")Double morningTem, @Param("eveningTem")Double eveningTem,@Param("date") String date);

    void updateTodayTem(@Param("stu_id")Integer stu_id, @Param("morningTem")Double morningTem, @Param("eveningTem")Double eveningTem,@Param("date") String date);
}
