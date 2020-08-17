package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	private Connection conn;	 //데이터베이스에 접근하기 위한 객체
	private PreparedStatement pstmt;
	private ResultSet rs;	//정보를 담기 위한 객체
	
	public UserDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/getget?useSSL=false&serverTimezone=UTC";	//LOCALHOST 본인 컴퓨터의 디비
			String ID = "root";
			String Password = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, ID, Password);
		}catch(Exception e) {	//예외처리
			e.printStackTrace();	//오류가 뭔지 출력
		}
	}
	
	public int login(String id,String passwd) {
		String SQL = "select passwd from getget where id =?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);	//매개변수로 넘어 온 id를 ?에 넣어주는 것
			rs = pstmt.executeQuery();	//실행결과를 넣음
			if(rs.next()) { //결과가 존재한다면 
				System.out.println("passwd = " + rs.getString(1));
				if(rs.getString(1).equals(passwd))	{//결과 rs를 가져와서 passwd와 동일한지 비교
					if(id.equals("admin")&&passwd.equals("1234")) {
						return 2;
					}
					return 1;

				}else {
					return 0;	
				}//비밀번호가 다름
			}
			return -1;	//아이디가 없다				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터오류
	}
	
	public int join(User member) {
		String SQL ="insert into getget (id,passwd,name,phoneNumber) values(?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,member.getId());
			pstmt.setString(2,member.getPasswd());
			pstmt.setString(3,member.getName());
			pstmt.setString(4,member.getPhoneNumber());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}
	public ArrayList<User> getUserList(){
		String SQL = "select * from getget;";
		 ArrayList<User> list = new ArrayList<User>();
		 
		 try {
			 PreparedStatement pstmt= conn.prepareStatement(SQL);
			 rs=pstmt.executeQuery();
			 while(rs.next()) {
				 User u = new User();
				 
				 u.setId(rs.getString(1));
				 u.setPasswd(rs.getString(2));
				 u.setName(rs.getString(3));
				 u.setPhoneNumber(rs.getString(4));
				 u.setMoney(rs.getInt(5));
				 
				 list.add(u);
			 }
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		return list;
		 
	}
	public User getUser(String id) {
		User user = null;
		try {
			String SQL = "select * from getget where id = ?";
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				user = new User();
				user.setId(rs.getString("id"));
				user.setPasswd(rs.getString("passwd"));
				user.setName(rs.getString("name"));
				user.setPhoneNumber(rs.getString("phoneNumber"));
				user.setMoney(rs.getInt("money"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
	}
	public int updateUser(User member) {
		String SQL ="update getget set passwd=?, phoneNumber=? where id=? ";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,member.getPasswd());
			pstmt.setString(2,member.getPhoneNumber());
			pstmt.setString(3,member.getId());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			}
		return -1;
	}


}
