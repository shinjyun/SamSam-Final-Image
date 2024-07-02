<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세 이미지 정보</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>상세 이미지 정보</h1>
				</div>
			</div>
		</div>
	</header>
	<section id="actions" class="py-4 mb-4 bg-light"></section>
	<section id="details">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>이미지 상세 보기</h5>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>이미지 번호</th>
										<th>이미지 업로드 날짜</th>
										<th>이미지 수정 날짜</th>
										<th>미리보기</th>
									</tr>
								</thead>
								<tbody>
									<tr class="text-center">
										<td>${imgDTO.imgNumber}</td>
										<td>${imgDTO.imgUpload.substring(0, 10)}</td>
										<td>${imgDTO.imgUpdate.substring(0, 10)}</td>
										<!-- 이미지 미리보기를 표시할 img 태그 -->
                                        <td><img src="/ImgView?img_url=${imgDTO.imgUrl}" style="max-width: 100px; max-height: 100px;"></td>
									</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-4">
									<a href="./ImgSelect" class="btn btn-primary btn-block"> 이미지 목록 </a>
								</div>
								<div class="col-md-4">
									<a href="./ImgUpdate?img_number=${imgDTO.imgNumber}" class="btn btn-warning btn-block"> 이미지 수정 </a>
								</div>
								<div class="col-md-4">
									<a href="./ImgDelete?img_number=${imgDTO.imgNumber}" class="btn btn-danger btn-block"> 이미지 삭제 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>