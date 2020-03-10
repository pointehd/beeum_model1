package com.beeum.beeum.dao;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;

public class CourseCategoriesDAO {
	
	//수창
	public static int selectOne(String category) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("courseCategories.selectOne", category);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}//selectOne() end
	
	

}
