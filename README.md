![메인 화면](images/main.png)  
➡️[Deeply 포트폴리오](https://www.notion.so/Deeply-1848913a4d27805eb433df632ba7a05b)  

</br></br>

## 📑 목차  
📖 [프로젝트 개요](https://github.com/704hj/Deeply/tree/main#-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EA%B0%9C%EC%9A%94)</br>
⚙️ [개발환경 및 기술 스택](https://github.com/704hj/Deeply/tree/main#%EF%B8%8F-%EA%B0%9C%EB%B0%9C%ED%99%98%EA%B2%BD-%EB%B0%8F-%EA%B8%B0%EC%88%A0-%EC%8A%A4%ED%83%9D)</br>
😊 [담당 기능](https://github.com/704hj/Deeply/tree/main#-%EB%8B%B4%EB%8B%B9-%EA%B8%B0%EB%8A%A5)</br>
💡 [문제 해결](https://github.com/704hj/Deeply/tree/main#-%EB%AC%B8%EC%A0%9C-%ED%95%B4%EA%B2%B0)</br>
❓ [느낀 점](https://github.com/704hj/Deeply/tree/main#-%EB%8A%90%EB%82%80-%EC%A0%90)</br>

</br></br>

## 📖 프로젝트 개요

**1. 소개**  
  - **이름** : Deeply  
  - **개요** : 아티스트와 팬을 이어주는 커뮤니티 플랫폼 개발  
  - **작업기간** : 2024/12/09 ~ 2025/01/23 (평균 하루 5시간 총 60시간)
  - **팀원구성** : 총 6명  

**2. 목표**  
  - 아티스트와 팬이 다양한 방식으로 소통하며 더욱 깊은 유대감을 형성할 수 있는 환경 제공  
  - 그룹별 콘텐츠와 상품을 체계적으로 관리하고, 팬덤별 맞춤형 서비스를 통해 사용자 만족도 극대화  
  - 팬덤 커뮤니티를 활성화하여 긍정적이고 지속적인 팬 활동을 지원  

**3. 주요 기능**  
  - 1:1 편지쓰기 기능 : 팬들이 아티스트와 1:1로 소통할 수 있도록 지원하며, 아티스트가 직접 답장 가능  
  - 그룹별 상품 판매 : 그룹별 맞춤형 상품 판매 및 구매 내역 관리  
  - 그룹별 영상 시청 : 팬들이 아티스트의 독점 영상 콘텐츠를 그룹별로 시청할 수 있는 스트리밍 서비스 제공  

</br></br>

## ⚙️ 개발환경 및 기술 스택  

- **개발 환경**  
  - **OS** : Windows 11  
  - **Database** : Oracle  
  - **Service System** : 클라이언트-서버 모델, CRUD 기능 제공, UI와 백엔드 연동  

- **사용 기술**  
    ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white)
    ![CSS3](https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white)
    ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
    ![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
    ![Bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)</br>
    ![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
    ![Oracle](https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=oracle&logoColor=black)
    ![JSP](https://img.shields.io/badge/JSP-323330?style=for-the-badge&logo=eclipse&logoColor=white)
    ![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=Spring-Boot&logoColor=white)
    ![Spring_Security](https://img.shields.io/badge/Spring_Security-6DB33F?style=for-the-badge&logo=Spring-Security&logoColor=white)


</br></br>

## 😊 담당 기능

**1. 메인 페이지**  
   ![main](https://github.com/704hj/Deeply/blob/main/images/main.gif?raw=true)  
  - MySQL과 연동된 상품 데이터 출력  
  - JSTL과 EL을 활용한 동적 데이터 처리  
  - Bootstrap과 jQuery를 활용한 반응형 UI 구현  
  - JavaScript와 JSP 연동을 통한 동적 콘텐츠 관리  

</br>

**2. SHOP (판매자 - 아티스트 계정)**  
![main](https://github.com/704hj/Deeply/blob/main/images/artist.gif?raw=true)
  - **상품 관리**  
    - MyBatis를 활용한 상품 등록 및 수정 (썸머노트 에디터 적용)  
    - JavaScript와 Ajax를 활용한 실시간 상품 삭제 처리  
    - PrincipalDetails를 활용한 로그인한 아티스트 전용 기능 설정  

  - **구독 회원 전용 상품 관리**  
    - 구독 여부에 따른 상품 노출  
    - SQL 조건문과 JSTL을 활용한 동적 콘텐츠 렌더링  

</br>

**3. SHOP (구매자 - 팬 계정)**  
![main](https://github.com/704hj/Deeply/blob/main/images/cart.gif?raw=true)  
  - **장바구니 기능**  
    - 로그인된 사용자만 상품 추가 가능 (Spring Security 적용)  
    - JavaScript와 Ajax를 활용한 비동기 장바구니 관리  
  - **주문 처리**  
    - 장바구니 전체 주문 및 단일 상품 주문  
    - 주문 완료 후 재고 자동 차감  

</br>

**4. 마이페이지**  
![main](https://github.com/704hj/Deeply/blob/main/images/mypage.gif?raw=true)  
  - **주문 내역 조회**  
    - MyBatis를 활용한 주문 내역 관리  
    - 주문 날짜, 상품 정보 및 결제 금액 출력  

</br></br>

## 💡 문제 해결

**[그룹별 최신 상품 조회 SQL 최적화](https://www.notion.so/controller-1778913a4d27805e9bc3dc00ed040056)**  
  
- **문제점**
  - 특정 그룹별 최신 등록된 상품 조회 시 중첩된 for문 사용으로 비효율적
  - **성능 및 효율성 문제**
    - 그룹 개수 M개, 아이템 개수 N개라면, 매번 모든 Item을 순회하게 되어 성능적으로 비효율적
  - **로직의 유지보수성**
    - 컨트롤러(또는 서비스) 로직에서 매번 조건 분기를 하게 되면
    - 나중에 그룹을 매핑하는 방식이 바뀌었을 때, 해당 이중 for문의 조건식들을 전부 다 수정해야 함

- **해결 과정**  
  - SQL의 PARTITION BY와 ROW_NUMBER()를 활용하여 그룹별 최신 4개 상품을 추출  
  - COUNT(*)를 활용한 서브쿼리를 적용하여 불필요한 로직을 제거하고 성능 개선  

- **결과 및 성과**  
  - 쿼리 실행 속도 개선 및 애플리케이션 로직 단순화  
  - 컨트롤러에서 추가 처리 없이 최적화된 데이터 반환으로 전체 성능 향상  
  - Service 계층에서 DAO를 통해 SQL 로직을 개선하고 효율적으로 데이터 처리

</br></br>

## ❓ 느낀 점

- **[]매일 프로젝트 진행 상황을 기록하며 성장(https://www.notion.so/Deeply-1718913a4d27801d8763feadc42cfe44)**  
  - 상세한 일지를 작성하며 진행 상황을 관리하고, 문제 해결 과정을 복기하여 빠른 문제 해결에 기여  

- **데이터베이스 설계의 중요성 체감**  
  - 잘못된 데이터 구조가 기능 구현 및 유지보수에 미치는 영향을 경험하며, 효율적인 데이터 모델링의 필요성을 깨달음  

- **[JavaScript 비동기 처리 개선 필요성 인식](https://www.notion.so/1718913a4d2781279c9cd87ac00cb3d1)**  
  - Ajax와 JavaScript를 활용해 실시간 반영을 구현하며 UX 향상을 경험했지만, 효율적인 비동기 로직 개선 필요성을 느낌
    

- **[Spring Boot 활용으로 생산성 향상](https://www.notion.so/Spring-1718913a4d27810ea984f641abb33e0a)**  
  - 기존 설정 작업이 간소화되면서 개발 속도가 향상됨을 경험하고, 대규모 프로젝트에서의 생산성 향상을 체감
