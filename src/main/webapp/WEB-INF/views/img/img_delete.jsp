<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이미지 삭제</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/dept_validity.js" type="text/javascript"></script>

<script type="text/javascript">
</script>

</head>
<body>
	<header id="main-header" class="py-2 btn-dark text-white">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>이미지 삭제</h1>
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
							<h5>이미지 삭제</h5>
						</div>
						<div class="card-body">
							<form method="post" id="sign_img" action="/ImgDelete">
								<fieldset>
									<div class="form-group row">
										<label for="imgNumber" class="ml-sm-3 col-form-label"> 이미지 번호 </label>
										<div class="ml-sm-3">
											<input type="text" name="imgNumber" id="imgNumber" class="form-control form-control-sm bg-white" value="${imgDTO.imgNumber}" readonly>
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-secondary" >삭제</button>
										<button type="reset" class="btn btn-secondary">취소</button>
									</div>
								</fieldset>
							</form>
							<div class="row">
								<div class="col-md-4">
									<a href="./ImgSelect" class="btn btn-primary btn-block"> 이미지 목록 </a>
								</div>
								<div class="col-md-4">
									<a href="./ImgInsert" class="btn btn-success btn-block"> 이미지 등록 </a>
								</div>
								<div class="col-md-4">
									<a href="./ImgUpdate?img_number=${imgDTO.imgNumber}" class="btn btn-warning btn-block"> 이미지 변경 </a>
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
