package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.PageVO;
import com.beeum.beeum.vo.Review;
import com.beeum.beeum.vo.ToLocalReview;

public class ToLocalReviewsDAO {
public static int selectTotal() {
		
		int total = 0;
		
		SqlSession session = null;
		
		try {
			
			session = SqlSessionUtil.getSession();
			
			total = session.selectOne("toLocalReviews.selectTotal");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return total;
		
	};//selectTotal() end

	public static List<ToLocalReview> selectList(PageVO pageVO) {
		List<ToLocalReview> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();	
			list = session.selectList("toLocalReviews.selectList", pageVO);
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
			list = session.selectList("toLocalReviews.selectGetterReviews", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	};//selectList() end
	
	public static List<Review> selectSenderReviews(int no) {
		List<Review> list = null;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();	
			list = session.selectList("toLocalReviews.selectSenderReviews", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return list;
	};//selectList() end

}
