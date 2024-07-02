# 이미지 CRUD(Final Project)
<br>

## ⚙️ 환경 및 버전
<!-- 개발 운영 체제 -->
<img src="https://img.shields.io/badge/OS-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/Window11-40AEF0?style=for-the-badge"><br>
<!-- 통합 개발 환경 -->
<img src="https://img.shields.io/badge/IDE-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/STS4-006600?style=for-the-badge"><br>
<!-- 빌드 -->
<img src="https://img.shields.io/badge/Build-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white"><img src="https://img.shields.io/badge/8.9-515151?style=for-the-badge"><br>
<!-- 언어 -->
<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/java-%23ED8B00?style=for-the-badge&logo=openjdk&logoColor=white"><img src="https://img.shields.io/badge/17-515151?style=for-the-badge"><br>
<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"/><br>
<img src="https://img.shields.io/badge/Language-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white"><br>
<!-- 프레임워크 -->
<img src="https://img.shields.io/badge/Framework-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white"><img src="https://img.shields.io/badge/3.1.1-515151?style=for-the-badge"><br>
<!-- 데이터베이스 -->
<img src="https://img.shields.io/badge/DataBase-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"><img src="https://img.shields.io/badge/21c-515151?style=for-the-badge"><br>
<!-- 형상관리 -->
<img src="https://img.shields.io/badge/Version Control-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"/><br>
<img src="https://img.shields.io/badge/Version Control-%23121011?style=for-the-badge"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white"/><br>

<br>
<br>

### 1. 이미지 목록 화면(ImgSelect)
![이미지 목록 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/3c65f69b-cd38-4699-bc2d-0d409bee428f)

- 이미지 번호, 업로드 날짜, 수정 날짜, 미리 보기
- 이미지 상세 보기 버튼을 통해 이미지 수정 및 삭제 가능
- 하단의 이미지 등록 버튼을 눌러 등록할 수 있음

<br>

### 2. 상세 이미지 정보(ImgSelectDetail)
![상세 이미지 정보 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/55ec8b69-884d-42e8-99ac-51284a4b4a8a)

- 1개의 이미지의 상세 정보를 볼 수 있음
- 이미지 목록으로 다시 돌아가거나 이미지 수정, 삭제를 할 수 있음

<br>

### 3-1. 이미지 변경(ImgUpdate)
![이미지 수정 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/7b118739-c24b-4537-9271-a768f77a5248)

- 이미지 번호, 업로드 날짜, 수정 날짜를 불러올 수 있고 사용자가 수정할 수 없음
- 이미지 확장자 파일만 업로드 가능하고, 미리보기 구현

### 3-2. 변경된 이미지 목록 화면
![변경된 이미지 목록 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/4dfbc174-5fc9-49ba-9f6c-16128a065897)

- 최초 업로드 날짜와 수정해서 업로드한 날짜가 뜸
- 변경된 이미지를 미리보기를 통해 확인 가능

<br>

### 4-1. 이미지 등록(ImgInsert
![이미지 등록 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/37be8870-c27d-40f0-8e6d-48724b3cc8fc)

- 이미지 확장자 파일만 업로드 가능
- 이미지의 이름과 미리보기가 뜸

### 4-2. 이미지 등록이 완료된 화면
![이미지 등록 완료 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/7c9c72dc-1fbf-49fc-842a-65f212932f95)

- 업로드 날짜, 수정 날짜를 확인하고 이미지 미리보기 구현

<br>

### 5. 이미지 삭제(ImgDelete)
![이미지 삭제 화면](https://github.com/shinjyun/SamSam-Final-Image/assets/147064251/9fae07b8-f067-4722-bd67-29d4f1c69ee7)

- 이미지 상세 보기의 삭제 버튼을 클릭하면 alert으로 알림
