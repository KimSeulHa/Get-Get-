package coupon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import user.User;

public class CouponDAO {

	private Connection conn;	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CouponDAO() {
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

	public int getNext() {
		String SQL = "select couponnum from coupon order by couponnum desc";
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
	public int write(String id, String eventName, String couponImg) {
		String SQL="insert into coupon values (?, ?, ?, ?, ?)";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, id);	
			pstmt.setString(3, eventName);
			pstmt.setString(4, couponImg);
			pstmt.setInt(5, 1);
			
			return pstmt.executeUpdate();
			} catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}

	public ArrayList<Coupon> getList(int pageNumber){
		String SQL = "select * from coupon where couponnum < ? and couponAvailable = 1 order by couponnum desc limit 5;";
		ArrayList<Coupon> list = new ArrayList<Coupon>();
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setCouponnum(rs.getInt(1));
				coupon.setId(rs.getString(2));
				coupon.setEventName(rs.getString(3));
				coupon.setCouponImg(rs.getString(4));
				coupon.setCouponAvailable(rs.getInt(5));
				list.add(coupon);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean nextPage(int pageNumber) {
		String SQL = "select * from coupon where couponnum < ? and couponAvailable = 1";
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
	
	public Coupon getCoupon(int couponnum) {
		String SQL = "select * from jevent where couponnum = ?";
		try { 
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setInt(1, couponnum);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				Coupon coupon = new Coupon();
				coupon.setCouponnum(rs.getInt(1));
				coupon.setId(rs.getString(2));
				coupon.setEventName(rs.getString(3));
				coupon.setCouponImg(rs.getString(4));
				coupon.setCouponAvailable(rs.getInt(5));
				return coupon;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}


