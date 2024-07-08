<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 관리</title>
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<style type="text/css">
.btn-group-custom {
	display: flex;
	justify-content: center, margin-bottom: 20px;
	flex-wrap: wrap;
}

.btn-group-custom .btn {
	margin: 5px;
	min-width: 120px;
}

.custom-table-wrapper {
	overflow-x: auto;
	width: 100%;
}

table.custom-table th, table.custom-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
	vertical-align: middle;
}

table.custom-table th {
	background-color: #f2f2f2;
	font-weight: bold;
}

.modal-header {
	background-color: #f8f9fa;
}

.modal-body {
	padding: 20px;
}

.form-group label {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container p-3 my-3 border">
		<div class="btn-group-custom">
			<button id="selectAllBtn" class="btn btn-outline-secondary">이미지 목록</button>
			<button id="selectBtn" class="btn btn-outline-secondary">이미지 상세 보기</button>
			<button id="insertBtn" class="btn btn-outline-secondary">이미지 등록</button>
			<button id="updateBtn" class="btn btn-outline-secondary">이미지 수정</button>
			<button id="deleteBtn" class="btn btn-outline-secondary">이미지 삭제</button>
		</div>
		<div id="result" class="custom-table-wrapper">
			<table id="resultTable" class="custom-table">
				<thead>
					<tr>
						<th>이미지 번호</th>
						<th>이미지 업로드 날짜</th>
						<th>이미지 수정 날짜</th>
						<th>미리보기</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	<!--이미지 상세 모달을 설정한다.-->
	<div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="selectModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="selectModalLabel">이미지 상세 보기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="selectForm">
						<div class="form-group">
							<label for="selectImgNumber">이미지 번호</label> <input type="text" class="form-control" id="selectImgNumber" name="img_number">
						</div>
						<button type="button" class="btn btn-outline-info" id="submitSelectForm">입력</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--이미지 등록 모달을 설정한다.-->
	<div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="insertModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="insertModalLabel">이미지 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="insertForm">
						<div class="form-group">
							<label for="insertImgNumber">이미지 번호</label> <input type="text" class="form-control" id="insertImgNumber" name="img_number">
						</div>
						<div class="form-group">
							<label for="insertImgUpload">업로드 날짜</label> <input type="text" class="form-control" id="insertImgUpload" name="img_upload">
						</div>
						<div class="form-group">
							<label for="insertImgUpdate">수정 날짜</label> <input type="text" class="form-control" id="insertImgUpdate" name="img_update">
						</div>
						<div class="form-group">
							<label for="insertImgUrl">미리보기</label> <input type="text" class="form-control" id="insertImgUrl" name="img_url">
						</div>
						<button type="button" class="btn btn-outline-info" id="submitInsertForm">등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--이미지 수정 모달을 설정한다.-->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="updateModalLabel">이미지 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="updateForm">
						<div class="form-group">
							<label for="updateImgNumber">이미지 번호</label> <input type="text" class="form-control" id="updateImgNumber" name="img_number">
						</div>
						<div class="form-group">
							<label for="updateImgUpload">업로드 날짜</label> <input type="date" class="form-control" id="updateImgUpload" name="img_upload">
						</div>
						<div class="form-group">
							<label for="updateImgUpdate">수정 날짜</label> <input type="date" class="form-control" id="updateImgUpdate" name="img_update">
						</div>
						<div class="form-group">
							<label for="updateImgUrl">미리보기</label> <input type="text" class="form-control" id="updateImgUrl" name="img_url">
						</div>
						<button type="button" class="btn btn-outline-info" id="submitUpdateForm">수정</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--이미지 삭제 모달을 설정한다.-->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteModalLabel">이미지 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="deleteForm">
						<div class="form-group">
							<label for="deleteImgNumber">이미지 번호</label> <input type="text" class="form-control" id="deleteImgNumber" name="img_number">
						</div>
						<button type="button" class="btn btn-outline-info" id="submitDeleteForm">삭제</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
//콜백 함수로 문서가 완전히 로드되고 DOM이 준비된 후에 실행된다. 
$(function( ) {
//전체 이미지 목록을 로드한다. 
function loadData( ) {
$.ajax({
//모든 이미지 정보를 가져오는 API 엔드포인트다. 
url: './select', method: 'GET', success: function(data) {
console.log("json 데이터 확인 : ", data);
//데이터를 테이블에 표시한다. 
displayTable(data);
},
error: function(error) {
alert('이미지 목록에 데이터가 없습니다.');
}
});
}
//이미지 목록 버튼 클릭 시 이미지 목록을 로드한다. 
$('#selectBtn').click(function( ) {
loadData( );
});
//이미지 상세 보기 버튼 클릭 시 모달 창에 표시한다. 
$('#selectDetailBtn').click(function( ) {
$('#selectDetailModal').modal('show');
});
//이미지 입력 버튼 클릭 시 모달 창에 표시한다. 
$('#insertBtn').click(function( ) {
$('#insertModal').modal('show');
});
//이미지 수정 버튼 클릭 시 모달 창에 표시한다. 
$('#updateBtn').click(function( ) {
$('#updateModal').modal('show');
});
//이미지 삭제 버튼 클릭 시 모달 창에 표시한다. 
$('#deleteBtn').click(function( ) {
$('#deleteModal').modal('show');
});
//이미지 번호를 입력받아 해당 이미지의 정보를 조회한다. 
$('#submitSelectForm').click(function( ) {
var img_number = $('#selectImgNumber').val( );
// 유효성을 검사한다. 
if(!img_number || isNaN(img_number) || img_number.length > 2) {
alert("이미지 번호를 올바르게 입력하세요.");
return;
}
$.ajax({
//특정 이미지 정보를 가져오는 API 엔드포인트다. 
url: './selectDetail/' + img_number,
method: 'GET', success: function(data) {
//조회된 이미지 정보를 테이블에 표시한다. 
displayTable([data]);
$('#selectDetailModal').modal('hide');
},
error: function(error) {
alert('이미지 번호가 존재하지 않습니다.' );
}
});
});
//새로운 이미지 정보를 등록한다. 
$('#submitInsertForm').click(function( ) {
var img_number = $('#insertImgNumber').val( );
var img_upload = $('#insertImgUpload').val( );
var img_update = $('#insertImgUpdate').val( );
var img_url = $('#insertImgUrl').val( );
// 유효성을 검사한다. 
if(!img_number || isNaN(img_number) || img_number.length > 2) {
alert("이미지 번호를 올바르게 입력하세요.");
return;
}
if(!img_upload || img_upload.length < 2 || img_upload.length > 14) {
alert("업로드 날짜 올바르게 입력하세요.");
return;
}
if(!img_update || img_update.length < 2 || img_update.length > 14) {
alert("수정 날짜를 올바르게 입력하세요.");
return;
}
if(!img_url || img_url.length < 2 || img_url.length > 14) {
alert("미리보기를 올바르게 입력하세요.");
return;
}
$.ajax({
//이미지 정보를 등록하는 API 엔드포인트다. 
url: './insert', method: 'POST', contentType: 'application/json',
//객체를 JSON 문자열로 변환한다. 
data: JSON.stringify({
img_number: img_number,
img_upload: img_upload,
img_update: img_update,
img_url: img_url
}),
success: function(data) {
alert("이미지를 등록하였습니다.");
//모달 창을 닫는다. 
$('#insertModal').modal('hide');
//업데이트된 이미지 목록을 로드한다. 
loadData( );
},
error: function(error) {
alert('입력할 이미지 번호가 존재합니다.');
}
});
});
//기존 이미지 정보를 수정한다. 
$('#submitUpdateForm').click(function( ) {
var img_number = $('#updateImgNumber').val( );
var img_upload = $('#updateImgUpload').val( );
var img_update = $('#updateImgUpdate').val( );
var img_url = $('#updateImgUrl').val( );
// 유효성을 검사한다. 
if(!img_number || isNaN(img_number) || img_number.length > 2) {
alert("이미지 번호를 올바르게 입력하세요.");
return;
}
if(!img_upload || img_upload.length < 2 || img_upload.length > 14) {
alert("업로드 날짜를 올바르게 입력하세요.");
return;
}
if(!img_update || img_update.length < 2 || img_update.length > 14) {
alert("수정 날짜를 올바르게 입력하세요.");
return;
}
if(!img_url || img_url.length < 2 || img_url.length > 14) {
alert("미리보기 올바르게 입력하세요.");
return;
}
$.ajax({
//이미지 정보를 수정하는 API 엔드포인트다. 
url: './update', method: 'PUT', contentType: 'application/json', //객체를 JSON 문자열로 변환한다. 
data: JSON.stringify({
	img_number: img_number,
	img_upload: img_upload,
	img_update: img_update,
	img_url: img_url
}),
success: function(data) {
alert("이미지를 수정하였습니다.");
//모달 창을 닫는다. 
$('#updateModal').modal('hide');
//업데이트된 이미지 목록을 로드한다. 
loadData( );
},
error: function(error) {
alert('수정할 이미지 번호가 존재하지 않습니다.');
}
});
});
//특정 이미지 번호의 이미지 정보를 삭제한다. 
$('#submitDeleteForm').click(function( ) {
var img_number = $('#deleteImgNumber').val( );
// 유효성을 검사한다. 
if(!img_number || isNaN(img_number) || img_number.length > 2) {
alert("이미지 번호를 올바르게 입력하세요.");
return;
}
$.ajax({
//이미지 정보를 삭제하는 API 엔드포인트다. 
url: './delete/' + img_number,
method: 'DELETE', success: function(data) {
alert("이미지를 삭제하였습니다.");
$('#deleteModal').modal('hide');
loadData( );
},
error: function(error) {
alert('삭제할 이미지 번호가 존재하지 않습니다.');
}
});
});
//테이블에 데이터를 표시한다. 
function displayTable(data) {
var tableBody = $('#resultTable tbody');
tableBody.empty( );
data.forEach(function(row) {
var rowHtml = '<tr>' +
'<td>' + row.img_number + '</td>' +
'<td>' + row.img_upload + '</td>' +
'<td>' + row.img_update + '</td>' +
'<td>' + row.img_url + '</td>' +
'</tr>';
//새로운 데이터를 추가한다. 
tableBody.append(rowHtml);
});
}
//페이지 로드 시 초기 데이터로 로드한다. 
loadData( );
});
</script>
</body>
</html>