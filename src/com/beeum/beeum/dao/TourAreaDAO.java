package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.City;
import com.beeum.beeum.vo.TourArea;

public class TourAreaDAO {
	
	//수창
	public static int insert(TourArea tourArea) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("tourArea.insert",tourArea);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}
	// 수창
	public static List<City> selectListDetailedTour(int noTour){
		List<City> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("tourArea.selectListDetailedTour",noTour);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	}

}
