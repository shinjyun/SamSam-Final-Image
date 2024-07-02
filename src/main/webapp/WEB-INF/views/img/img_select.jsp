<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>이미지 관리</h1>
				</div>
			</div>
		</div>
	</header>
	<section id="img" class="py-4 mb-4 bg-light"></section>
	<section id="details">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h5>이미지 목록</h5>
						</div>
						<div class="card-body">
							<table class="table table-hover">
								<thead class="thead-light">
									<tr class="text-center">
										<th>이미지 번호</th>
										<th>업로드 날짜</th>
										<th>수정 날짜</th>
										<th>미리보기</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${list.content}">
										<tr class="text-center">
											<td>${list.imgNumber}</td>
											<td>${list.imgUpload.substring(0, 10)}</td>
											<td>${list.imgUpdate.substring(0, 10)}</td>
											<td>
                                            <!-- 이미지를 미리보기하는 태그 -->
                                            <img src="/ImgView?img_url=${list.imgUrl}" style="max-width: 100px; max-height: 100px;">
	                                        </td>
	                                        <td>
	                                            <a href="./ImgSelectDetail?img_number=${list.imgNumber}" class="btn btn-outline-info"> 이미지 상세보기 </a>
	                                        </td>
                                        </tr>
									</c:forEach>
									<c:if test="${empty list}">
										<tr>
											<td colspan="4">등록된 이미지가 없습니다.</td>
										</tr>
									</c:if>
								</tbody>
							</table>
							
							
							<!-- 페이징 버튼 -->					
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
										<c:if test="${currentPage > 1}">
											<a class="page-link" href="/ImgSelect?page=${currentPage - 1}&size=${list.size}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
												<span class="sr-only">이전</span>
											</a>
										</c:if>
									</li>
					
									<c:forEach begin="1" end="${totalPages}" var="i">
										<li class="page-item ${currentPage == i ? 'active' : ''}">
											<a class="page-link" href="/ImgSelect?page=${i}&size=${list.size}">${i}</a>
										</li>
									</c:forEach>
					
									<li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
										<c:if test="${currentPage < totalPages}">
											<a class="page-link" href="/ImgSelect?page=${currentPage + 1}&size=${list.size}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
												<span class="sr-only">다음</span>
											</a>
										</c:if>
									</li>
								</ul>
							</nav>
							
							
							<div>
								<a href="./ImgInsert" class="btn btn-success btn-block"> 이미지 등록 </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
