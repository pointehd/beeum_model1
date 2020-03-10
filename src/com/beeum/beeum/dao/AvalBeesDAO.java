package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.AvalBee;

public class AvalBeesDAO {
	public static List<AvalBee> selectList(int no){
		List<AvalBee> list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("avalBees.selectList", no);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}
	
	public static List<String> selectListOnlytType(int no){
		List<String> list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("avalBees.selectListOnlytType", no);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			session.close();
		}
		return list;
	}
	
	
}
