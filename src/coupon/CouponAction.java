package coupon;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import reginew.ReginewDAO;
import util.StringUtils;

@WebServlet("/CouponAction")
public class CouponAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>");
		out.print("alert('잘못된 경로로 접근하셨습니다.'); ");
		out.print("location.href = 'history.back()';            ");
		out.print("</script>                      ");
		out.flush();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String directory = request.getServletContext().getRealPath("/upload");
		int maxSize=1024*1024*100;
		String encoding = "UTF-8";
		HttpSession session = request.getSession();

		MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

		/*
		 * String id = StringUtils.nvl((String)session.getAttribute("Id"), "");
		 * Enumeration enums = session.getAttributeNames(); String key = "";
		 * while(enums.hasMoreElements()) { key = (String)enums.nextElement();
		 * System.out.println(key + " = " + session.getAttribute(key)); }
		 */
		String id = StringUtils.nvl(multi.getParameter("id"), "");
		String couponImg = StringUtils.nvl(multi.getOriginalFileName("couponImg"), "");
		String eventName = StringUtils.nvl(multi.getParameter("eventName"), "");
		
		Coupon coupon = new Coupon();
		coupon.setId(id);
		coupon.setEventName(eventName);
		coupon.setCouponImg(couponImg);
		
		CouponDAO couponDAO = new CouponDAO();
		int result = couponDAO.write(coupon.getId(), coupon.getEventName(), coupon.getCouponImg());
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기 실패, 오류!!')");
			script.println("history.back()");	
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('쿠폰을 전송하였습니다.')");
			script.println("location.href = '/getget/admin/couponManage.jsp'");
			script.println("</script>");
		}
}
}
