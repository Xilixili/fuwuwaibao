package daoServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.SpiderInfo;
import entity.User;
import util.Scalautil;

//����input_req.jsp
@WebServlet("/DaoScalaServlet05")
public class DaoScalaServlet05 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private String job_name;
	private String city;
	private String sala;
	/**
	 * Default constructor.
	 */

	public DaoScalaServlet05() {
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {

		System.out.println("Servlet05ִ����һ��init");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*SpiderInfo sp=new SpiderInfo();
		//Pytask task=new Pytask();
		
		sp.setWangzhan01(request.getParameter("s1"));
		sp.setWangzhan02(request.getParameter("s2"));
		sp.setWangzhan03(request.getParameter("s3"));
		sp.setPinlv(request.getParameter("s4"));
		sp.setSulv(request.getParameter("s5"));
		sp.setShendu(request.getParameter("s6"));
		sp.setGuangdu(request.getParameter("s7"));
		

		System.out.println(sp);*/
		
		
		User u=new User();
		
		
		
		
		job_name=request.getParameter("job_name");
		city=request.getParameter("city");
		sala=request.getParameter("sala");
		
		
		
		
		u.setZhiwei(job_name);
		u.setDidian(city);
		u.setGongzi(sala);
//		ReadHBase.PP.main(job_name,city,Integer.parseInt(sala));
		System.out.println(u);
		

		
		
		

		System.out.println("servlet05ִ����һ��print");

		/*response.getWriter().print("st");*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.setCharacterEncoding("utf-8");// ��������޷���ʾ��������
		
		doGet(request, response);
	}

}
