package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	ResultSet rs = null;

	public int join(String ID, String Password, String Name, String Phone, String Addr, String Email) {
		String sql = "insert into users values(?,?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setString(1, ID);
			pstmt.setString(2, Password);
			pstmt.setString(3, Name);
			pstmt.setString(4, Phone);
			pstmt.setString(5, Addr);
			pstmt.setString(6, Email);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public boolean idCheck(String id) {
		String sql = "select id from users";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(id.equals(rs.getString(1))){
					return false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	public boolean pwdCheck(String id, String password) {
		String sql = "select id,password from users";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if(id.equals(rs.getString(1))){
					if(password.equals(rs.getString(2)) == true)
						return true;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public String getname(String id) {
		String sql = "select name from users where id = '" + id + "'";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public String getphone(String id) {
		String sql = "select phone from users where id = '" + id + "'";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public String getaddr(String id) {
		String sql = "select address from users where id = '" + id + "'";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public String getemail(String id) {
		String sql = "select email from users where id = '" + id + "'";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return rs.getString(1);

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
}
