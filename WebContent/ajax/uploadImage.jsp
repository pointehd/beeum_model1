<%@page import="util.ResizeImageUtil"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//기본 WAS 경로
String root = request.getServletContext().getRealPath("");
//원본 파일 경로
String uploadPath = root+"upload"+File.separator;
//프로필 사진 모아놓는 폴더 경로
String profilePath = root+"img"+File.separator;

MultipartRequest mr = 
	   new MultipartRequest(request,//요청객체
			                uploadPath,//원본파일업로드경로
			                1024*1024*100,//파일사이즈(100메가)
			                "UTF-8",//한글처리 인코딩
			                new DefaultFileRenamePolicy());
                             //중복된 파일이름 어떻게 처리할지 객체

//파일 이름 얻기
String fileName = mr.getFilesystemName("uploadImg");
                             
String type = mr.getParameter("type");

String src = "/";
	
switch(type) {
case "P" : 
	src+="img/";
	   
	ResizeImageUtil.resize(uploadPath+fileName,profilePath+fileName,140);
	break;
case "B" : 
	src+="upload/";
	break;
}//switch end

src+= fileName;
%>
{"src":"<%=src%>"}