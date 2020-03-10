package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.Career;

public class CareersDAO {

	public static List<Career> selectList(int noUser) {
		List<Career>  list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("careers.selectList", noUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
}
