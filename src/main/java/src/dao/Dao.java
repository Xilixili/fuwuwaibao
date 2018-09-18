package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Job;
import util.DBHelper;

public class Dao {

	// ������е�ְλ��������

	public ArrayList<Job> SearchJobs(String job_name) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Job> list = new ArrayList<Job>(); // 集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from job"+ " where job_name like ? "; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + job_name + "%" );
			rs = stmt.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setRowkey(rs.getString("rowkey"));
				job.setJob_name(rs.getString("job_name"));
				job.setWeight(rs.getString("weight"));
				job.setJob_link(rs.getString("job_link"));
				job.setJob_num(rs.getString("job_num"));
				job.setJob_fkl(rs.getString("job_fkl"));
				job.setCom_desc(rs.getString("com_desc"));
				job.setCom_wel(rs.getString("com_wel"));
				job.setCom_name(rs.getString("com_name"));
				job.setCom_link(rs.getString("com_link"));
				job.setJob_sala(rs.getString("job_sala"));
				job.setCom_adr(rs.getString("com_adr"));
				job.setCreate_time(rs.getString("create_time"));
				job.setCom_prop(rs.getString("com_prop"));
				job.setCom_gm(rs.getString("com_gm"));
				job.setSelf_jy(rs.getString("self_jy"));
				job.setSelf_xl(rs.getString("self_xl"));
				job.setJob_desc(rs.getString("job_desc"));

				list.add(job);
				// 把一个职位需求数据加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}



	public ArrayList<Job> getAllJobs() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;//job匹配需要的信息
		ArrayList<Job> list = new ArrayList<Job>(); // ����
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from job;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setRowkey(rs.getString("rowkey"));
				job.setJob_name(rs.getString("job_name"));
				job.setWeight(rs.getString("weight"));
				job.setJob_link(rs.getString("job_link"));
				job.setJob_num(rs.getString("job_num"));
				job.setJob_fkl(rs.getString("job_fkl"));
				job.setCom_desc(rs.getString("com_desc"));
				job.setCom_wel(rs.getString("com_wel"));
				job.setCom_name(rs.getString("com_name"));
				job.setCom_link(rs.getString("com_link"));
				job.setJob_sala(rs.getString("job_sala"));
				job.setCom_adr(rs.getString("com_adr"));
				job.setCreate_time(rs.getString("create_time"));
				job.setCom_prop(rs.getString("com_prop"));
				job.setCom_gm(rs.getString("com_gm"));
				job.setSelf_jy(rs.getString("self_jy"));
				job.setSelf_xl(rs.getString("self_xl"));
				job.setJob_desc(rs.getString("job_desc"));

				list.add(job);
				// ��һ��ְλ�������ݼ��뼯��
			}
			return list; // ���ؼ��ϡ�
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// �ͷ�������
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
}
