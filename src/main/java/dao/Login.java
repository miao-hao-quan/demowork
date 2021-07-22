package dao;

import org.apache.ibatis.annotations.Param;


//用户登录
public interface Login {
    Integer stulogin(@Param("username") String username,@Param("password") String password);
    Integer getstuloginId(@Param("username") String username,@Param("password") String password);
    Integer stuJudgeExist(@Param("username") String username);
    Integer adminlogin(@Param("username") String username,@Param("password") String password);
    Integer adminJudgeExist(@Param("username") String username);
}
