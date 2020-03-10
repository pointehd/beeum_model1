package com.beeum.beeum.util;

public class ThemeUtil {
	public static String themePrint(String theme) {
		if(theme.equals("L")) {
			return "로컬";
		}else if(theme.equals("H")) {
			return "역사";
		}else if(theme.equals("N")) {
			return "자연";
		}else if(theme.equals("E")) {
			return "체험";
		}else if(theme.equals("P")) {
			return "레포츠";
		}else if(theme.equals("S")) {
			return "쇼핑";
		}		
		return "";
	}
}
