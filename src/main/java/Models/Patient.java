package Models;

import java.util.ArrayList;

public class Patient {

	private int id;
	private String imagePath;
	private String firstName;
	private String lastName;
	private String email;
	private String sex;
	private String address;
	private String phoneNumber;
	private String birthDay;
	private String socialAccount;
	private ArrayList<Doctor> doctors = new ArrayList<Doctor>();

	
	
	public Patient(int id, String imagePath, String firstName, String lastName, String email, String sex,
			String address, String phoneNumber, String birthDay, String socialAccount) {
		super();
		this.id = id;
		this.imagePath = imagePath;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.sex = sex;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.birthDay = birthDay;
		this.socialAccount = socialAccount;
	}

	public Patient(String imagePath, String firstName, String lastName, String email, String sex, String address,
			String phoneNumber, String birthDay, String socialAccount) {
		super();
		this.imagePath = imagePath;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.sex = sex;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.birthDay = birthDay;
		this.socialAccount = socialAccount;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getSocialAccount() {
		return socialAccount;
	}

	public void setSocialAccount(String socialAccount) {
		this.socialAccount = socialAccount;
	}

	public ArrayList<Doctor> getDoctors() {
		return doctors;
	}

	public void setDoctors(ArrayList<Doctor> doctors) {
		this.doctors = doctors;
	}

}
