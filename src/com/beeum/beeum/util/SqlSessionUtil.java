package com.beeum.beeum.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionUtil {
	
	public static SqlSession getSession() {
		
		SqlSession session = null;
		
		try {
			
			Reader reader = 
				Resources.getResourceAsReader("com/beeum/beeum/config/mybatis-config.xml");
			
			SqlSessionFactory factory = 
				new SqlSessionFactoryBuilder().build(reader);
			
			session = factory.openSession(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}//try ~ catch end
		
		return session;
		
	}//getSession() end
	
}
