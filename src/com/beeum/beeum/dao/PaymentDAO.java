package com.beeum.beeum.dao;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.Payment;

public class PaymentDAO {
	
	public static int insert(Payment payment) {
		int result = 0;
		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("payment.insert",payment);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		return result;
	}
	public static int selectWeekTotal() {
		int weekTourCnt = 0;
		SqlSession session = null;
		try {
		session = SqlSessionUtil.getSession();
		weekTourCnt = session.selectOne("payment.selectWeekTotal");
		} catch (Exception e) {
		e.printStackTrace();
		} finally {
		session.close();
		} // try~catch~finally end
		return weekTourCnt;
	}//selectWeekTotal() end

}
