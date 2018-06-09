package com.kyung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kyung.dto.User;
import com.kyung.model.UserModificationModel;
import com.kyung.model.UserRegistrationModel;
import com.kyung.dto.Department;
import com.kyung.service.UserService;
import com.kyung.service.DepartmentService;

@Controller
public class UserController {
	@Autowired UserService userService;
	@Autowired DepartmentService departmentService;
	
	@RequestMapping("main")
	public String main()
	{
		System.out.println("login success");
		return "user/main";
	}
	
	@RequestMapping("mypage")
	public String mypage()
	{
		return "user/mypage";
	}
	
	@RequestMapping(value="myinfo_setting", method=RequestMethod.GET)
	public String myinfoSetting(UserModificationModel userModel, Model model)
	{
		System.out.println("info get");
		User user = userService.getCurrentUser();
		model.addAttribute("user",user);
		//model.addAttribute("department", user.getDepartmentId());
		model.addAttribute("departments", departmentService.findAll());
		return "user/myinfo_setting";
	}
	
	@RequestMapping(value="myinfo_setting", method=RequestMethod.POST)
	public String myinfoSetting(@Valid UserModificationModel userModel, BindingResult bindingResult, Model model)
	{
		System.out.println("정보 변경");
		User currentUser = userService.getCurrentUser();
		UserRegistrationModel userRegModel = userModel.toRegistrationUser(currentUser);
		
		if(bindingResult.hasErrors())
		{
			System.out.println("정보 변경 에러");
			User user = userService.getCurrentUser();
			model.addAttribute("user", user);
			model.addAttribute("departments", departmentService.findAll());
			return "user/myinfo_setting";
		}
		System.out.println("정보변경 진행중");
		User user = userRegModel.toUser();
		System.out.println("정보변경 진행중2");
		userService.edit(user);
		System.out.println("정보변경 성공");
		return "user/mypage";
	}
	
	/*
	@RequestMapping(value="myinfo_setting", method=RequestMethod.POST)
	public String myinfoSetting(@Valid UserModificationModel userModel, BindingResult bindingResult, Model model)
	{
		System.out.println("정보 변경");
		if(userService.hasErrors(userModel, bindingResult))
		{
			System.out.println("정보 변경 에러");
			User user = userService.getCurrentUser();
			model.addAttribute("user", user);
			model.addAttribute("departments", departmentService.findAll());
			return "user/myinfo_setting";
		}
		User user = userModel.toUser();
		userService.update(user);
		return "user/mypage";
	}*/

	@RequestMapping("mypw_auth")
	public String mypw_auth()
	{
		return "user/mypw_auth";
	}

	@RequestMapping("mypw_setting")
	public String mypwSetting()
	{
		return "user/mypw_setting";
	}

	@RequestMapping("my_meeting")
	public String myMeeting()
	{
		return "user/my_meeting";
	}

	@RequestMapping("my_article")
	public String myArtilce()
	{
		return "user/my_article";
	}

	@RequestMapping("my_comment")
	public String myComment()
	{
		return "user/my_comment";
	}
	
/*
	@RequestMapping("userList")
	public String allUserList(Model model) 
	{
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		return "admin/userList";
	}
*/	
	@RequestMapping(value="create", method=RequestMethod.GET)
	public String create(Model model) 
	{
		User user = new User();
		List<Department> departments = departmentService.findAll();
		model.addAttribute("user", user);
		model.addAttribute("departments", departments);
		return "user/edit";
	}
	
	@RequestMapping(value="create", method=RequestMethod.POST)
	public String create(Model model, User user) 
	{
		userService.create(user);
		return "main";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.GET)
	public String edit(Model model, @RequestParam("id")int id) 
	{
		User user = userService.findOne(id);
		List<Department> departments = departmentService.findAll();
		model.addAttribute("user",user);
		model.addAttribute("departments",departments);
		return "user/edit";
	}
	
	@RequestMapping(value="edit", method=RequestMethod.POST)
	public String edit(Model model, User user) 
	{
		userService.update(user);
		return "main";
	}
	
	@RequestMapping("delete")
	public String delete(Model model, @RequestParam("id")int id)
	{
		userService.delete(id);
		return "main";
	}
}