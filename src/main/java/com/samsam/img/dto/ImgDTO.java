package com.samsam.img.dto;

import jakarta.persistence.Column;
import lombok.Data;

@Data
public class ImgDTO {
	//@Column(name="img_number")
	private Integer imgNumber;
	//@Column(name="img_upload")
	private String imgUpload;
	//@Column(name="img_update")
	private String imgUpdate;
	//@Column(name="img_url")
	private String imgUrl;
}
