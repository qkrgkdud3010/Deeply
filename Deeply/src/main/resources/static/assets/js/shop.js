/*======================
         검색창 
 =======================*/
 document.addEventListener("DOMContentLoaded", () => {
     const searchTrigger = document.getElementById("search-trigger");
     const searchModal = document.getElementById("artist-search-modal");
     const closeSearch = document.getElementById("close-search");
     const searchInput = document.getElementById("artist-search");
     const artistList = document.getElementById("artist-list");

     let artistData = []; // 서버에서 받은 데이터 캐싱

     // 검색창 열기
     searchTrigger.addEventListener("click", () => {
         searchModal.classList.remove("hidden"); // 검색창 보이기
         fetchArtists(); // 데이터 가져오기
     });

     // 검색창 닫기
     closeSearch.addEventListener("click", () => {
         searchModal.classList.add("hidden"); // 검색창 숨기기
     });

     // 서버에서 아티스트 데이터 가져오기
     function fetchArtists() {
         if (artistData.length === 0) {
             fetch("/api/artists") // API 호출
                 .then(response => response.json())
                 .then(data => {
                     artistData = data; // 데이터 저장
                     renderArtists(artistData); // 데이터 렌더링
                 })
                 .catch(error => console.error("Error fetching artists:", error));
         } else {
             renderArtists(artistData); // 이미 데이터가 있으면 렌더링
         }
     }

     // 검색 입력 처리
     searchInput.addEventListener("input", (e) => {
         const query = e.target.value.toLowerCase();
         const filteredData = artistData.filter(artist =>
             artist.group_name.toLowerCase().includes(query)
         );
         renderArtists(filteredData); // 필터링된 데이터 렌더링
     });

     // 아티스트 목록 렌더링
     function renderArtists(artists) {
         artistList.innerHTML = ""; // 기존 목록 초기화
         if (artists.length === 0) {
             artistList.innerHTML = "<p>No results found.</p>";
             return;
         }
         artists.forEach(artist => {
             const div = document.createElement("div");
             div.className = "artist-item";
             div.innerHTML = `
                 <img src="/images/${artist.group_photo || 'default.png'}" alt="${artist.group_name}" />
                 <span class="artist-name">${artist.group_name}</span>
             `;
             artistList.appendChild(div);
         });
     }
 });
