package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.Wish;

public class WishDAO {
	
	public static List<Wish> selectTourWish(int no){
		SqlSession session = null;
		List<Wish> list = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list=  session.selectList("wish.selectTourWish", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
}
