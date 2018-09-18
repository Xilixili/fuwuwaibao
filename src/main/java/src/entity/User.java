package entity;

import java.util.Arrays;

public class User {
	private int id;
	private String user_name;
	private String password;
	private String real_name;
	private int age;
	private String school;
	private String mobile;
	private String email;
	private String gender;
	private String zhuanye;
	private String xueli;
	private String zhiwei;
	private String birthday;
	// �������¼ӵ�
	private String nengli;
	private String gongzi;
	private String didian;
	private String jingyan;
	private String[] nengliArr;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getZhuanye() {
		return zhuanye;
	}

	public void setZhuanye(String zhuanye) {
		this.zhuanye = zhuanye;
	}

	public String getXueli() {
		return xueli;
	}

	public void setXueli(String xueli) {
		this.xueli = xueli;
	}

	public String getZhiwei() {
		return zhiwei;
	}

	public void setZhiwei(String zhiwei) {
		this.zhiwei = zhiwei;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getNengli() {
		return nengli;
	}

	public void setNengli(String nengli) {
		this.nengli = nengli;
	}

	public String getGongzi() {
		return gongzi;
	}

	public void setGongzi(String gongzi) {
		this.gongzi = gongzi;
	}

	public String getDidian() {
		return didian;
	}

	public void setDidian(String didian) {
		this.didian = didian;
	}

	public String getJingyan() {
		return jingyan;
	}

	public void setJingyan(String jingyan) {
		this.jingyan = jingyan;
	}

	public String[] getNengliArr() {
		return nengliArr;
	}

	public void setNengliArr(String[] nengliArr) {
		this.nengliArr = nengliArr;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", user_name='" + user_name + '\'' +
				", password='" + password + '\'' +
				", real_name='" + real_name + '\'' +
				", age=" + age +
				", school='" + school + '\'' +
				", mobile='" + mobile + '\'' +
				", email='" + email + '\'' +
				", gender='" + gender + '\'' +
				", zhuanye='" + zhuanye + '\'' +
				", xueli='" + xueli + '\'' +
				", zhiwei='" + zhiwei + '\'' +
				", birthday='" + birthday + '\'' +
				", nengli='" + nengli + '\'' +
				", gongzi='" + gongzi + '\'' +
				", didian='" + didian + '\'' +
				", jingyan='" + jingyan + '\'' +
				", nengliArr=" + Arrays.toString(nengliArr) +
				'}';
	}
}
