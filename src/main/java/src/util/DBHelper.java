package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.Job;

public class DBHelper {

	private static final String driver = "com.mysql.jdbc.Driver"; // ���ݿ�����
	// �������ݿ��URL��ַ
	private static final String url = "jdbc:mysql://127.0.0.1:3306/bigdata";
	private static final String username = "root";// ���ݿ���û���
	private static final String password = "root";// ���ݿ������

	private static Connection conn = null;

	// ��̬����鸺���������
	static {
		try {
			Class.forName(driver).newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// ����ģʽ�������ݿ����Ӷ���
	public static Connection getConnection() throws Exception {
		if (conn == null) {
			conn = DriverManager.getConnection(url, username, password);
			return conn;
		}
		return conn;
	}

	public static void main(String[] args) {

		try {
			Connection conn = DBHelper.getConnection();
			if (conn != null) {
				System.out.println("���ݿ�����������");

				Connection conn1 = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				String sql = "select * from job;";

				conn1 = DBHelper.getConnection();
				stmt = conn1.prepareStatement(sql);
				rs = stmt.executeQuery();

				while (rs.next()) {
					Job job = new Job();

					job.setRowkey(rs.getString("rowkey"));
					job.setJob_name(rs.getString("job_name"));

					System.out.println(job);
				}

			} else {
				System.out.println("���ݿ������쳣��");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
