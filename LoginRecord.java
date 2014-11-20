import java.sql.*;
import java.util.TreeMap;

public class LoginRecord
{
	public static void main(String[] args)
	{

		record = new TreeMap<String, Boolean>();

        Connection conn;
        try {

			Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/racqual", "root", "password");

            String sql = "SELECT username FROM userinfo";
            System.out.println(conn.prepareStatement(sql).toString());

        } catch (Exception ex) {
            ex.printStackTrace();
        }

	}
	
	private static TreeMap<String, Boolean> record;
}