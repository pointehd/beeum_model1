package com.beeum.beeum.dao;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.TourPic;

public class TourPicsDAO {
	
	//수창
	public static int insert(TourPic tourPic) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("tourPics.insert",tourPic);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}
	
	public static String selectOneDetailedTour(int noTour) {
		String fileName = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			fileName = session.selectOne("tourPics.selectOneDetailedTour",noTour);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return fileName;
	}

}
