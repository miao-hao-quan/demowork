package entity;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private int code;
    //处理信息
    private String msg;
    //客户端请求的返回数据
    private Map<String,Object> map=new HashMap<String,Object>();

    //处理成功方法
    public static Msg success(){
        Msg msg=new Msg();
        msg.setCode(100);
        msg.setMsg("处理成功！");
        return msg;
    }
    //处理失败方法
    public static Msg fail(){
        Msg msg=new Msg();
        msg.setCode(200);
        msg.setMsg("处理失败！");
        return msg;
    }
    //添加数据方法
    public Msg add(String key,Object value){
        this.getMap().put(key,value);
        return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
