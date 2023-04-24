package Models;

import java.io.InputStream;
import java.util.ArrayList;

import com.mysql.cj.jdbc.Blob;

public class Doctor {
	
	private int id;
	private String imagePath;
	private String firstName;
	private String lastName;
	private String email;
	private String sex;
	private String address;
	private String phoneNumber;
	private String birthDay;
	private String specialty;
	private String workingDays[];
	private String workingHours[];
	private ArrayList<Patient> patients = new ArrayList<Patient>();
	
	public Doctor() {
		
	}
	
	


	public Doctor(int id,String imagePath, String firstName, String lastName, String email, String sex, String address,
			String phoneNumber, String birthDay, String specialty, String[] workingDays, String[] workingHours) {
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
		this.specialty = specialty;
		this.workingDays = workingDays;
		this.workingHours = workingHours;
	}
	
	public Doctor(String imagePath, String firstName, String lastName, String email, String sex, String address,
			String phoneNumber, String birthDay, String specialty, String[] workingDays, String[] workingHours) {
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
		this.specialty = specialty;
		this.workingDays = workingDays;
		this.workingHours = workingHours;
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String[] getWorkingDays() {
		return workingDays;
	}

	public void setWorkingDays(String[] workingDays) {
		this.workingDays = workingDays;
	}

	public String[] getWorkingHours() {
		return workingHours;
	}

	public void setWorkingHours(String[] workingHours) {
		this.workingHours = workingHours;
	}




	public String getImagePath() {
		return imagePath;
	}




	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	

}
