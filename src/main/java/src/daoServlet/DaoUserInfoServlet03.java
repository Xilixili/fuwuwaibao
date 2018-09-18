package daoServlet;

import java.io.IOException;
import java.lang.Exception;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import entity.Ability;
//import entity.Fangwenliang;
//import entity.Qihedu;
import entity.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import util.DBHelper;

//w.jsp
@WebServlet("/DaoUserInfoServlet03")
public class DaoUserInfoServlet03 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */

	public DaoUserInfoServlet03() {
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {

		System.out.println("Servlet03执行了一次init");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.print("servlet03执行了一次doGet");

		response.setContentType("text/html");

		JSONObject jsonObject = new JSONObject();
		JSONArray jsons = new JSONArray();

		Connection conn = null;

		PreparedStatement stmt1 = null;
		PreparedStatement stmt2 = null;
		PreparedStatement stmt3 = null;
		PreparedStatement stmt4 = null;
		PreparedStatement stmt5 = null;
		PreparedStatement stmt6 = null;
		PreparedStatement stmt7 = null;

		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		ResultSet rs5 = null;
		ResultSet rs6 = null;
		ResultSet rs7 = null;

		Integer i = 1;
		Integer I = 1;
		String sql1 = null;
		String sql2 = null;
		String sql3 = null;
		String sql4 = null;
		String sql5 = null;
		String sql6 = null;
		String sql7 = null;

		String user_name = request.getParameter("user_name");


		try {


			conn = DBHelper.getConnection();

			sql1 = "select * from user where user_name =?;";
			sql2 = "select * from sala1;";
			sql3 = "select * from sala2;";
			sql4 = "select * from yuce;";
			sql5 = "select * from ability;";
			// 这些语句中都不管 热点企业及访问量 的事

			stmt1 = conn.prepareStatement(sql1);
			stmt2 = conn.prepareStatement(sql2);
			stmt3 = conn.prepareStatement(sql3);
			stmt4 = conn.prepareStatement(sql4);
			stmt5 = conn.prepareStatement(sql5);

			stmt1.setString(1, user_name);

			rs1 = stmt1.executeQuery();
			rs2 = stmt2.executeQuery();
			rs3 = stmt3.executeQuery();
			rs4 = stmt4.executeQuery();
			rs5 = stmt5.executeQuery();

			User user = new User();
			Sala1 sl1 = new Sala1();
			Sala2 sl2 = new Sala2();
			Ability ab =new Ability();
			String[] nengliArr;


			while(rs5.next()){
				I++;
				ab.setAbility(rs5.getString("ability"));
				ab.setWeight(rs5.getString("weight"));
				jsonObject.put("ability"+I.toString(),ab);

			}
			while (rs1.next()) {

				user.setUser_name(rs1.getString("user_name"));
				user.setId(rs1.getInt("id"));
				user.setAge(rs1.getInt("age"));
				user.setSchool(rs1.getString("school"));
				user.setGender(rs1.getString("gender"));
				user.setZhuanye(rs1.getString("zhuanye"));
				user.setXueli(rs1.getString("xueli"));
				user.setDidian(rs1.getString("didian"));
				user.setJingyan(rs1.getString("jingyan"));
				user.setNengli(rs1.getString("nengli"));
				user.setZhiwei(rs1.getString("Zhiwei"));
				user.setGongzi(rs1.getString("gongzi"));
				nengliArr = user.getNengli().split(",|，");// 注意是utf-8的逗号！！！！
				user.setNengliArr(nengliArr);
				jsonObject.put("user", user);

			}

			while (rs2.next() && rs3.next()) {

				i++;

				sl1.setAbility(rs2.getString("ability"));
				sl1.setWeight(rs2.getString("weight"));
				System.out.println(sl1.getAbility()+sl1.getWeight());
				sl2.setAbility(rs3.getString("ability"));
				sl2.setWeight(rs3.getString("weight"));


				jsonObject.put("sala1" + i.toString(), sl1);
				jsonObject.put("sala2" + i.toString(), sl2);

			}

			Yuce yuce = new Yuce();
			while (rs4.next()) {
				yuce.setJob_name(rs4.getString("job_name"));
				yuce.setSala(rs4.getString("sala"));


				jsonObject.put("yuce", yuce);
			}

			//输出到前台
			jsons.add(jsonObject);
			response.getWriter().print(jsons);
			System.out.println("servlet03执行了一次print");

		}

		catch (Exception ex) {
			ex.printStackTrace();

		}

		finally {

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}
}
