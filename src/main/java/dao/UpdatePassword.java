package dao;


import org.apache.ibatis.annotations.Param;


//修改密码
public interface UpdatePassword {
    String getStuPwd(String username);

    String getAdmPwd(String adminName);

    void updateStuPwd(@Param("userName") String userName,@Param("nowpasswd") String nowpasswd);

    void updateAdmPwd(@Param("adminName")String adminName,@Param("nowpasswd") String nowpasswd);
}
