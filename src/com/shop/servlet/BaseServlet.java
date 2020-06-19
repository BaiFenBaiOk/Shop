package com.shop.servlet;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * @author 百分百欧克
 *该层为反射
 * 获得method方法然后进行处理和跳转
 * 并在xml中配置
 * 
 * 2020年6月1日
 */
public class BaseServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String method = req.getParameter("method");
		if (null == method || "".equals(method) || method.trim().equals("")) {
			method = "execute";
		}

		// 子类对象字节码对象
		Class clazz = this.getClass();

		try {
			// 查找子类对象对应的字节码中的名称为method的方法.
			Method md = clazz.getMethod(method, HttpServletRequest.class, HttpServletResponse.class);
			if (null != md) {
				String jspPath = (String) md.invoke(this, req, resp);
				if (null != jspPath) {
					req.getRequestDispatcher(jspPath).forward(req, resp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 默认方法
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return null;
	}

}