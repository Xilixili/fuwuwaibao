package daoServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.SpiderInfo;

//????Administrator_req.jsp
@WebServlet("/DaoSpiderInfoServlet04")
public class DaoSpiderInfoServlet04 extends HttpServlet{

	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */

	public DaoSpiderInfoServlet04() {
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {

		System.out.println("Servlet04????????init");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SpiderInfo sp=new SpiderInfo();
		
		sp.setWangzhan01(request.getParameter("s1"));
		sp.setWangzhan02(request.getParameter("s2"));
		sp.setWangzhan03(request.getParameter("s3"));
		sp.setPinlv(request.getParameter("s4"));
		sp.setSulv(request.getParameter("s5"));
		sp.setShendu(request.getParameter("s6"));
		sp.setGuangdu(request.getParameter("s7"));
		

		System.out.println(sp);
		
		/*System.out.println(request.getParameter("s1"));
		System.out.println(request.getParameter("s2"));
		System.out.println(request.getParameter("s3"));
		System.out.println(request.getParameter("s4"));
		System.out.println(request.getParameter("s5"));
		System.out.println(request.getParameter("s6"));
		System.out.println(request.getParameter("s7"));*/
		
		
		System.out.println("servlet04????????print");

		response.getWriter().print("st");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.setCharacterEncoding("utf-8");// ?????????????????????
		
		doGet(request, response);
	}
}
