package com.beeum.beeum.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.beeum.beeum.util.SqlSessionUtil;
import com.beeum.beeum.vo.AvalLang;

public class AvalLangDAO {
	public static List<String> selectListString(int no){
		SqlSession session = null;
		List<String> result = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectList("avalLang.selectListString", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	
	public static List<AvalLang> selectList(int noUser) {
		List<AvalLang>  list = null;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("avalLang.selectList", noUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return list;
	}//selectList() end
	
	//수창
	public static int avalLangCnt(int noUser) {
		int result = 0;
		SqlSession session = null;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.selectOne("avalLang.avalLangCnt", noUser);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}//try~catch~finally end
		
		return result;
	}
	
	public static int delete(int no){
		SqlSession session = null;
		int result = 0;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("avalLang.delete", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}

	public static int insert(AvalLang avalLang){
		SqlSession session = null;
		int result = 0;
		
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("avalLang.insert", avalLang);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
	
	public static List<AvalLang> selectAvalLang(int no){
		SqlSession session = null;
		List<AvalLang> avalLang = null;
		
		try {
			session = SqlSessionUtil.getSession();
			avalLang = session.selectList("avalLang.selectAvalLang", no);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			session.close();
		}
		return avalLang;
	}
	
}
