package com.beeum.beeum.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.Tour;


public class ToursDAO {
	public static int selectTotal() {
		int tourCnt = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tourCnt = session.selectOne("tours.selectTotal");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tourCnt;
	}//selectTotal() end
	
	public static Tour selectOne(int no) {
		Tour tour = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tour = session.selectOne("tours.selectOne", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tour;
	}//selectOne() end
	
	public static List<Tour> selectTourBox(int no) {
		List<Tour> tour = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tour = session.selectList("tours.selectTourBox", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tour;		
	}//selectOne() end

	//수창
	public static int insert(Tour tour) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("tours.insert",tour);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}
	// 수창
	public static Tour selectDetailedTour(int noTour) {
		Tour tour = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tour = session.selectOne("tours.selectDetailedTour", noTour);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return tour;
	}

	
	
	
	
	
	//예빈	
	public static int selectMaxPrice() {
		int price = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			price = session.selectOne("tours.selectMaxPrice");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return price;
	}
	
	//예빈
	public static int selectMaxTime() {
		int time = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			time = session.selectOne("tours.selectMaxTime");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return time;
	}
	
	//예빈	
	public static List<Tour> selectAllList() {
		List<Tour> tours = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tours = session.selectList("tours.selectAllList");
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return tours;
	}
	//예빈
	public static List<Tour> selectFilterList(Map<String, Object> tour) {
		List<Tour> tours = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			tours = session.selectList("tours.selectFilterList", tour);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return tours;
	}
	
	
	
	
}
