package reginew;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReginewDAO {

	private Connection conn;	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReginewDAO() {
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
		String SQL = "select eventList from reginew order by eventList desc";
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

	public int write(String eventName, String content, String brandName, String Id, String coupon, String reginewImg, String reginewImgDetail) {
		String SQL="insert into reginew values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, eventName);
			pstmt.setString(3, content);
			pstmt.setString(4, brandName);
			pstmt.setString(5, Id);
			pstmt.setString(6, getDate());
			pstmt.setString(7, coupon);
			pstmt.setString(8, reginewImg);
			pstmt.setString(9, reginewImgDetail);
			pstmt.setInt(10, 1);
			
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	

	public ArrayList<Reginew> getList(int pageNumber){
		String SQL = "select * from reginew where eventList < ? and reginewAvailable = 1 order by eventList desc limit 9;";
		ArrayList<Reginew> list = new ArrayList<Reginew>();
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Reginew reginew = new Reginew();
				reginew.setEventList(rs.getInt(1));
				reginew.setEventName(rs.getString(2));
				reginew.setContent(rs.getString(3));
				reginew.setBrandName(rs.getString(4));
				reginew.setId(rs.getString(5));
				reginew.setDate(rs.getString(6));
				reginew.setCoupon(rs.getString(7));
				reginew.setReginewImg(rs.getString(8));
				reginew.setReginewImgDetail(rs.getString(9));
				reginew.setReginewAvailable(rs.getInt(10));
				list.add(reginew);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	

	
	
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from reginew where eventList < ? and reginewAvailable = 1";
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
	

	public Reginew getReginew(int eventList) {
		String SQL = "select * from reginew where eventList = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, eventList);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				Reginew reginew = new Reginew();
				reginew.setEventList(rs.getInt(1));
				reginew.setEventName(rs.getString(2));
				reginew.setContent(rs.getString(3));
				reginew.setBrandName(rs.getString(4));
				reginew.setId(rs.getString(5));
				reginew.setDate(rs.getString(6));
				reginew.setCoupon(rs.getString(7));
				reginew.setReginewImg(rs.getString(8));
				reginew.setReginewImgDetail(rs.getString(9));
				reginew.setReginewAvailable(rs.getInt(10));
				return reginew;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int eventList, String number, String eventName, String coupon, String content) {
		String SQL="update reginew set eventName = ?, coupon = ?, content = ? where eventList = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, eventName);
			pstmt.setString(2, coupon);
			pstmt.setString(3, content);
			pstmt.setInt(4, eventList);
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	
	public int delete(int eventList) {
		String SQL="update reginew set reginewAvailable = 0 where eventList = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, eventList);
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	
	
	
}


