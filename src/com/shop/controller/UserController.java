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

    @RequestMapping("login")
    public String login(User user,Model model) throws MyException{
        User user1 = userService.getLogin(user);
        if(user1 == null){
			throw new MyException("查无此人~~~");
		}else if(user1.getState()=="0"){
			throw new MyException("该账户未激活~~~");
		}else{
			if(user1.getType() == 0) {
				model.addAttribute("user", user1);
				
			return "home";
			}
			else
				return "null";
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

        return "null";
    }
    
    @RequestMapping("active")
    public String active(String code) throws MyException{
    	System.out.println(code);
    	userService.saveActive(code);
    	return "login";
    }

	/*
	 * @RequestMapping("homeLoginUser") public String homeLogin(Model model) throws
	 * MyException{
	 * 
	 * //PageHelper.startPage(1, 4); List<User> user = userService.findAllUser();
	 * for(User user1:user) { System.out.println(user1.toString()); }
	 * model.addAttribute("user", user); return "user";
	 * 
	 * }
	 */
    
	/*
	 * @RequestMapping("homeLoginUser") public ModelAndView
	 * homeLogin(@RequestParam(name="page",required = true,defaultValue = "1") int
	 * page,@RequestParam(name="size",required = true,defaultValue = "4") int size)
	 * throws MyException{ ModelAndView mv =new ModelAndView(); List<User> user =
	 * userService.findAllUsers(page,size); PageInfo pageInfo = new
	 * PageInfo(user,4); mv.addObject("pageInfo",pageInfo); mv.setViewName("user1");
	 * return mv;
	 * 
	 * }
	 */
   
    @RequestMapping("homeLoginUser")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") int page, @RequestParam(name = "size", required = true, defaultValue = "4") int size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> user = userService.findAllUsers(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(user);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("user1");
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
    public String edit_userByUid(User user) throws MyException{
    	userService.saveUserByUid(user);
    	System.out.println(user.toString());
		  return "home";
		 
    }
    
    @RequestMapping("outLoginUser")
    public String outLoginUser(String code) throws MyException{
    	
    	return "login";
    }
    
    @RequestMapping("updataUser")
    public String updataUser(String uid) throws MyException{
    	
    	return "login";
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
    	System.out.println(order1);
    	model.addAttribute("order", order1);
		  return "edit_list";
		 
    }
    
	/*
	 * @RequestMapping("delete_userByUid") public String
	 * delete_userByUid(@RequestParam("uid") String[] uid) throws MyException{
	 * String a = Arrays.toString(uid); System.out.println(a); return "e";
	 * 
	 * }
	 */
    
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
    public String edit_goodTypeByUid(GoodType goodType) throws MyException{
    	userService.saveGoodTypeByUid(goodType);
		  return "home";
		 
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
		/*
		 * Goods goods = userService.findGoodById(good); model.addAttribute("good",
		 * goods); return "edit_Good";
		 */
    	Goods goods = userService.findGoodById(good);
    	ModelAndView mav = new ModelAndView();
		mav.addObject("good", goods);
		mav.setViewName("edit_Good");

		return mav;
		 
    }
    
    @RequestMapping("edit_goodByUid")
    public String edit_goodByUid(Goods good) throws MyException{
    	userService.saveGoodByUid(good);
		  return "home";
		 
    }
    @RequestMapping("sendOrderById")
    public String sendOrderById(Order order) throws MyException{
    	order.setState(1);
    	userService.sendOrderById(order);
		  return "home";
		 
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
    public String addGoods() throws MyException{
		  return "addGoods"; 
    }
    @RequestMapping(value ="addGoodss", method = { RequestMethod.POST, RequestMethod.GET })
    public String addGoodss(Goods good,MultipartFile pictureFile) throws MyException, Exception{
    	// 图片新名字
    	String newName = UUID.randomUUID().toString();
    	// 图片原来的名字
    	String oldName = pictureFile.getOriginalFilename();
    	// 后缀
    	String sux = oldName.substring(oldName.lastIndexOf("."));
    	// 新建本地文件流
    	File file = new File("D:\\WebWork\\" + newName + sux);
    	// 写入本地磁盘
    	pictureFile.transferTo(file);

    	// 保存图片到数据库
    	good.setPhoto(newName + sux);
    			
    	userService.addGoodNew(good);
    	
    	//userService.addGoodss(good);
		  return "home";
    }

	/*
	 * @RequestMapping("delUserByUid") public String
	 * delUserByUid(@RequestParam("uid") String[] uid) throws MyException{ String a
	 * = Arrays.toString(uid); userService.delUserByUid(a); System.out.println(a);
	 * //userService.delUserByUid(good); return "home"; }
	 */
    @RequestMapping("delUserByUid")
    public String delUserByUid(QuervVo Vo) throws MyException{
    	userService.delUserByUid(Vo);
    	//userService.delUserByUid(good);
		  return "home";
    }
    @RequestMapping("delGoodTypeByUid")
    public String delGoodTypeByUid(QuervVo Vo) throws MyException{
    	userService.delGoodTypeByUid(Vo);
    	//userService.delUserByUid(good);
		  return "home";
    }
    @RequestMapping("delGoodByUid")
    public String delGoodByUid(QuervVo Vo) throws MyException{
    	userService.delGoodByUid(Vo);
    	//userService.delUserByUid(good);
		  return "home";
    }
    @RequestMapping("delListByUid")
    public String delListByUid(QuervVo Vo) throws MyException{
    	userService.delListByUid(Vo);
    	//userService.delUserByUid(good);
		  return "home";
    }
}
