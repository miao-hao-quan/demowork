package interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//如果已经登录,则提醒先退出登录,防止session值覆盖
public class LoggedInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("usertype")!=null){
            request.setAttribute("msg","您已经登录，请先退出登录");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
            return false;
        }
            return true;
    }
}
