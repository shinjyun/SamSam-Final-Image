import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Modal, Button, Form, Table } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';

// Img 컴포넌트를 정의함
const Img = () => {
	const [departments, setDepartments] = useState([]); // 이미지 목록을 저장할 상태 상수를 선언
	const [showModal, setShowModal] = useState(false); // 모달 창 표시 여부를 저장할 상태 상수를 선언
	const [modalType, setModalType] = useState(''); // 모달 창의 insert, update, delete, select를 저장할 상태 상수를 선언
	const [formData, setFormData] = useState({ img_number: '', img_upload: '', img_update: '', img_url: '' }); // 폼데이터를 저장할 상태 상수를 선언

	// 컴포넌트가 처음 마운트될 때 이미지 목록을 로드하는 useEffect 훅을 선언함
	useEffect(() => {
		loadDepartments();
	}, []);

	// Get 요청으로 이미지 목록을 로드하는 비동기 함수를 선언함
	const loadDepartments = async () => {
		try {
			const response = await axios.get('/imgselect'); // 이미지 목록을 가져오는 API 호출
			setDepartments(response.data); // 이미지 목록을 상태에 저장함
		} catch (error) {
			alert('이미지 목록에 데이터가 없습니다.'); // 오류 발생 시 경고창 표시함
			console.error('서버 오류!!! : ', error);
		}
	};

	// 모달 창을 표시하는 함수를 선언함
	const handleShowModal = (type) => {
		setModalType(type); // 모달 타입을 설정함
		setShowModal(true); // 모달 창을 표시함
	};

	// 모달 창을 닫는 함수를 선언함
	const handleCloseModal = () => {
		setShowModal(false); // 모달 창을 숨긴다.
		setFormData({ img_number: '', img_upload: '', img_update: '', img_url: '' }); // 폼 데이터를 초기화함
	};

	// 폼 입력 값을 상태에 저장하는 함수를 선언함
	const handleChange = (e) => {
		setFormData({ ...formData, [e.target.name]: e.target.value });
	};

	// 폼 제출 시 호출되는 함수를 선언함
	const handleSubmit = async () => {
		const { img_number, img_upload, img_update, img_url } = formData; // 폼 데이터 구조 분해 할당을 함

		// 이미지 번호 유효성 검사를 설정함
		if (!img_number || isNaN(img_number) || img_number.length > 2) {
			alert('이미지 번호를 올바르게 입력하세요.');
			return;
		}
		try {
			// POST 요청으로 이미지 등록을 로드하는 비동기 함수를 선언함
			if (modalType === 'imginsert') {
				await axios.post('/imginsert', { imgNumber: img_number, imgUpload: img_upload, imgUpdate: img_update, imgUrl: img_url });
				alert('이미지를 등록하였습니다.');

				// PUT 요청으로 이미지 수정을 로드하는 비동기 함수를 선언함
			} else if (modalType === 'imgupdate') {
				await axios.put('/imgupdate', { imgNumber: img_number, imgUpload: img_upload, imgUpdate: img_update, imgUrl: img_url });
				alert('이미지를 수정하였습니다.');

				// DELETE 요청으로 이미지 삭제를 로드하는 비동기 함수를 선언함
			} else if (modalType === 'imgdelete') {
				await axios.delete(`/imgdelete/${img_number}`);
				alert('이미지를 삭제하였습니다.');

				// GET 요청으로 이미지 상세 조회를 로드하는 비동기 함수를 선언함
			} else if (modalType === 'imgselectdetail') {
				const response = await axios.get(`/imgselectdetail/${img_number}`);
				setDepartments([response.data]); // 조회된 이미지 정보를 상태에 저장함
				alert('이미지 정보를 조회하였습니다.');
			}
			handleCloseModal(); // 모달 창을 닫음
			loadDepartments(); // 이미지 목록 새로고침

		} catch (error) {
			alert('작업을 완료할 수 없습니다.'); // 오류 발생 시 경고창 표시
			console.error('!!!!에러!!!! : ', error); // 에러 출력 //
		}
	};

	return (
		<div className='container p-3 my-3 border'>
			<div className='btn-group-custom'>
				<Button variant='outline-secondary' onClick={() => handleShowModal('imgselectdetail')}>이미지 상세보기</Button>
				<Button variant='outline-secondary' onClick={() => handleShowModal('imginsert')}>이미지 등록</Button>
				<Button variant='outline-secondary' onClick={() => handleShowModal('imgupdate')}>이미지 수정</Button>
				<Button variant='outline-secondary' onClick={() => handleShowModal('imgdelete')}>이미지 삭제</Button>
			</div>
			<div className='custom-table-wrapper'>
				<Table className='custom-table'>
					<thead>
						<tr>
							<th>이미지 번호</th>
							<th>업로드 날짜</th>
							<th>수정 날짜</th>
							<th>미리보기</th>
						</tr>
					</thead>
					<tbody>
						{departments.map(img => (
							<tr key={img.imgNumber}>
								<td>{img.imgNumber}</td>
								<td>{img.imgUpload.substring(0, 10)}</td>
								<td>{img.imgUpdate.substring(0, 10)}</td>
								<td>{img.imgUrl}</td>
							</tr>
						))}
					</tbody>
				</Table>
			</div>
			<Modal show={showModal} onHide={handleCloseModal}>
				<Modal.Header closeButton>
					<Modal.Title>이미지 {modalType === 'imginsert' ? '등록' : modalType === 'imgupdate' ? '수정' : modalType ===
						'imgdelete' ? '삭제' : '상세 보기'}</Modal.Title>
				</Modal.Header>
				<Modal.Body>
					<Form>
						<Form.Group>
							<Form.Label>이미지 번호</Form.Label>
							<Form.Control type="text" name="img_number" value={formData.img_number} onChange={handleChange} />
						</Form.Group>
						{(modalType === 'imginsert' || modalType === 'imgupdate') && (< >
							<Form.Group>
								<Form.Label>업로드 날짜</Form.Label>
								<Form.Control type="date" name="img_upload" value={formData.img_upload} onChange={handleChange} />
							</Form.Group>
							<Form.Group>
								<Form.Label>수정 날짜</Form.Label>
								<Form.Control type="date" name="img_update" value={formData.img_update} onChange={handleChange} />
							</Form.Group>
							<Form.Group>
								<Form.Label>미리보기</Form.Label>
								<Form.Control type="text" name="img_url" value={formData.img_url} onChange={handleChange} />
							</Form.Group>
						</>)}
						<Button variant="outline-info" onClick={handleSubmit}>입력</Button>
					</Form>
				</Modal.Body>
			</Modal>

		</div>
	);
}
export default Img;