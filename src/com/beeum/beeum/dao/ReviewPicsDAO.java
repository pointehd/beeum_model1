package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;

public class ReviewPicsDAO {
	
	public static List<String> selectListTtr(int no){
		List<String> a = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			a = session.selectList("reviewPics.selectListTtr", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return a;
	}
	
	public static List<String> selectListTlr(int no){
		List<String> a = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			a = session.selectList("reviewPics.selectListTlr", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return a;
	}
}
