package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.MyArea;

public class MyAreaDAO {

	public static int delete(int no){
		SqlSession session = null;
		int result = 0;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("myArea.delete", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}

	public static int insert(MyArea myArea){
		SqlSession session = null;
		int result = 0;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("myArea.insert", myArea);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	public static List<MyArea> selectListByUser(int no){
		SqlSession session = null;
		List<MyArea> result = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectList("myArea.selectListByUser", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
}
