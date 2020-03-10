package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.PageVO;
import com.beeum.beeum.vo.User;

public class UsersDAO {
	public static User selectOne(int noUser) {
		User user = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			user = session.selectOne("users.selectOne", noUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return user;
	}
	
	public static User selectUser(int no) {
		User user = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			user = session.selectOne("users.selectUser", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}
		return user;
	}
	
	public static int insert(User user) {
		int result = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("users.insert", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}//insert() end
	
	
	public static User selectLogin(User user) {
		User loginUser = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			loginUser = session.selectOne("users.selectLogin", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return loginUser;
	}//selectLogin() end
	
	public static int updateName(User user) {
		int result = 0;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			result = session.update("users.updateName", user);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}//insert() end
	
	public static List<User> selectProfile(PageVO pageVO) {
		List<User> list = null;
		SqlSession session = null;

		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("users.selectProfile", pageVO);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	}//selectProfile() end
	
}
