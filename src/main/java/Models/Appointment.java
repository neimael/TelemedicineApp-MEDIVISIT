package Models;

import java.sql.Date;

public class Appointment {
	
	private int id;
	private String date;
	private String time;
	private int doctorId;
	private int patientId;
	private String status;
	private double amount;
	private String link;
	private String doctorName;
	private String patientName;
	private String doctorSpec;
	


	

	public Appointment(int id, String date, String time, int doctorId, int patientId, String status, double amount,
			String link, String patientName, String doctorName, String doctorSpec) {
		super();
		this.id = id;
		this.date = date;
		this.time = time;
		this.doctorId = doctorId;
		this.patientId = patientId;
		this.status = status;
		this.amount = amount;
		this.link = link;
		this.doctorName = doctorName;
		this.patientName = patientName;
		this.doctorSpec = doctorSpec;
	}

	public Appointment(int id, String date, String time, int doctorId, int patientId, String status, double amount,
			String link) {
		super();
		this.id = id;
		this.date = date;
		this.time = time;
		this.doctorId = doctorId;
		this.patientId = patientId;
		this.status = status;
		this.amount = amount;
		this.link = link;
	}

	public Appointment(String date, String time, int doctorId, int patientId, String status, double amount,
			String link) {
		super();
		this.date = date;
		this.time = time;
		this.doctorId = doctorId;
		this.patientId = patientId;
		this.status = status;
		this.amount = amount;
		this.link = link;
	}
	
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}



	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getPatientName() {
		return patientName;
	}

	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}

	public String getDoctorSpec() {
		return doctorSpec;
	}

	public void setDoctorSpec(String doctorSpec) {
		this.doctorSpec = doctorSpec;
	}
	
	

}
