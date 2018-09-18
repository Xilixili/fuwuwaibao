package entity;

import java.util.Arrays;

public class Job {

	private String rowkey;

	@Override
	public String toString() {
		return "Job{" +
				"rowkey='" + rowkey + '\'' +
				", job_name='" + job_name + '\'' +
				", weight='" + weight + '\'' +
				", job_link='" + job_link + '\'' +
				", job_num='" + job_num + '\'' +
				", job_fkl='" + job_fkl + '\'' +
				", com_desc='" + com_desc + '\'' +
				", com_wel='" + com_wel + '\'' +
				", com_name='" + com_name + '\'' +
				", com_link='" + com_link + '\'' +
				", job_sala='" + job_sala + '\'' +
				", com_adr='" + com_adr + '\'' +
				", create_time='" + create_time + '\'' +
				", com_prop='" + com_prop + '\'' +
				", com_gm='" + com_gm + '\'' +
				", self_jy='" + self_jy + '\'' +
				", self_xl='" + self_xl + '\'' +
				", job_desc='" + job_desc + '\'' +
				", welArr=" + Arrays.toString(welArr) +
				'}';
	}

	private String job_name;
	private String weight;
	private String job_link;


	private String job_num;
	private String job_fkl;
	private String com_desc;
	private String com_wel;
	private String com_name;
	private String com_link;
	private String job_sala;
	private String com_adr;
	private String create_time;
	private String com_prop;
	private String com_gm;
	private String self_jy;
	private String self_xl;
	private String job_desc;
	private String[] welArr;

	public String[] getWelArr() {
		return welArr;
	}

	public void setWelArr(String[] welArr) {
		this.welArr = welArr;
	}




	public String getRowkey() {
		return rowkey;
	}

	public void setRowkey(String rowkey) {
		this.rowkey = rowkey;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getJob_link() {
		return job_link;
	}

	public void setJob_link(String job_link) {
		this.job_link = job_link;
	}

	public String getJob_num() {
		return job_num;
	}

	public void setJob_num(String job_num) {
		this.job_num = job_num;
	}

	public String getJob_fkl() {
		return job_fkl;
	}

	public void setJob_fkl(String job_fkl) {
		this.job_fkl = job_fkl;
	}

	public String getCom_desc() {
		return com_desc;
	}

	public void setCom_desc(String com_desc) {
		this.com_desc = com_desc;
	}

	public String getCom_wel() {
		return com_wel;
	}

	public void setCom_wel(String com_wel) {
		this.com_wel = com_wel;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getCom_link() {
		return com_link;
	}

	public void setCom_link(String com_link) {
		this.com_link = com_link;
	}

	public String getJob_sala() {
		return job_sala;
	}

	public void setJob_sala(String job_sala) {
		this.job_sala = job_sala;
	}

	public String getCom_adr() {
		return com_adr;
	}

	public void setCom_adr(String com_adr) {
		this.com_adr = com_adr;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getCom_prop() {
		return com_prop;
	}

	public void setCom_prop(String com_prop) {
		this.com_prop = com_prop;
	}

	public String getCom_gm() {
		return com_gm;
	}

	public void setCom_gm(String com_gm) {
		this.com_gm = com_gm;
	}

	public String getSelf_jy() {
		return self_jy;
	}

	public void setSelf_jy(String self_jy) {
		this.self_jy = self_jy;
	}

	public String getSelf_xl() {
		return self_xl;
	}

	public void setSelf_xl(String self_xl) {
		this.self_xl = self_xl;
	}

	public String getJob_desc() {
		return job_desc;
	}

	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}


	

	


	
	
	
}
