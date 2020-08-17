package util;

public class StringUtils {
	public static String nvl(String str, String repl) {
		if (str == null || str.trim().equals("")) {
			return repl;
		}
		return str;
	}
}
