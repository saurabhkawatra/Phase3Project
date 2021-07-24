package com.SportyShoes.Controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.SportyShoes.DAO.UserDAO;
import com.SportyShoes.MODELS.User;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/"},method = RequestMethod.GET)
	public String index(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("Executing Index Handler(HomeController)");
		System.out.println("Real Path :: "+request.getRealPath(""));
		System.out.println("ContextPath :: "+request.getContextPath());
		
//		List<Object[]> userlistbytype = userDao.getUserbyUserType("customer");
//		
//		userlistbytype.forEach(ob->{System.out.println(ob[0].toString()+ob[1].toString());});
		
//		User u1=new User();
//		u1=userDao.findById(1).get();
//		System.out.println(u1);
//		
//		User u2 = new User();
//		u2.setUsername("test_username");
//		u2.setPassword("testingpassword");
//		u2.setPhonenumber("789878989testing");
//		u2.setUser_city("testingcity");
//		u2.setUser_Realname("Realname Testing");
//		u2.setUser_type("customer");
//		
//		User u3 = new User();
//		u3=userDao.save(u2);
//		
//		System.out.println("u2 after saving :: "+u2);
//		System.out.println("u3 :: "+u3);
		
		return "index";
	}
	
	@RequestMapping(path = "/login")
	public String home(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("Executing home Handler(HomeController)");
		System.out.println("ContextPath :: "+request.getContextPath());
		System.out.println("request.getServletPath() :: "+request.getServletPath());
		System.out.println("request.getPathInfo() :: "+request.getPathInfo());
		System.out.println("request.getPathTranslated() :: "+request.getPathTranslated());
		System.out.println("request.getRealPath('') :: "+request.getRealPath(""));
		
		return "login";
	}
	@RequestMapping("/invalidlogin")
	public String invalid(Model model)
	{
		System.out.println("Executing invalid Handler(HomeController)");
		model.addAttribute("invalidcheck", "invalid");
		return "login";
	}
	
	
	@RequestMapping(path = {"/signin"},method = {RequestMethod.POST})
	public String signin(HttpServletRequest request,HttpServletResponse response,Model model,@RequestParam(name = "username")String uname,@RequestParam("password")String pass)
	{
		System.out.println("Executing signin Handler(HomeController)");
		System.out.println("PathTranslated :: "+request.getPathTranslated());
		System.out.println("request.getParameter(\"username\") username entered = "+request.getParameter("username"));
		System.out.println("model.getAttribute(\"username\")= "+ model.getAttribute("username"));
		System.out.println("requestparam(name = \"username\")= "+uname);
		System.out.println("request.getParameter(\"password\") password entered = "+request.getParameter("password"));
		System.out.println("model.getAttribute(\"password\")= "+model.getAttribute("password"));
		System.out.println("requestparam(name = \"password\")= "+pass);
		System.out.println("Checking Login Credentials...");
		
		User u1=userDao.loginCheck(uname, pass);
		System.out.println("Received User :: "+u1);
		
		if(u1==null) {
				System.out.println("Login Invalidated :: Invalid Username or Password!");
				return "redirect:invalidlogin";
		}else if(u1.getUser_type().equals("admin")){
			System.out.println("Admin Login Validated :: Admin Name :: "+u1.getUser_Realname()+" logging in...");
			request.getSession(true).setAttribute("user_admin", u1);
			return "redirect:admin/admin-home";
		}else {
			request.getSession(true).setAttribute("user_customer", u1);
			System.out.println("Customer Login Validated :: Customer Name :: "+u1.getUser_Realname()+" logging in...");
			return "redirect:customer/customer-home";
		}
		
	}
	
	
	@RequestMapping(path = {"/register"},method = {RequestMethod.POST})
	public String register(Model model,HttpServletRequest request,HttpServletResponse response)
	{
		 System.out.println("Executing register Handler(HomeController)");
		 String dob=request.getParameter("dob");
		 System.out.println("Entered DOB = "+dob);
		 Date user_dob = new Date();
		 try {
		 user_dob=new SimpleDateFormat("yyyy-MM-dd").parse(dob);
		 }catch(Exception e)
		 {
			 System.out.println("Date Exception");
			 System.out.println(e.getMessage());
			 e.printStackTrace();
		 }
		 String typeofuser=request.getParameter("typeofuser");
		 System.out.println("Type of User for Registeration :: "+typeofuser);
		User u1=new User(request.getParameter("name"), request.getParameter("username"), request.getParameter("password"),typeofuser,request.getParameter("phonenumber"), request.getParameter("city"),user_dob);
		System.out.println("Details received from Form : "+u1);
		String msg="User ADDED :: "+userDao.save(u1).toString();
		System.out.println("msg :: "+msg);
		String usrname=u1.getUsername();
		usrname=usrname.concat("_"+String.valueOf(u1.getUser_id()));
		System.out.println("Genrated username = " +usrname);
		u1.setUsername(usrname);
		String msg2="User UPDATED :: "+userDao.save(u1).toString();
		System.out.println("msg2 :: "+msg2);
		model.addAttribute("registrationsuccessful", usrname);
		model.addAttribute("typeofuser", typeofuser);
		return "login";
		//return "registerred";
	}
	
	
	
	@RequestMapping(path = {"/logout"},method = {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("Executing logout Handler(HomeController)");
		System.out.println("Executing logout..");
		
		try {
			System.out.println("admin logging out "+(User)request.getSession(false).getAttribute("user_admin"));
			System.out.println("customer logging out "+(User)request.getSession(false).getAttribute("user_customer"));
			request.getSession(false).invalidate();
		}catch(Exception e) {
			System.out.println("Logout Exception");
			System.out.println("Exception Message "+e.getMessage());
		}
		
		return "redirect:/";
	}

}
