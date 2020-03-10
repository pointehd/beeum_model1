package com.beeum.beeum.util;

import java.text.DecimalFormat;

public class NumberUtil {
	public static String toNumFormat(int num) {
		  DecimalFormat df = new DecimalFormat("###,###,###");
		  return df.format(num);
	 }

}
