package item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.DatabaseUtil;

public class ItemDAO {
	ResultSet rs = null;

	public int upload(int itemnum, String itemName, String Price, String id, int categoryCode, String imgname, String content, String trademethod, String exchangeitemname) {
		String sql = "insert into itemsinfo values(?,?,?,?,?,?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			Date date = new Date();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = simpleDate.format(date);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setInt(1, itemnum);
			pstmt.setString(2, strdate);
			pstmt.setString(3, itemName);
			pstmt.setString(4, Price);
			pstmt.setString(5, id);
			pstmt.setInt(6, categoryCode);
			pstmt.setString(7, imgname);
			pstmt.setString(8, content);
			pstmt.setString(9, trademethod);
			pstmt.setString(10, exchangeitemname);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int count() {
		String sql = "select count(*) from itemsinfo";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			return rs.getInt(1) + 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
	
	public int categorycode(String platform, String genre) {
		String sql = "select categorycode from category where platform = '" + platform + "' and genre = '" + genre +"'";
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
	
	public String getPlatform(int categorycode) {
		String sql = "select platform from category where categorycode = " +  categorycode;
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
	
	public String getGenre(int categorycode) {
		String sql = "select genre from category where categorycode = " +  categorycode;
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
	
	public String getPostdate(int itemnum) {
		String sql = "select postdate from itemsinfo where itemnum = " + itemnum;
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
	
	public String getItemname(int itemnum) {
		String sql = "select itemname from itemsinfo where itemnum = " + itemnum;
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
	
	public String getPrice(int itemnum) {
		String sql = "select price from itemsinfo where itemnum = " + itemnum;
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
	
	public String getImgname(int itemnum) {
		String sql = "select imgname from itemsinfo where itemnum = " + itemnum;
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
	
	public int getNewitem() {
		String sql = "select itemnum from itemsinfo order by itemnum desc";
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
	
	public int getCategorycode(int itemnum) {
		String sql = "select category_categorycode from itemsinfo where itemnum = " + itemnum;
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
	
	public String getContent(int itemnum) {
		String sql = "select content from itemsinfo where itemnum = " + itemnum;
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
	
	public String getId(int itemnum) {
		String sql = "select users_id from itemsinfo where itemnum = " + itemnum;
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
	
	public int[] getMyItemNum(String id, int length) {
		String sql = "select itemnum from itemsinfo where users_id = '" + id + "'";
		int[] myitem = new int[length];
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
	
	public int getMyItemlength(String id) {
		String sql = "select count(*) from itemsinfo where users_id = '" + id + "'";
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
	
	public String getTradeMethod(int itemnum) {
		String sql = "select trademethod from itemsinfo where itemnum = " + itemnum;
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
	
	public int getCategoryCount(int categorycode, String trademethod) {
		String sql = "select count(*) from itemsinfo where category_categorycode = " + categorycode + " and trademethod = '" + trademethod + "'";
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
	
	public int[] getItemNum(int categorycode, int categorycount, String trademethod) {
		String sql = "select itemnum from itemsinfo where category_categorycode = " + categorycode + " and trademethod = '" + trademethod + "'";
		int[] myitem = new int[categorycount];
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
	
	public String getExchangeItemName(int itemnum) {
		String sql = "select exchangeitemname from itemsinfo where itemnum = " + itemnum;
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
	
	public int getSearchCount(String search) {
		String sql = "select count(*) from itemsinfo where itemname like '%" + search + "%'";
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
	
	public int[] getSearchNum(int searchcount, String search) {
		String sql = "select itemnum from itemsinfo where itemname like '%" + search + "%'";
		int[] myitem = new int[searchcount];
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
}
