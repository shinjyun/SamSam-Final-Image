package com.samsam.img.jpa.controller;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.samsam.img.jpa.entity.Img;
import com.samsam.img.service.ImgService;

import jakarta.inject.Inject;
import lombok.RequiredArgsConstructor;

// RESTful 웹 서비스를 정의하는 컨트롤러로 구성함
@RestController

@RequiredArgsConstructor
public class ImgRestController {
	private static final Logger logger = LogManager.getLogger(ImgRestController.class);
	
	@Inject
	private final ImgService imgService;
	
	// 모든 이미지 목록 조회
	@GetMapping("/imgselect")
	public List<Img> getAllImgs() {
		return imgService.findAllImgs();
	}
	
	// 특정 이미지의 상세 정보 조회
	@GetMapping("/imgselect/{img_number}")
	public ResponseEntity<Img> getImgById(@PathVariable("img_number") Integer img_number) {
		Img img = imgService.findImgById(img_number);
		logger.info("img", img);
		if (img != null) {
			return new ResponseEntity< >(img, HttpStatus.OK);
		} else {
			return new ResponseEntity< >(HttpStatus.NOT_FOUND);
		}
	}
	
	// 새로운 이미지를 추가하는 POST 요청 처리
	@PostMapping("/insert")
	public ResponseEntity<String> createImg(@RequestBody Img img) {
		if (imgService.existsByImg(img.getImgNumber())) {
			return new ResponseEntity< >("이미지가 이미 존재합니다.", HttpStatus.BAD_REQUEST);
		}
		Img img2 = imgService.saveImg(img);
		logger.info("img", img2);
		
		return new ResponseEntity< >("이미지가 성공적으로 저장되었습니다.", HttpStatus.CREATED);
	}
	
	// 기존 이미지 정보를 수정함
	@PutMapping("/update/{img_number}")
	public ResponseEntity<Img> updateImg(@PathVariable("img_number") Integer img_number, @RequestBody Img imgDetails) {
		Img img = imgService.findImgById(img_number);
		if (img != null) {
			img.setImgUpdate(imgDetails.getImgUpdate());
			img.setImgUpload(imgDetails.getImgUpload());
			img.setImgUrl(imgDetails.getImgUrl());
			
			Img img2 = imgService.saveImg(img);
			
			return new ResponseEntity< >(img2, HttpStatus.OK); 
		} else {
			return new ResponseEntity< > (HttpStatus.NOT_FOUND); 
		}
	}
	
	// 특정 이미지 정보를 삭제함
	@DeleteMapping("/delete/{img_number}")
	public ResponseEntity<HttpStatus> deleteImg(@PathVariable("img_number") Integer img_number) {
		imgService.deleteImgById(img_number);
		
		return new ResponseEntity< >(HttpStatus.NO_CONTENT);
	}
}
