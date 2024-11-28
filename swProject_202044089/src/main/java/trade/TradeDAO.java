package trade;

import java.sql.Connection;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class TradeDAO {
	ResultSet rs = null;
	
	public int tradeRegist(int tradenum, String sellerid, String buyerid, int itemnum, String ispaydone) {
		String sql = "insert into tradeinfo values(?,?,?,?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setInt(1, tradenum);
			pstmt.setString(2, sellerid);
			pstmt.setString(3, buyerid);
			pstmt.setString(4, null);
			pstmt.setString(5, "N");
			pstmt.setInt(6, itemnum);
			pstmt.setString(7, "N");
			pstmt.setString(8, ispaydone);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int tradepermission(int tradenum, String tradeway, String isphonenumopen, String isaddropen, String message) {
		String sql = "insert into tradepermission values(?,?,?,?,?)";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setInt(1, tradenum);
			pstmt.setString(2, tradeway);
			pstmt.setString(3, isphonenumopen);
			pstmt.setString(4, isaddropen);
			pstmt.setString(5, message);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getTradeNum() {
		String sql = "select tradenum from tradeinfo order by tradenum desc";
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
	
	public int getMyRequestLength(String id) {
		String sql = "select count(*) from tradeinfo where buyerid = '" + id + "'";
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
	
	public int[] getMyTradeNum(String id, int length) {
		String sql = "select tradenum from tradeinfo where buyerid = '" + id + "'";
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
	
	public int getTradeReqLength(String id) {
		String sql = "select count(*) from tradeinfo where sellerid = '" + id + "'";
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
	
	public int[] getMyTradeReqNum(String id, int length) {
		String sql = "select tradenum from tradeinfo where sellerid = '" + id + "'";
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
	
	public String getIsTradeDone(int itemnum) {
		String sql = "select istradedone from tradeinfo where itemsinfo_itemnum = " +  itemnum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals("N"))
					return "거래 미완료";
				else
					return "거래 완료";
			}else {
				return "거래 미신청";
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public int getitemnum(int tradenum) {
		String sql = "select itemsinfo_itemnum from tradeinfo where tradenum = " + tradenum;
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
	
	public String getsellerid(int tradenum) {
		String sql = "select sellerid from tradeinfo where tradenum = " + tradenum;
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
	
	public String getTradeway(int tradenum) {
		String sql = "select tradeway from tradepermission where tradeinfo_tradenum = " + tradenum;
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
	
	public String getphonenumopen(int tradenum) {
		String sql = "select isphonenumopen from tradepermission where tradeinfo_tradenum = " + tradenum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(rs.getString(1).equals("N"))
					return "전화번호 미공개";
				else
					return "전화번호 공개";
			}else {
				return "전화번호 미공개";
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public String getaddropen(int tradenum) {
		String sql = "select isaddropen from tradepermission where tradeinfo_tradenum = " + tradenum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals("N"))
					return "주소 미공개";
				else
					return "주소 공개";
			}else {
				return "주소 미공개";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public String getIsTradeAllow(int tradenum) {
		String sql = "select istradeallow from tradeinfo where tradenum = " +  tradenum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals("N"))
					return "미수락";
				else
					return "수락됨";
			}else {
				return "미수락";
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	public String getbuyerid(int tradenum) {
		String sql = "select buyerid from tradeinfo where tradenum = " + tradenum;
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
	
	public String getmessage(int tradenum) {
		String sql = "select message from tradepermission where tradeinfo_tradenum = " + tradenum;
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
	
	public int tradeAllow(int tradenum) {
		String sql = "update tradeinfo set istradeAllow = ? where tradenum = " + tradenum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "Y");

			return pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
	
	public String IsTradeAllow(int tradenum) {
		String sql = "select istradeallow from tradeinfo where tradenum = " +  tradenum;
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
	
	public int tradeDone(int tradenum) {
		String sql = "update tradeinfo set istradedone = ?, tradedonedate = ? where tradenum = " + tradenum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			Date date = new Date();
			SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = simpleDate.format(date);
			
			pstmt.setString(1, "Y");
			pstmt.setString(2, strdate);

			return pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
	
	public String IsTradeDone(int tradenum) {
		String sql = "select istradedone from tradeinfo where tradenum = " +  tradenum;
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
	
	public String getTradeDoneDate(int tradenum) {
		String sql = "select tradedonedate from tradeinfo where tradenum = " +  tradenum;
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
	
	public String getIsPayDone(int tradenum) {
		String sql = "select ispaydone from tradeinfo where tradenum = " +  tradenum;
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
	
	public int tradeDupCheck(int itemnum) {
		String sql = "select count(*) from tradeinfo where itemsinfo_itemnum = " +  itemnum;
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
	
	public int getItemTradeNum(int itemnum) {
		String sql = "select tradenum from tradeinfo where itemsinfo_itemnum = " +  itemnum;
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
	
	public int tradeRefuse(int tradenum) {
		String sql = "delete from tradeinfo where tradenum = ?";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, tradenum);

			return pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
	
	public int tradePermissionRefuse(int tradenum) {
		String sql = "delete from tradepermission where tradeinfo_tradenum = ?";
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, tradenum);

			return pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
	
	public int paydone(int tradenum) {
		String sql = "update tradeinfo set ispaydone = ? where tradenum = " + tradenum;
		try {
			// 각각의 데이터를 실제로 넣어준다.
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "Y");

			return pstmt.executeUpdate();
			

		} catch (Exception e) {
			e.printStackTrace();
		}
			return -1;
	}
}
