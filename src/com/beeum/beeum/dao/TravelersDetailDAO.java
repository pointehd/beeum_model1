package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.TravelersDetail;



public class TravelersDetailDAO {

	
	public static int insert(TravelersDetail travelersDetail) {
		int total = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			total = session.insert("travelersDetail.insert", travelersDetail);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return total;
	};
	
	public static List<TravelersDetail> selectListByReqTour(int no) {
		List<TravelersDetail> total = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			total = session.selectList("travelersDetail.selectListByReqTour", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return total;
	};
	
	public static List<TravelersDetail> selectList(int no) {
		List<TravelersDetail> details = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			details = session.selectList("travelersDetail.selectList", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end
		return details;
	}//selectList() end
	

	
}
