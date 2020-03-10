package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.ProfilePic;

public class ProfilePicsDAO {
	public static List<ProfilePic> selectList(int noUser) {
		List<ProfilePic> list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("profilePics.selectList", noUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end;
	
	public static int insert(ProfilePic profilePic) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("profilePics.insert", profilePic);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
		
	}//insert() end;

}
