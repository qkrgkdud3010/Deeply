<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<title>영상 업로드</title>

<!-- CKEditor 5 Classic Editor CDN -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>

<!-- 스타일링 -->
<style>
/* 모든 요소에 box-sizing: border-box 적용 */
*, *::before, *::after {
	box-sizing: border-box;
}

.video-upload-content {
	width: 80%; /* 부모 컨테이너의 너비를 80%로 설정 */
	margin: 0 auto; /* 가운데 정렬 */
}

.editor-container {
	width: 100%; /* 부모 컨테이너의 너비를 100%로 설정 */
	padding: 10px; /* 동일한 패딩 설정 */
}

.ck.ck-editor {
	width: 100% !important; /* 에디터의 너비를 100%로 설정 */
	max-width: none; /* max-width 제한 제거 */
}

.ck-editor__editable {
	min-height: 300px;
	width: 100% !important; /* editable 영역의 너비를 100%로 설정 */
}

.hidden {
	display: none;
}

/* 입력 필드 스타일 */
.title-container input.upload-title, .tab-panel input[name="mediaUrl"],
	.upload-video-description {
	width: 100%;
	padding: 10px; /* 동일한 패딩 */
	font-size: 16px;
	border: 1px solid #ccc; /* 일관된 보더 */
}

/* 새로운 영상 설명 탭의 입력 필드 스타일 */
.upload-video-description {
	min-height: 150px;
}

/* 기능 버튼 스타일 */
.form-actions button {
	padding: 10px 20px;
	font-size: 16px;
	margin-right: 10px;
}

.category-select-container {
    width: 100%; /* 부모 컨테이너 너비 */
    position: relative;
}

.selected-category {
    padding: 10px;
    border: 1px solid #ccc;
    background-color: white;
    width: 100%;
    box-sizing: border-box;
}

.dropdown-menu {
    position: absolute;
    background-color: white;
    border: 1px solid #ccc;
    z-index: 1000;
    width: 100%; /* 메뉴 너비 고정 */
    box-sizing: border-box;
    height: 300px; /* 고정 높이 */
    overflow-y: scroll; /* 내용이 많을 경우 스크롤 가능 */
    scrollbar-width: none; /* Firefox */
    -ms-overflow-style: none; /* IE and Edge */
}

.dropdown-menu::-webkit-scrollbar {
    display: none; /* Chrome, Safari, and Opera */
}

.dropdown-item-container {
    padding: 10px;
}

.dropdown-item {
    padding: 10px;
    cursor: pointer;
    white-space: nowrap; /* 한 줄로 표시 */
    overflow: hidden; /* 내용이 넘칠 경우 숨김 */
    text-overflow: ellipsis; /* 넘치는 내용은 "..." 처리 */
}

.dropdown-item:hover {
    background-color: #f0f0f0;
}

.add-category-container {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 입력 필드와 버튼을 가로로 배치 */
    padding: 10px;
    border-top: 1px solid #ccc; /* 상단 경계선 */
}

.add-category-container input {
    flex: 1;
    padding: 10px;
    margin-right: 10px;
    border: 1px solid #ccc;
}

.add-category-container button {
    padding: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 3px;
}

/* 탭 버튼 스타일 */
.tabs-container .tab-button {
	display: inline-block;
	padding: 10px 20px;
	cursor: pointer;
	border: 1px solid #ccc;
	border-bottom: none;
	background-color: #f9f9f9;
	margin-right: 5px;
}

.tabs-container .tab-button.active {
	background-color: white;
	font-weight: bold;
}

/* 탭 콘텐츠 스타일 */
.tab-content .tab-panel {
	border: 1px solid #ccc;
	padding: 20px;
	display: none;
}

.tab-content .tab-panel.active {
	display: block;
}
</style>

<script type="text/javascript">
function toggleDropdown() {
    const dropdownMenu = document.getElementById('dropdown-menu');
    dropdownMenu.classList.toggle('hidden'); // 열고 닫기 토글
}

function selectCategory(categoryName) {
    document.getElementById('selected-category').innerText = categoryName;
    document.getElementById('selected-category-input').value = categoryName; // 선택된 값을 hidden input에 저장
    toggleDropdown(); // 드롭다운 닫기
}

