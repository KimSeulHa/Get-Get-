package JEvent;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class JeventDAO {

	private Connection conn;	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public JeventDAO() {
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
		String SQL = "select jeventnum from JEvent order by jeventnum desc";
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
	public int write(String id, String eventName, String brandName, String Jeventimg) {
		String SQL="insert into jevent values (?, ?, ?, ?, ?, ?)";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, id);	
			pstmt.setString(3, eventName);
			pstmt.setString(4, brandName);
			pstmt.setString(5, Jeventimg);
		
			pstmt.setInt(6, 0);
			
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}

	public ArrayList<Jevent> getList(int pageNumber){
		String SQL = "select * from jevent where Jeventnum < ? and JeventAvailable = 0 order by Jeventnum desc limit 10;";
		ArrayList<Jevent> list = new ArrayList<Jevent>();
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Jevent jevent = new Jevent();
				jevent.setJeventnum(rs.getInt(1));
				jevent.setId(rs.getString(2));
				jevent.setEventName(rs.getString(3));
				jevent.setBrandName(rs.getString(4));
				jevent.setJeventimg(rs.getString(5));
				jevent.setJeventAvailable(rs.getInt(6));
				list.add(jevent);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "select * from Jevent where Jeventnum < ? and JeventAvailable = 1";
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
	
	public Jevent getJevent(int Jeventnum) {
		String SQL = "select * from jevent where Jeventnum = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, Jeventnum);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				Jevent Jevent = new Jevent();
				Jevent.setJeventnum(rs.getInt(1));
				Jevent.setEventName(rs.getString(2));
				Jevent.setBrandName(rs.getString(3));
				Jevent.setId(rs.getString(4));
				Jevent.setJeventimg(rs.getString(5));
				Jevent.setJeventAvailable(rs.getInt(6));
				return Jevent;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	   public int updateCoupon(int Jeventnum) {
		      String SQL = "update jevent set JeventAvailable = JeventAvailable +1 where Jeventnum=? ";
		      try {
		         pstmt = conn.prepareStatement(SQL);
		         pstmt.setInt(1, Jeventnum);
		         return pstmt.executeUpdate();
		      }catch(Exception e) {
		         e.printStackTrace();
		         }
		      return -1;
		   }
}


