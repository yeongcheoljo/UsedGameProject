package commentinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.DatabaseUtil;

public class CommentinfoDAO {
	ResultSet rs = null;

	public int commentAdd(int commentnum, String id, int itemnum, String comment) {
		String sql = "insert into commentinfo values(?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			Date date = new Date();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = simpleDate.format(date);
			
			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setInt(1, commentnum);
			pstmt.setString(2, id);
			pstmt.setString(3, strdate);
			pstmt.setInt(4, itemnum);
			pstmt.setString(5, comment);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getCommentCount(int itemnum) {
		String sql = "select count(*) from commentinfo where itemnum = " + itemnum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();

			return rs.getInt(1);
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
	
	public int[] getCommentNum(int commentcount, int itemnum) {
		String sql = "select commentnum from commentinfo where itemnum = " + itemnum;
		int[] myitem = new int[commentcount];
		int count = 0;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				myitem[count] = rs.getInt(1);
				count++;
			}
			return myitem;
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return myitem;
	}
	
	public String getCommentId(int commentnum) {
		String sql = "select id from commentinfo where commentnum = " + commentnum;
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
	
	public String getCommentDate(int commentnum) {
		String sql = "select commentdate from commentinfo where commentnum = " + commentnum;
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
	
	public String getComment(int commentnum) {
		String sql = "select comment from commentinfo where commentnum = " + commentnum;
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
	
	public int getCommentNum() {
		String sql = "select commentnum from commentinfo order by commentnum desc";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}else
				return 1;
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
}
