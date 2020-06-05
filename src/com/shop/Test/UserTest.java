package com.shop.Test;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.shop.mapper.UserMapper;
import com.shop.pojo.User;


public class UserTest {
	@Test
	public void testGetUserById() throws Exception {
		//创建SqlSessionFactoryBuilder对象
				SqlSessionFactoryBuilder s=new SqlSessionFactoryBuilder();
				//配置输入流
				InputStream input=Resources.getResourceAsStream("spring/SqlMapConfig.xml");
				//通过输入流创建创建SqlSessionFactory对象
				SqlSessionFactory sql=s.build(input);
				//创建SqlSession对象
				SqlSession ss=sql.openSession();
				
				UserMapper userMapper=ss.getMapper(UserMapper.class);
				User user=new User();
				
				/* user.setUsername("a"); user.setPassword("a"); */
				 
					
					  user.setUsername("百分百欧克1"); user.setPassword("1");
					 
				User user1=userMapper.getLogin(user);
				System.out.println(user1);
				ss.close();
		
	}

}
