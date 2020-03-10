package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.RequestTheme;

public class RequestThemeDAO {
	public static int insert(RequestTheme requestTheme) {
		int total = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			total = session.insert("requestTheme.insert", requestTheme);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return total;
	};
	
	
	public static List<String> selectListByReqTour(int no) {
		List<String> total = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			total = session.selectList("requestTheme.selectListByReqTour", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return total;
	};
	
	public static List<RequestTheme> selectList(int no) {
		List<RequestTheme> themes = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			themes = session.selectList("requestTheme.selectList", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end
		return themes;
	}//selectList() end
	
}
