package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.FilterVO;
import com.beeum.beeum.vo.RequestTour;

public class RequestToursDAO {
	public static int insert(RequestTour requestTour) {
		int tourCnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tourCnt = session.insert("requestTours.insert", requestTour);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tourCnt;
	}//selectTotal() end
	
	public static List<RequestTour> selectListByUser(int no) {
		List<RequestTour> tourCnt = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tourCnt = session.selectList("requestTours.selectListByUser", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tourCnt;
	}//selectTotal() end
	
	
	public static List<RequestTour> selectListTargetNo(int no) {
		List<RequestTour> tourCnt = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tourCnt = session.selectList("requestTours.selectListTargetNo", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tourCnt;
	}//selectTotal() end
	
public static List<RequestTour> selectList(FilterVO filterVO) {
		List<RequestTour> tours = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tours = session.selectList("requestTours.selectList", filterVO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tours;
	}//selectList() end
}



