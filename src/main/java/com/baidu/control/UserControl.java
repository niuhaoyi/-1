package com.baidu.control;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.dto.User;
import com.baidu.mapper.UserMapper;

@Controller
@RequestMapping("user")
public class UserControl {

	@Autowired
	private UserMapper um;
	
	@RequestMapping("toLogin")
	public String toLogin(User user,HttpServletRequest request) {
		User u = um.toLogin(user);
		if (u==null) {
			request.setAttribute("msg", "用户名密码错误");
			return "/login";
		}else {
			request.getSession().setAttribute("user", u);
			return "/WEB-INF/list";
		}
	}
}
