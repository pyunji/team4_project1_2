package com.mycompany.webapp.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String tel;
	private String zipcode;
	private String address1;
	private String address2;
	private Date birth;
	private int gender;
	private String refId;
	private String loginType;
	private int tosNo;
	private int enabled;
	private String role;
}
