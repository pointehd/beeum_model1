package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.City;

public class CityDAO {
	
	
	public static List<City> selectList(int no){
		SqlSession session = null;
		List<City> result = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectList("city.selectCityList", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	public static List<City> selectBigCity(){
		SqlSession session = null;
		List<City> result = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectList("city.selectBigList");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	public static int selectOne(String city){
		SqlSession session = null;
		int result = 0;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("city.selectOne", city);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}

}
