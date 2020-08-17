package faq;

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

import util.StringUtils;

/**
 * Servlet implementation class FileWriteAction
 */
@WebServlet("/FaqWriteAction")
public class FaqWriteAction extends HttpServlet {
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
		String faqimg = StringUtils.nvl(multi.getOriginalFileName("faqimg"), "");
		//String realFileName = StringUtils.nvl(multi.getFilesystemName("faqimg"), "");
		String faqTitle = StringUtils.nvl(multi.getParameter("faqTitle"), "");
		String faqContent = StringUtils.nvl(multi.getParameter("faqContent"), "");
		
		Faq faq = new Faq();
		faq.setId(id);
		faq.setFaqTitle(faqTitle);
		faq.setFaqContent(faqContent);
		faq.setFaqimg(faqimg);

		if(id.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");	//이전페이지로 돌아간다 즉 로그인 페이지
			script.println("</script>");
		} else{
			if(faq.getFaqTitle() == null || faq.getFaqContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('모든 항목을 입력해주세요.')");
				script.println("history.back()");	
				//script.println("location.href = 'faq.jsp'");
				script.println("</script>");
			}else{	
				FaqDAO faqDAO = new FaqDAO();
				// getFaqimg
				int result = faqDAO.write(faq.getFaqTitle(), faq.getId(), faq.getFaqContent(), faq.getFaqimg());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패, 오류!!')");
					script.println("history.back()");	
					script.println("</script>");
				}else{
				//session.setAttribute("Id",user.getId());
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'faq.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}
