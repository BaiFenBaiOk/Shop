package com.shop.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.exception.ExceptionFactory;
import com.shop.exception.MyException;
import com.shop.pojo.GoodType;
import com.shop.pojo.Goods;
import com.shop.pojo.Order;
import com.shop.pojo.QuervVo;
import com.shop.pojo.User;
import com.shop.service.UserService;
import com.shop.utils.UUIDUtils;

import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;

import java.io.File;
import java.io.IOException;
import java.text.MessageFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Properties;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;
    
    @RequestMapping("loginUI")
    public String loginUI(User user,Model model) throws MyException{
    	return "login";
    }
    
    @RequestMapping("findUserByName")
    public String findUserByName(User user,Model model) throws MyException{
    	System.out.println(user.toString());
    	return "null";
    }

    @RequestMapping("login")
    public ModelAndView login(User user,Model model,HttpSession session) throws MyException{
    	ModelAndView mv = new ModelAndView();
    	User user1 = userService.getLogin(user);
        if(user1 == null){
			throw new MyException("查无此人~~~");
			
		}else if(user1.getState()=="0"){
			throw new MyException("该账户未激活~~~");
		}else{
			if(user1.getType() == 0) {
				model.addAttribute("user", user1);
				session.setAttribute("username", user1);
				int page=1;
				int size=4;
				 List<Order> order = userService.findAll(page, size);
				 PageInfo pageInfo=new PageInfo(order);
				    mv.addObject("pageInfo",pageInfo);
				    mv.setViewName("home");
				    return mv;
			}
			else
				throw new MyException("该账户不是管理员~~~");
		}
    }
  
    
    @RequestMapping("findAllByOrder")
    public ModelAndView findAllByOrder(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Order> order = userService.findAll(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(order);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("home");
        return mv;
    }
    
    @RequestMapping("regist")
    public String regist(User user) throws MyException{
    	user.setCode(UUIDUtils.getId());
    	user.setState("0");
        userService.saveUser(user);
        
      //发激活邮件，准备配置文件email_template.properties
      		//加载配置文件
      		Properties props = new Properties();
      		//load()的参数是一个输入流，就是要配置文件的输入流
      		try {
				props.load(this.getClass().getClassLoader()
						.getResourceAsStream("email_template.properties"));
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
      		String host = props.getProperty("host");//发信人服务器主机
      		String uname = props.getProperty("uname");//发信人用户名
      		String pwd = props.getProperty("pwd");//发信人密码
      		String from = props.getProperty("from");//发信人邮箱
      		String to = user.getEmail();//从表单中获取收件人邮箱地址
      		String subject = props.getProperty("subject");//主题
      		String content = props.getProperty("content");//邮件内容
      		
      		//用表单补全的激活码替换content中的{0},详见本节帮助文档MessageFormat.format
      		content = MessageFormat.format(content, user.getCode());
      		
      		//得到邮件session，表示已经与服务连接上了，与Connection作用类似！
      		Session session = MailUtils.createSession(host, uname, pwd);
      		Mail mail = new Mail(from,to,subject,content);//创建邮件对象
      		try {
      			
					MailUtils.send(session, mail);
				} catch (IOException | MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//发邮件

        return "login";
    }
    
    @RequestMapping("active")
    public String active(String code) throws MyException{
    	System.out.println(code);
    	userService.saveActive(code);
    	return "login";
    }

	
   
    @RequestMapping("homeLoginUser")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> user = userService.findAllUsers(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(user);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user");
        return mv;
    }
    
    @RequestMapping("edit_user")
    public String edit_user(User user,Model model) throws MyException{
    	User user1 = userService.findUserByUid(user);
    	System.out.println(user1);
    	model.addAttribute("user", user1);
		  return "edit_user";
		 
    }
    @RequestMapping("edit_userByUid")
    public ModelAndView edit_userByUid(User user) throws MyException{
    	System.out.println(user.toString());
    	userService.saveUserByUid(user);
    	 ModelAndView mv = new ModelAndView();
    	 int page=1;
    	 int size = 4;
         List<User> user1 = userService.findAllUsers(page, size);
         //PageInfo就是一个分页Bean
         PageInfo pageInfo=new PageInfo(user1);
         mv.addObject("pageInfo",pageInfo);
         mv.setViewName("user");
         return mv;

		 
    }
    
    @RequestMapping("outLoginUser")
    public String outLoginUser(String code) throws MyException{
    	
    	return "login";
    }
    
    @RequestMapping("updataUser")
    public String updataUser(User user,Model model) throws MyException{
    	System.out.println(user.toString());
    	model.addAttribute("user", user);
    	return "updataUser";
    }
    
    @RequestMapping("edit_userPwdByUid")
    public String edit_userPwdByUid(User user) throws MyException{
    	userService.savaUserPwdByUid(user);
    	return "home";
    }
    
    @RequestMapping("list")
    public ModelAndView list(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size) throws Exception {
    	ModelAndView mv = new ModelAndView();
        List<Order> order = userService.findAllList(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(order);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("list");
        return mv;
    }
    
    @RequestMapping("findOrderById")
    public String findOrderById(Order order,Model model) throws MyException{
    	Order order1 = userService.findOrderById(order);
    	System.out.println(order1.toString());
    	model.addAttribute("order", order1);
		  return "edit_list";
		 
    }
  
    @RequestMapping("findAllGoodType")
    public ModelAndView findAllGoodType(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<GoodType> goodType = userService.findAllGoodType(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(goodType);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("findAllGoodType");
        return mv;
    }
    @RequestMapping("editGoodTypeById")
    public String editGoodTypeById(GoodType goodType,Model model) throws MyException{
    	GoodType goodType1 = userService.findGoodTypeById(goodType);
    	model.addAttribute("goodType", goodType1);
		  return "edit_GoodType";
		 
    }
    
    @RequestMapping("edit_goodTypeByUid")
    public ModelAndView edit_goodTypeByUid(GoodType goodType) throws MyException{
    	userService.saveGoodTypeByUid(goodType);
    	 ModelAndView mv = new ModelAndView();
    	 int page=1;
    	 int size=4;
         List<GoodType> goodType1 = userService.findAllGoodType(page, size);
         //PageInfo就是一个分页Bean
         PageInfo pageInfo=new PageInfo(goodType1);
         mv.addObject("pageInfo",pageInfo);
         mv.setViewName("findAllGoodType");
         return mv;
		 
    }
    
    @RequestMapping("findAllGood")
    public ModelAndView findAllGood(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Goods> goods = userService.findAllGood(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(goods);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("findAllGood");
        return mv;
    }

    @RequestMapping("editGoodById")
    public ModelAndView editGoodById(Goods good,Model model) throws MyException{
		
    	Goods goods = userService.findGoodById(good);
    	GoodType goodType = userService.findGoodTypeById(goods);
    	System.out.println(goodType.toString());
    	
    	List<GoodType> list = userService.findGoodType();
    	
    	for(GoodType l:list) {
    		System.out.println(l.toString());
    	}
    	ModelAndView mav = new ModelAndView();
		mav.addObject("good", goods);
		mav.addObject("goodType", goodType);
		model.addAttribute("list", list);
		mav.setViewName("edit_Good");

		return mav;
		 
    }
    
    @RequestMapping(value ="edit_goodByUid", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView edit_goodByUid(Goods good) throws MyException{
    	userService.saveGoodByUid(good);
    	ModelAndView mv = new ModelAndView();
    	int page=1;int size = 4;
        List<Goods> goods = userService.findAllGood(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(goods);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("findAllGood");
        return mv;
 
		 
    }
    @RequestMapping("sendOrderById")
    public ModelAndView sendOrderById(Order order) throws MyException{
    	order.setState(1);
    	userService.sendOrderById(order);

    	ModelAndView mv = new ModelAndView();
    	int page=1;int size=4;
        List<Order> order1 = userService.findAllList(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(order1);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("list");
        return mv;
 
		 
    }
    @RequestMapping("addGoodType")
    public String addGoodType() throws MyException{
		  return "addGoodType"; 
    }
    @RequestMapping("addGoodTypeNew")
    public String addGoodTypeNew(GoodType goodType) throws MyException{
    	userService.addGoodTypeNew(goodType);
		  return "home"; 
    }
    @RequestMapping("addGoods")
    public String addGoods(Model model) throws MyException{
    	List<GoodType> list = userService.findGoodType();
    	  model.addAttribute("list", list);
    	  return "addGoods";

    }
    @RequestMapping(value ="addGoodss", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView addGoodss(Goods good,MultipartFile pictureFile) throws MyException, Exception{
    	// 图片新名字
    	String newName = UUID.randomUUID().toString();
    	// 图片原来的名字
    	String oldName = pictureFile.getOriginalFilename();
    	// 后缀
    	String sux = oldName.substring(oldName.lastIndexOf("."));
    	// 新建本地文件流
    	File file = new File("D:\\WebWork\\" + newName + sux);
    	//File file = new File("/software/pic" + newName + sux);
    	// 写入本地磁盘
    	pictureFile.transferTo(file);

    	// 保存图片到数据库
    	good.setPhoto(newName + sux);
    			
    	userService.addGoodNew(good);

    	 ModelAndView mv = new ModelAndView();
    	 int page=1;int size=4;

    	 List<Goods> goods = userService.findAllGood(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(goods);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("findAllGood");
        return mv;
 
 
    }

    @RequestMapping("delUserByUid")
    public ModelAndView delUserByUid(QuervVo Vo) throws MyException{
    	
    	userService.delUserByUid(Vo);

    	ModelAndView mv = new ModelAndView();
    	int page=1;int size=4;
        List<User> user = userService.findAllUsers(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(user);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user");
        return mv;
 
    }
    @RequestMapping("delGoodTypeByUid")
    public ModelAndView delGoodTypeByUid(QuervVo Vo) throws MyException{
    	userService.delGoodTypeByUid(Vo);

    	 ModelAndView mv = new ModelAndView();
    	 int page=1;int size=4;
    	        List<GoodType> goodType = userService.findAllGoodType(page, size);
    	        //PageInfo就是一个分页Bean
    	        PageInfo pageInfo=new PageInfo(goodType);
    	        mv.addObject("pageInfo",pageInfo);
    	        mv.setViewName("findAllGoodType");
    	        return mv;
    	 
    }
    @RequestMapping("delGoodByUid")
    public ModelAndView delGoodByUid(QuervVo Vo) throws MyException{
    	userService.delGoodByUid(Vo);

    	 ModelAndView mv = new ModelAndView();
    	 int page=1;int size=4;
    	        List<Goods> goods = userService.findAllGood(page, size);
    	        //PageInfo就是一个分页Bean
    	        PageInfo pageInfo=new PageInfo(goods);
    	        mv.addObject("pageInfo",pageInfo);
    	        mv.setViewName("findAllGood");
    	        return mv;
    	 
    }
    @RequestMapping("delListByUid")
    public ModelAndView delListByUid(QuervVo Vo) throws MyException{
    	userService.delListByUid(Vo);

ModelAndView mv = new ModelAndView();
int page=1;int size=4;
        List<Order> order = userService.findAllList(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(order);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("list");
        return mv;
 
    }
}
