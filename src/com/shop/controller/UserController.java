package com.shop.controller;

import com.shop.exception.ExceptionFactory;
import com.shop.exception.MyException;
import com.shop.pojo.User;
import com.shop.service.UserService;
import com.shop.utils.UUIDUtils;

import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login(User user) throws MyException{
        User user1 = userService.getLogin(user);
        if(user1 == null){
			throw new MyException("查无此人~~~");
		}else if(user1.getState()!="1"){
			throw new MyException("该账户未激活~~~");
		}else{
			return "null";
		}
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
}