function addCategory() {
    const newCategoryName = document.getElementById('new-category-name').value.trim();
    if (newCategoryName) {
        const dropdownMenu = document.getElementById('dropdown-menu');
        const dropdownContainer = dropdownMenu.querySelector('.dropdown-item-container');

        const newItem = document.createElement('div');
        newItem.className = 'dropdown-item';
        newItem.innerText = newCategoryName;
        newItem.onclick = () => selectCategory(newCategoryName);

        dropdownContainer.appendChild(newItem);

        // 입력 필드 초기화
        document.getElementById('new-category-name').value = '';
        alert('새 카테고리가 추가되었습니다.');
    } else {
        alert('카테고리 이름을 입력하세요.');
    }
}
</script>
</head>
<body>
	<div class="video-upload-content">
		<!-- 메인 타이틀 -->
		<section class="main-title">
			<h1>영상 업로드</h1>
		</section>

		<!-- 업로드 섹션 -->
		<section class="upload-section">
			<h2>영상 업로드</h2>
			<!-- 파일 업로드는 제거하므로, 일반 POST로 변경 -->
			<form action="/videos/upload" method="post" id="video-upload-form"
				novalidate>
				<!-- CSRF 토큰 -->
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<!-- 제목 입력 -->
				<div class="title-container">
					<input type="text" name="title" maxlength="100"
						placeholder="제목을 입력하세요" class="upload-title" data-required="true">
					<span class="char-limit">0/100</span>
				</div>

				<!-- 카테고리와 멤버십 여부 선택 -->
				<div class="selection-row">
					<div class="category-select-container"
						style="cursor: pointer; position: relative; width: 400px;">
						<!-- 선택된 카테고리 -->
						<div class="selected-category" id="selected-category"
							onclick="toggleDropdown()">카테고리 선택</div>
						<input type="hidden" name="category" id="selected-category-input"
							value="">

						<!-- 드롭다운 메뉴 -->
						<div id="dropdown-menu" class="dropdown-menu hidden">
							<!-- 카테고리 리스트 -->
							<div class="dropdown-item-container">
								<div class="dropdown-item"
									onclick="selectCategory('XCON 사우디 아라비아')">XCON 사우디 아라비아</div>
								<div class="dropdown-item"
									onclick="selectCategory('뉴진스 코드 in Busan')">뉴진스 코드 in
									Busan</div>
								<div class="dropdown-item"
									onclick="selectCategory('이름이 너무 긴 카테고리 이름은 이렇게 처리됩니다')">
									이름이 너무 긴 카테고리 이름은 이렇게 처리됩니다</div>
							</div>

							<!-- 카테고리 추가 -->
							<div class="add-category-container">
								<input type="text" id="new-category-name" placeholder="카테고리 명" />
								<button type="button" onclick="addCategory()">추가</button>
							</div>
						</div>
					</div>


					<!-- 멤버십 여부 선택 -->
					<div class="membership-toggle" style="margin-top: 15px;">
						<label for="isExclusive"> <input type="checkbox"
							id="isExclusive" name="isExclusive" value="1"
							style="margin-right: 10px;"> <span>멤버십 영상</span>
						</label>
					</div>
				</div>


				<!-- 탭 버튼 (글, 링크, 영상 설명) -->
				<div class="tabs-container">
					<div class="tab-button active" data-tab="text">
						<span class="tab-icon"></span> 글
					</div>
					<div class="tab-button" data-tab="link">
						<span class="tab-icon"></span> 링크
					</div>
					<div class="tab-button" data-tab="video-description">
						<span class="tab-icon"></span> 영상 설명
					</div>
				</div>

				<!-- 탭에 따른 콘텐츠 영역 -->
				<div class="tab-content" id="tab-content">
					<!-- 1) 글 탭 -->
					<div class="tab-panel active" data-tab="text">
						<!-- Rich Text Editor -->
						<div class="editor-container">
							<!-- Editable Div for CKEditor 5 -->
							<div id="description-editor" class="description-editor"
								data-required="true"></div>
							<!-- Hidden textarea to store the editor data -->
							<textarea name="description" id="description"
								class="description-input hidden"></textarea>
						</div>
					</div>

					<!-- 2) 링크 탭 -->
					<div class="tab-panel" data-tab="link">
						<input type="url" name="mediaUrl" id="mediaUrl"
							placeholder="유튜브 링크를 입력하세요" data-required="true">
					</div>

					<!-- 3) 영상 설명 탭 -->
					<div class="tab-panel" data-tab="video-description">
						<textarea name="videoDescription" id="videoDescription"
							placeholder="영상 설명을 입력하세요" class="upload-video-description"
							data-required="true"></textarea>
					</div>
				</div>

				<!-- 기능 버튼 -->
				<div class="form-actions">
					<button type="submit" class="btn-post">Post</button>
				</div>
			</form>
		</section>
	</div>

	<!-- CKEditor 5 초기화 스크립트 -->
	<script>
        let editorInstance;

        ClassicEditor
            .create(document.querySelector('#description-editor'), {
                toolbar: {
                    items: [
                        'heading', '|',
                        'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote'
                    ]
                },
                heading: {
                    options: [
                        { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
                        { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
                        { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' }
                    ]
                },
                removePlugins: [ 'MediaEmbed' ],
            })
            .then(editor => {
                editorInstance = editor;
            })
            .catch(error => {
                console.error(error);
            });
    </script>

	<!-- 커스텀 폼 검증 스크립트 -->
	<script>
        document.getElementById('video-upload-form').addEventListener('submit', function(event) {
            // CKEditor의 데이터를 textarea에 저장
            const descriptionData = editorInstance.getData();
            document.getElementById('description').value = descriptionData;

            // 필수 필드 검증
            const form = event.target;
            const requiredFields = form.querySelectorAll('[data-required="true"]');
            const missingFields = [];

            requiredFields.forEach(field => {
                if (field.type === 'checkbox' || field.type === 'radio') {
                    if (!field.checked) {
                        missingFields.push(field);
                    }
                } else if (field.tagName.toLowerCase() === 'div' && field.id === 'description-editor') {
                    // CKEditor의 경우, 에디터 내용이 비어있는지 확인
                    if (editorInstance.getData().trim() === '') {
                        missingFields.push(field);
                    }
                } else {
                    if (!field.value || field.value.trim() === '') {
                        missingFields.push(field);
                    }
                }
            });

            if (missingFields.length > 0) {
                event.preventDefault(); // 폼 제출 차단
                alert('모든 필수 필드를 채워주세요.');
                
                // 첫 번째 누락된 필드로 포커스 이동
                const firstMissing = missingFields[0];
                if (firstMissing.tagName.toLowerCase() === 'div' && firstMissing.id === 'description-editor') {
                    editorInstance.editing.view.focus();
                } else {
                    firstMissing.focus();
                }
            }
        });
    </script>

	<script src="${pageContext.request.contextPath}/assets/js/tabs.js"
		defer></script>
</body>
</html>
