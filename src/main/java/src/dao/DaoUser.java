package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import entity.User;
import util.DBHelper;

public class DaoUser {

	// 数据写入数据库
	public void addUser(User user) throws SQLException {

		try {
			Connection conn = DBHelper.getConnection();
			String sql = "" + " INSERT INTO user"
					+ "(user_name,password,real_name,age,school,mobile,email,gender,zhuanye,xueli,zhiwei,birthday)"
					+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, user.getUser_name());
			ptmt.setString(2, user.getPassword());
			ptmt.setString(3, user.getReal_name());
			ptmt.setInt(4, user.getAge());
			ptmt.setString(5, user.getSchool());
			ptmt.setString(6, user.getMobile());
			ptmt.setString(7, user.getEmail());
			ptmt.setString(8, user.getGender());
			ptmt.setString(9, user.getZhuanye());
			ptmt.setString(10, user.getXueli());
			ptmt.setString(11, user.getZhiwei());
			ptmt.setString(12, user.getBirthday());

			ptmt.execute();
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	// ��
	public void updateUser(User user) throws SQLException {
		try {
			Connection conn = DBHelper.getConnection();
			String sql = "" + " UPDATE user SET"
					+ " real_name=?,age=?,school=?,mobile=?,email=?,gender=?,zhuanye=?,xueli=?,zhiwei=?,nengli=?,gongzi=?,didian=?,jingyan=?,birthday=?"
					+ " WHERE user_name=?";

			PreparedStatement ptmt = conn.prepareStatement(sql);// ����Ԥ����

			ptmt.setString(1, user.getReal_name());
			ptmt.setInt(2, user.getAge());
			ptmt.setString(3, user.getSchool());
			ptmt.setString(4, user.getMobile());
			ptmt.setString(5, user.getEmail());
			ptmt.setString(6, user.getGender());
			ptmt.setString(7, user.getZhuanye());
			ptmt.setString(8, user.getXueli());
			ptmt.setString(9, user.getZhiwei());
			
			ptmt.setString(10, user.getNengli());
			ptmt.setString(11, user.getGongzi());
			ptmt.setString(12, user.getDidian());
			ptmt.setString(13, user.getJingyan());
			
			ptmt.setString(14, user.getBirthday());
			ptmt.setString(15, user.getUser_name());

			ptmt.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ɾ
	public void deleteUser(int del_id) throws SQLException {
		try {
			Connection conn = DBHelper.getConnection();
			String sql = "" + " DELETE FROM user" + " WHERE id=?";

			PreparedStatement ptmt = conn.prepareStatement(sql);// ����Ԥ����

			ptmt.setInt(1, del_id);

			ptmt.execute();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// ������ѯ
	public User get(int query_id) throws SQLException {
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String sql = null;
		User result = null;

		try {
			conn = DBHelper.getConnection();
			sql = "" + " SELECT * FROM user" + " WHERE id=?";

			ptmt = conn.prepareStatement(sql);// ����Ԥ����

			ptmt.setInt(1, query_id);

			rs = ptmt.executeQuery();

			if (rs.next()) {
				result = new User();
				result.setId(rs.getInt("id"));
				result.setUser_name(rs.getString("user_name"));
				result.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (result != null) {
			return result;
		} else {
			return null;
		}
	}

	// ȫ����ѯ
	public List<User> query() throws SQLException {

		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		User result = null;
		List<User> resultAll = new ArrayList<User>();

		try {
			conn = DBHelper.getConnection();

			StringBuilder sb = new StringBuilder();
			sb.append(" select * from user");

			ptmt = conn.prepareStatement(sb.toString());

			rs = ptmt.executeQuery();

			while (rs.next()) {

				result = new User();
				result.setId(rs.getInt("id"));
				result.setUser_name(rs.getString("user_name"));
				result.setPassword(rs.getString("password"));

				result.setAge(rs.getInt("age"));
				result.setMobile(rs.getString("mobile"));
				result.setEmail(rs.getString("email"));

				resultAll.add(result);
			}

			System.out.println(sb.toString());
			System.out.println(ptmt.toString());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultAll;
	}

	// ���û�����ѯ
	public List<User> query(String name) throws SQLException {

		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		User result = null;
		List<User> resultAll = new ArrayList<User>();

		try {
			conn = DBHelper.getConnection();

			StringBuilder sb = new StringBuilder();
			sb.append(" SELECT * FROM user");

			sb.append(" WHERE user_name = ?");

			ptmt = conn.prepareStatement(sb.toString());

			ptmt.setString(1, name);

			rs = ptmt.executeQuery();

			while (rs.next()) {

				result = new User();
				result.setId(rs.getInt("id"));
				result.setUser_name(rs.getString("user_name"));
				result.setPassword(rs.getString("password"));
				result.setReal_name(rs.getString("real_name"));

				result.setAge(rs.getInt("age"));
				result.setMobile(rs.getString("mobile"));
				result.setEmail(rs.getString("email"));

				resultAll.add(result);
			}

			/*
			 * System.out.println(sb.toString()); System.out.println(ptmt.toString());
			 */

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultAll;

	}

	// ��ѯ����������
	public List<User> query(List<Map<String, Object>> params) throws SQLException {

		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;

		User result = null;
		List<User> resultAll = new ArrayList<User>();

		StringBuilder sb = null;

		try {
			conn = DBHelper.getConnection();

			sb = new StringBuilder();
			sb.append(" SELECT * FROM user WHERE 1=1");

			if (params != null && params.size() > 0) {
				for (int i = 0; i < params.size(); i++) {
					Map<String, Object> map = params.get(i);
					sb.append(" " + " AND " + " " + map.get("name") + " " + map.get("rela") + " " + map.get("value")
							+ " ");
				}
			}

			ptmt = conn.prepareStatement(sb.toString());

			rs = ptmt.executeQuery();

			resultAll = new ArrayList<User>();

			result = null;
			while (rs.next()) {

				result = new User();
				result.setId(rs.getInt("id"));
				result.setUser_name(rs.getString("user_name"));
				result.setPassword(rs.getString("password"));

				result.setAge(rs.getInt("age"));
				result.setMobile(rs.getString("mobile"));
				result.setEmail(rs.getString("email"));

				resultAll.add(result);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(sb.toString());
		System.out.println(ptmt.toString());
		return resultAll;
	}
}
