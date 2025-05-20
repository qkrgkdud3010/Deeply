# 🎵 Deeply – 아티스트 × 팬 커뮤니티 플랫폼

![메인 화면](images/main.png)

> **아티스트 전용 영상·굿즈·챗봇을 제공하고, 팬은 멤버십 등급에 따라 차별화된 경험을 얻을 수 있는 Spring Boot 기반 팬덤 플랫폼입니다.**

| 구분 | 내용 |
| ---- | ---- |
| **기간** | 2024-12-09 ~ 2025-01-23 (6 인 / 총 60 h) |
| **역할** | 🎬 *영상 업로드 & 멤버십 접근 제어* · 💬 *댓글 모듈* · 🤖 *지식 기반 챗봇* |
| **GitHub** | <https://github.com/qkrgkdud3010/Deeply> |
| **주요 스택** | Java 17, Spring Boot, Spring Security, MyBatis, JSP, OAuth2(네이버·카카오), OracleDB |

---

## 📌 핵심 기능 — 내 담당 파트

### 1) 아티스트 영상 관리
- `VideoController`에 **/group / /upload / /page** REST 엔드포인트 설계 → 기능·뷰를 명확히 분리:contentReference[oaicite:0]{index=0}:contentReference[oaicite:1]{index=1}  
- Spring Security `@PreAuthorize`, `@AuthenticationPrincipal` 로 **아티스트·팬·관리자** 역할별 접근 제어:contentReference[oaicite:2]{index=2}:contentReference[oaicite:3]{index=3}  
- **YouTube URL → iframe** 자동 변환(`convertToEmbedUrl`) & 빈 URL 예외 처리로 안정적 스트리밍 구현:contentReference[oaicite:4]{index=4}:contentReference[oaicite:5]{index=5}  

### 2) 멤버십 기반 권한 제어
- 팬의 **멤버십 가입 여부**를 FanService로 조회 → 멤버십 전용 영상은 비가입자에게 비공개 처리:contentReference[oaicite:6]{index=6}:contentReference[oaicite:7]{index=7}  
- 역할·멤버십 조건이 바뀌어도 URL·Model 분리 덕분에 프론트 수정 없이 서버단 로직만 교체 가능  

### 3) 댓글·답글 모듈
- `/videos/writeReply`, `/videos/commentList` REST API 구현 → 로그인 기반 댓글·계층형 답글 지원:contentReference[oaicite:8]{index=8}:contentReference[oaicite:9]{index=9}  
- `VideoCommentVO`에 `parentCommentId` 추가, ServiceImpl에서 `null→0` 처리로 **1차/대댓글 구분**  
- MyBatis 주석 SQL + PreparedStatement 바인딩으로 **SQL Injection / XSS** 차단:contentReference[oaicite:10]{index=10}:contentReference[oaicite:11]{index=11}  

### 4) OpenAI 기반 챗봇
- CSV 지식베이스 + 임베딩 검색 → 질문에 맞는 문맥을 추출해 GPT 프롬프트에 삽입:contentReference[oaicite:12]{index=12}:contentReference[oaicite:13]{index=13}  
- OkHttp + Gson으로 ChatGPT·Embedding API 호출, 세션(JSON Array)에 대화 기록을 누적해 **연속 대화** 지원:contentReference[oaicite:14]{index=14}:contentReference[oaicite:15]{index=15}  

---

## 🛠 Tech Highlights
| 구분 | 적용 기술 · 효과 |
| ---- | --------------- |
| **보안** | Spring Security 구조 통합, 멤버십·역할 기반 `PreAuthorize`로 미인가 접근 차단 |
| **아키텍처** | Controller–Service–DAO 계층 분리 → 유지보수성·테스트 용이성 향상 |
| **퍼포먼스** | SQL `ROW_NUMBER() OVER(PARTITION BY…)`로 그룹별 최신 N 개 영상 조회 최적화 |
| **확장성** | 영상·댓글·챗봇 모듈을 인터페이스 기반으로 분리해 기능 추가 시 코드 영향 최소화 |

---

## 🚀 실행 방법

```bash
git clone https://github.com/qkrgkdud3010/Deeply.git
cd Deeply

# ① DB·OAuth2 설정
cp src/main/resources/application.yml.sample src/main/resources/application.yml
#    ↳ Oracle 커넥션, Naver·Kakao Client ID / Secret 입력

# ② 빌드 & 실행
./mvnw clean package
java -jar target/deeply-*.jar
