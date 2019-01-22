package controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //查询所有用户
    @RequestMapping (value = "/user/list-user")
    public ModelAndView showUser(){
        List<User> userList=userService.getAllUser();
        ModelAndView mav=new ModelAndView();
        mav.addObject("userList",userList);
        mav.addObject("type","all");
        mav.setViewName("/user/list.jsp");
        return mav;
    }
    // 根据关键信息查用户 id username,age...
    @RequestMapping(value = "/user/find-userByKeyword")
    public ModelAndView findUserByKeyword(String keyword){
        List<User> userList=userService.findUserByKeyword(keyword);
        ModelAndView mav=new ModelAndView();
        mav.addObject("userList",userList);
        mav.addObject("type",keyword);
        mav.setViewName("/user/list.jsp");
        return mav;
    }

    // 根据uid删除用户
    @RequestMapping (value = "/user/del-userById")
    public void delUserById(String uid,HttpServletRequest request,HttpServletResponse response){
        userService.delUserById(uid);
        try {
            request.getRequestDispatcher("/user/list-user").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 新建跳转jsp
    @RequestMapping (value ="/user/insert-jsp")
    public ModelAndView insertJsp(){
        ModelAndView mav=new ModelAndView();
        mav.setViewName("/user/edit.jsp");
        return mav;
    }
    // 修改用户跳转到jsp
    @RequestMapping (value = "/user/update-jsp")
    public ModelAndView updateJsp(String uid){
        User user=userService.findUserByUid(uid);
        ModelAndView mav=new ModelAndView();
        mav.addObject("user",user);
        mav.setViewName("/user/edit.jsp");
        return mav;
    }
    // 插入新用户,异步提交
    @RequestMapping (value = "/user/insert-user")
    @ResponseBody
    public Integer insertUser(User user){
        Integer uid = user.getUid();
        System.out.println(uid==null);
        if(uid==null) {
            userService.insertUser(user);
        }else{
            userService.updateUser(user);
        }
        Integer status=1;
        return status;
    }
}
