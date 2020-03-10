package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.PageVO;
import com.beeum.beeum.vo.Review;
import com.beeum.beeum.vo.ToTravelerReview;

public class ToTravelerReviewsDAO {
	public static int selectTotal() {
		int total = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			total = session.selectOne("toTravelerReviews.selectTotal");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return total;
	};//selectTotal() end

	public static List<ToTravelerReview> selectList(PageVO pageVO) {
		List<ToTravelerReview> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("toTravelerReviews.selectList", pageVO);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	};//selectList() end
	
	public static int selectTravelerR(int no) {
		int travelerReview = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			travelerReview = session.selectOne("toTravelerReviews.selectTravelerR", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		} // try~catch~finally end
		return travelerReview;
	}//selectTravelerR() end
	
	
	public static List<Review> selectSenderReviews(int no) {
		List<Review> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("toTravelerReviews.selectSenderReviews", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	};//selectList() end
	
	public static List<Review> selectGetterReviews(int no) {
		List<Review> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("toTravelerReviews.selectGetterReviews", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	};//selectList() end

}
