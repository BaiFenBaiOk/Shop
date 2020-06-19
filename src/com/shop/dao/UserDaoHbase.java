package com.shop.dao;

import java.io.IOException;
import java.sql.SQLException;


import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.util.Bytes;


import cn.itcast.jdbc.TxQueryRunner;


public class UserDaoHbase {

	private static Configuration conf = null;
	static {
		conf = HBaseConfiguration.create();
		conf.set("hbase.zookeeper.quorum", "192.168.18.130");//配置zookeeper所在服务器地址
	}
	


	public static String getResultScann(String tableName,String username,String password) throws IOException {
		System.out.println(username+password);
		Scan scan = new Scan();
	    ResultScanner rs = null;
	    HTable table = new HTable(conf, Bytes.toBytes(tableName));
	    Get get = new Get(Bytes.toBytes("rowkey01"));
	    try {
	        rs = table.getScanner(scan);
	        boolean f= false;
	        for (Result r : rs) {
	            for (KeyValue kv : r.list()) {
	            	
	            	String qualifier = Bytes.toString(kv.getQualifier());//获取当前循环到的列名
	            	String value = Bytes.toString(kv.getValue());//获取当前循环到的列名对应的value值
	            	
	            	if(qualifier.equals("username") && value.equals(username)
	            		){//如果当前列是用户名
	            		f=true;
	            	}
	            }
	        }
	        for (Result r : rs) {
	            for (KeyValue kv : r.list()) {
	            	
	            	String qualifier = Bytes.toString(kv.getQualifier());//获取当前循环到的列名
	            	String value = Bytes.toString(kv.getValue());//获取当前循环到的列名对应的value值
	            	
	            	if(qualifier.equals("password") != value.equals(password)
	            		){//如果当前列是用户名
	            		f=false;
	            	}
	            }
	        }
	        if(f==true) return "1";
	    } finally {
	        rs.close();
	    }
	    return "0";
	}


}
