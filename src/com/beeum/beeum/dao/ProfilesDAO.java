package com.beeum.beeum.dao;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.Profile;

public class ProfilesDAO {
	public static Profile selectProfile(int no) {
		Profile profile = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			profile = session.selectOne("profiles.selectProfile", no);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return profile;
	}
	
	public static int insert(Profile profile) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result= session.insert("profiles.insert", profile);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return result;
	}
	
	public static int update(Profile profile) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result= session.update("profiles.update", profile);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return result;
	}
	
	public static int hasUser(int no) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result= session.selectOne("profiles.hasUser", no);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return result;
	}
	
}
