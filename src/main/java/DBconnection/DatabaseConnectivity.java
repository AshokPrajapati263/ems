package DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.CallableStatement;

public class DatabaseConnectivity {

	private DatabaseConnectivity() {

	}

	static DatabaseConnectivity databaseConnectivity = null;
	Connection con = null;
	Statement state = null;
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null; 
	
	private String cForName = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/ems";
	private String user = "root";
	private String pass = "root";

	public void openConnection() throws ClassNotFoundException, SQLException {
		Class.forName(cForName);
		con = DriverManager.getConnection(url, user, pass);
		state = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	}

	public void excuteData(PreparedStatement pst) throws SQLException {
		pst.executeUpdate();
	}

	public Connection openConnectionWithPrepared() throws ClassNotFoundException, SQLException {
		Class.forName(cForName);
		con = DriverManager.getConnection(url, user, pass);
		return con;
	}

	public PreparedStatement openConnection(String sql) throws ClassNotFoundException, SQLException {
		Class.forName(cForName);
		con = DriverManager.getConnection(url, user, pass);
		pstmt = con.prepareStatement(sql);
		return pstmt;
	}

	public void setString(int index, String value) {
		try {
			pstmt.setString(index, value);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public CallableStatement openCallConnection(String call) throws ClassNotFoundException, SQLException {
		Class.forName(cForName);
		con = DriverManager.getConnection(url, user, pass);
		cstmt = con.prepareCall(call);
		return cstmt;
	}

	public void setCallString(int index, String value) {
		try {
			cstmt.setString(index, value);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeConnection() throws SQLException {
		con.close();
	}

	public void excuteData(String sql) throws SQLException {
		state.executeUpdate(sql);
	}

	public int excuteDataWithId(String sql) throws SQLException {
		int generatedId = 0;
		state.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
		ResultSet rs = state.getGeneratedKeys();
		if (rs.next())
			generatedId = rs.getInt(1);
		return generatedId;
	}

	public ResultSet fatchData(PreparedStatement pstmt) throws SQLException {
		return pstmt.executeQuery();
	}
	
	public ResultSet fatchCallData(CallableStatement cstmt) throws SQLException {
		boolean hasResults = cstmt.execute();
		ResultSet rs = null;
		if (hasResults) {
			rs = cstmt.getResultSet();
		}
		return rs;
	}

	public ResultSet fatchData(String sql) throws SQLException {
		return state.executeQuery(sql);
	}

	public static DatabaseConnectivity getInstance() {
		if (databaseConnectivity == null)
			databaseConnectivity = new DatabaseConnectivity();
		return databaseConnectivity;
	}
}
