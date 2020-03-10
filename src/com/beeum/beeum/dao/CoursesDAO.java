package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.Course;

public class CoursesDAO {

	//수창
	public static int insert(Course course) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("courses.insert",course);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}
	
	//수창
	public static List<Course> selectListDetailedTour(int noCourse){
		List<Course> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("courses.selectListDetailedTour",noCourse);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	}
}
