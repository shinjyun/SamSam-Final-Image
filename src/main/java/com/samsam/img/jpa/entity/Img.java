package com.samsam.img.jpa.entity;


import org.hibernate.annotations.DynamicUpdate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
//@DynamicUpdate
@Entity
public class Img {
	@Id
	@SequenceGenerator(name = "img_number_gen", sequenceName = "imgnumber_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "img_number_gen")
	@Column(name="img_number")
	private Integer imgNumber;
	
	@Column(name="img_upload")
	private String imgUpload; // java.sql.Date로 변경
	
	@Column(name="img_update")
	private String imgUpdate; // java.sql.Date로 변경
	
	@Column(name="img_url")
	private String imgUrl;
	
	
}
