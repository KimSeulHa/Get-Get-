package JEvent;

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

import JEvent.Jevent;
import JEvent.JeventDAO;

import reginew.Reginew;
import reginew.ReginewDAO;

import faq.Faq;//del
import faq.FaqDAO;//del
import util.StringUtils;

/**
 * Servlet implementation class FileWriteAction
 */
@WebServlet("/JeventAction")
public class JeventAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<script type='text/javascript'>");
		out.print("alert('잘못된 경로로 접근하셨습니다.'); ");
		out.print("location.href = '';            ");
		out.print("</script>                      ");
		out.flush();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String directory = request.getServletContext().getRealPath("/upload");
		int maxSize=1024*1024*100;
		String encoding = "UTF-8";
		HttpSession session = request.getSession();

		MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());

		String id = StringUtils.nvl((String)session.getAttribute("Id"), "");
		Enumeration enums = session.getAttributeNames();
		String key = "";
		while(enums.hasMoreElements()) {
			key = (String)enums.nextElement();
			System.out.println(key + " = " + session.getAttribute(key));
		}
		String eventName = StringUtils.nvl(multi.getParameter("eventName"), "");
		String brandName = StringUtils.nvl(multi.getParameter("brandName"), "");
		String Jeventimg = StringUtils.nvl(multi.getOriginalFileName("Jeventimg"), "");
		
		
		Jevent Jevent = new Jevent();
		Jevent.setId(id);
		Jevent.setEventName(eventName);
		Jevent.setBrandName(brandName);
		Jevent.setJeventimg(Jeventimg);
		
		
		if(id.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");	//이전페이지로 돌아간다 즉 로그인 페이지
			script.println("</script>");
		} else{
			if(Jevent.getEventName() == null || Jevent.getBrandName() == null || Jevent.getJeventimg() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 항목을 입력해주세요.')");
				script.println("history.back()");	
				script.println("</script>");
			}else{	
				JeventDAO jeventDAO = new JeventDAO();
				int result = jeventDAO.write(Jevent.getId(),Jevent.getEventName(),Jevent.getBrandName(), Jevent.getJeventimg());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패, 오류!!')");
					script.println("history.back()");	
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이벤트 참여가 완료되었습니다')");
					script.println("location.href = '/getget/regievent/popularevent.jsp'");
					script.println("</script>");
				}
			}
		}
	}
	
	
}
