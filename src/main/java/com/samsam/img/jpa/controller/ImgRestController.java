package com.samsam.img.jpa.controller;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.samsam.img.dto.ImgDTO;
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
	public List<Img> getImgs() {

		return imgService.findAllImgs();
	}

// 재홍이 코드
//	@GetMapping("/imgselect")
//	public ResponseEntity<?> list(@PageableDefault(page = 0, size = 5, sort = "imgNumber", direction = Sort.Direction.DESC) Pageable pageable, @RequestParam(name = "page", defaultValue = "1") int page) {
//	    return ResponseEntity.ok(list(pageable, page));
//	}
	
//	@GetMapping("/select")
//	   public ResponseEntity<?> list(@PageableDefault(page = 0, size = 5, sort = "csNumber", direction = Sort.Direction.DESC) Pageable pageable, @RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "searchContent", required = false) String searchContent, @RequestParam(name = "searchKeyword", required = false) String searchKeyword) {
//
//	      Pageable adjustedPageable = PageRequest.of(page - 1, pageable.getPageSize(), pageable.getSort());
//
//	      Page<CI> list;
//
//	      if (StringUtils.isEmpty(searchKeyword) || StringUtils.isEmpty(searchContent)) {
//	         list = csService.findAllCis(adjustedPageable);
//	      } else if ("title".equals(searchContent)) {
//	         list = csService.CISearchList(searchKeyword, adjustedPageable);
//	      } else if ("content".equals(searchContent)) {
//	         list = csService.CISearchContent(searchKeyword, adjustedPageable);
//	      } else {
//	         list = csService.findAllCis(adjustedPageable);
//	      }
//
//	      return ResponseEntity.ok(list);
//	   }
	
	// 특정 이미지의 상세 정보 조회
	@GetMapping("/imgselectdetail/{img_number}")
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
	@PostMapping("/imginsert")
	public ResponseEntity<String> createImg(@RequestBody Img img) {
		if (imgService.existsByImg(img.getImgNumber())) {
			return new ResponseEntity< >("이미지가 이미 존재합니다.", HttpStatus.BAD_REQUEST);
		}
		Img img2 = imgService.saveImg(img);
		logger.info("img", img2);
		
		return new ResponseEntity< >("이미지가 성공적으로 저장되었습니다.", HttpStatus.CREATED);
	}
	
	// 기존 이미지 정보를 수정함
//	@PutMapping("/imgupdate/{img_number}")
//	public ResponseEntity<Img> updateImg(@PathVariable("img_number") Integer img_number, @RequestBody Img imgDetails) {
//		Img img = imgService.findImgById(img_number);
//		if (img != null) {
//			img.setImgUpload(imgDetails.getImgUpload());
//			img.setImgUpdate(imgDetails.getImgUpdate());
//			img.setImgUrl(imgDetails.getImgUrl());
//			
//			Img img2 = imgService.saveImg(img);
//			
//			return new ResponseEntity< >(img2, HttpStatus.OK);
//		} else {
//			return new ResponseEntity< >(HttpStatus.NOT_FOUND);
//		}
//	}
	
	@PutMapping("/imgupdate")
	public ResponseEntity<Img> updateImg(@RequestBody Img imgDetails) {
	    Img img = imgService.findImgById(imgDetails.getImgNumber());
	    if (img != null) {
	        img.setImgUpload(imgDetails.getImgUpload());
	        img.setImgUpdate(imgDetails.getImgUpdate());
	        img.setImgUrl(imgDetails.getImgUrl());
	        
	        Img updatedImg = imgService.saveImg(img);
	        
	        return new ResponseEntity<>(updatedImg, HttpStatus.OK);
	    } else {
	        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	    }
	}
	
	// 특정 이미지 정보를 삭제함
	@DeleteMapping("/imgdelete/{img_number}")
	public ResponseEntity<HttpStatus> deleteImg(@PathVariable("img_number") Integer img_number) {
		imgService.deleteImgById(img_number);
		
		return new ResponseEntity< >(HttpStatus.NO_CONTENT);
	}
}
