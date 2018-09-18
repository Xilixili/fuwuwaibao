package daoServlet;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Company;
import entity.Job;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import util.DBHelper;

//锟斤拷锟斤拷zuihou.jsp
@WebServlet("/DaoJobInfoServlet02")
public class DaoJobInfoServlet02 extends HttpServlet{

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public DaoJobInfoServlet02() {
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {

		System.out.println("Servlet02执行了init");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");

		JSONObject jsonObject = new JSONObject();
		JSONArray jsons = new JSONArray();

		Connection conn = null;

		PreparedStatement stmt1 = null;

		ResultSet rs1 = null;

		String sql1 = null;

		try {

			String rowkey = request.getParameter("rowkey");// 获得rowkey

			System.out.print(rowkey);

			conn = DBHelper.getConnection();

			sql1 = "select * from job where rowkey=?";

			System.out.print("select * from job wh1ere rowkey=" + rowkey);

			stmt1 = conn.prepareStatement(sql1);

			stmt1.setString(1, rowkey);

			rs1 = stmt1.executeQuery();

			while (rs1.next()) {
				Job job = new Job();

				String[] welArr;

				job.setRowkey(rs1.getString("rowkey"));
				job.setJob_name(rs1.getString("job_name"));
				job.setWeight(rs1.getString("weight"));
				job.setJob_link(rs1.getString("job_link"));
				job.setJob_num(rs1.getString("job_num"));
				job.setJob_fkl(rs1.getString("job_fkl"));
				job.setCom_desc(rs1.getString("com_desc"));
				job.setCom_wel(rs1.getString("com_wel"));
				job.setCom_name(rs1.getString("com_name"));
				job.setCom_link(rs1.getString("com_link"));
				job.setJob_sala(rs1.getString("job_sala"));
				job.setCom_adr(rs1.getString("com_adr"));
				job.setCreate_time(rs1.getString("create_time"));
				job.setCom_prop(rs1.getString("com_prop"));
				job.setCom_gm(rs1.getString("com_gm"));
				job.setSelf_jy(rs1.getString("self_jy"));
				job.setSelf_xl(rs1.getString("self_xl"));
				job.setJob_desc(rs1.getString("job_desc"));

				welArr = job.getCom_wel().split(",|，| ");// 注意是utf-8的逗号！！！！
				job.setWelArr(welArr);

				jsonObject.put("job", job);

				jsons.add(jsonObject);
			}

		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {

		}

		response.getWriter().print(jsons);

		System.out.println("servlet02执行了print");

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
