package entity;

public class Company {

	private int id;
	private String company_name;
	private String href;
	private int label_01;
	private int label_02;
	private int label_03;
	private int label_04;
	private int label_05;
	private int label_06;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public int getLabel_01() {
		return label_01;
	}

	public void setLabel_01(int label_01) {
		this.label_01 = label_01;
	}

	public int getLabel_02() {
		return label_02;
	}

	public void setLabel_02(int label_02) {
		this.label_02 = label_02;
	}

	public int getLabel_03() {
		return label_03;
	}

	public void setLabel_03(int label_03) {
		this.label_03 = label_03;
	}

	public int getLabel_04() {
		return label_04;
	}

	public void setLabel_04(int label_04) {
		this.label_04 = label_04;
	}

	public int getLabel_05() {
		return label_05;
	}

	public void setLabel_05(int label_05) {
		this.label_05 = label_05;
	}

	public int getLabel_06() {
		return label_06;
	}

	public void setLabel_06(int label_06) {
		this.label_06 = label_06;
	}

	@Override
	public String toString() {
		return "Company [id=" + id + ", company_name=" + company_name + ", href=" + href + ", label_01=" + label_01
				+ ", label_02=" + label_02 + ", label_03=" + label_03 + ", label_04=" + label_04 + ", label_05="
				+ label_05 + ", label_06=" + label_06 + "]";
	}

}
