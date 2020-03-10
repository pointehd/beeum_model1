package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.RequestTour;
import com.beeum.beeum.vo.Tour;

public class SuggestToursDAO {
	
	public static List<Tour> selectByReqNo(int no) {
		List<Tour> tour = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tour = session.selectList("suggestTours.selectByReqNo", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tour;		
	}//selectOne() end
	
	public static List<Tour> selectOnlyMyReq(Tour t) {
		List<Tour> tour = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tour = session.selectList("suggestTours.selectOnlyMyReq", t);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tour;		
	}//selectOne() end
	
	
	
	public static List<RequestTour> selectListByUserNo(int no) {
		List<RequestTour> tour = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tour = session.selectList("suggestTours.selectListByUserNo", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tour;		
	}//selectOne() end
}
