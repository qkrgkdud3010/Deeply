// category.js

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
