package controller;


import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


//退出登录操作
@Controller
@RequestMapping(value = "/signOut")
public class SignOutController {

    @RequestMapping(value = "/stu")
    public ModelAndView stuSignOut(HttpServletRequest request, HttpServletResponse response){
        ModelAndView mv=new ModelAndView();
        HttpSession httpSession=request.getSession();
        httpSession.invalidate();
        mv.setViewName("redirect:/login");
        return mv;
    }

    @RequestMapping(value = "/adm")
    public ModelAndView admSignOut(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        HttpSession httpSession=request.getSession();
        httpSession.invalidate();
        mv.setViewName("redirect:/login");
        return mv;
    }
}
