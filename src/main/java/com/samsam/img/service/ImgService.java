package com.samsam.img.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jakarta.inject.Inject;
import org.springframework.transaction.annotation.Transactional;

import com.samsam.img.jpa.entity.Img;
import com.samsam.img.jpa.repository.ImgRepository;

@Service
public class ImgService {
	@Inject
	private ImgRepository imgRepository;
	
	@Transactional
	public Img saveImg(Img img) {
		return imgRepository.save(img);
	}
	
	@Transactional(readOnly = true)
	public List<Img> findAllImgs() {
		return imgRepository.findAll();
	}
	
	@Transactional(readOnly = true)
	public Img findImgById(Integer img_number) {
		return imgRepository.findById(img_number).orElse(null);
	}
	
	@Transactional
	public void deleteImgById(Integer img_number) {
		imgRepository.deleteById(img_number);
	}
	
	public boolean existsByImg(Integer img_number) {
		return imgRepository.existsById(img_number);
	}
}
