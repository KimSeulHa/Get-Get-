package faq;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FaqDAO {

	private Connection conn;	 
	private PreparedStatement pstmt;
	private ResultSet rs;	
	
	public FaqDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/getget?serverTimezone=UTC";
			String ID = "root";
			String Password = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, ID, Password);
		}catch(Exception e) {	
			e.printStackTrace();	
		}
	}
	public String getDate() {
		String SQL="SELECT NOW()";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "select faqnum from faq order by faqnum desc";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String faqTitle, String Id, String faqContent, String faqimg) {
		String SQL="insert into faq values (?, ?, ?, ?, ?, ?, ?)";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, faqTitle);
			pstmt.setString(3, Id);
			pstmt.setString(4, getDate());
			pstmt.setString(5, faqContent);
			pstmt.setString(6, faqimg);
			pstmt.setInt(7, 1);
			
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	
	public ArrayList<Faq> getList(int pageNumber){
		String SQL = "select * from faq where faqnum < ? and faqAvailable = 1 order by faqnum desc limit 10;";
		ArrayList<Faq> list = new ArrayList<Faq>();
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Faq faq = new Faq();
				faq.setFaqnum(rs.getInt(1));
				faq.setFaqTitle(rs.getString(2));
				faq.setId(rs.getString(3));
				faq.setDate(rs.getString(4));
				faq.setFaqContent(rs.getString(5));
				faq.setFaqimg(rs.getString(6));
				faq.setFaqAvailable(rs.getInt(7));
				list.add(faq);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "select * from faq where faqnum < ? and faqAvailable = 1";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public Faq getFaq(int faqnum) {
		String SQL = "select * from faq where faqnum = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, faqnum);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				Faq faq = new Faq();
				faq.setFaqnum(rs.getInt(1));
				faq.setFaqTitle(rs.getString(2));
				faq.setId(rs.getString(3));
				faq.setDate(rs.getString(4));
				faq.setFaqContent(rs.getString(5));
				faq.setFaqimg(rs.getString(6));
				faq.setFaqAvailable(rs.getInt(7));
				return faq;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int faqnum, String faqTitle, String faqContent) {
		String SQL="update faq set faqTitle = ?, faqContent =? where faqnum = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, faqTitle);
			pstmt.setString(2, faqContent);
			pstmt.setInt(3, faqnum);
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	
	public int delete(int faqnum) {
		String SQL="update faq set faqAvailable = 0 where faqnum = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, faqnum);
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	
	
	
}