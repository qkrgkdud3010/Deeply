<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴진스 페이지</title>
    <style>
        body {
            font-family: 'Inter', 'Manrope', sans-serif;
            margin: 0;
            padding: 0;
            background: #FFFFFF;
        }

        .header {
            position: fixed;
            top: 0;
            width: 100%;
            height: 100px;
            background: #FFFFFF;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header .logo img {
            height: 30px;
        }

        .header .nav a {
            margin: 0 15px;
            font-size: 20px;
            color: #000;
            text-decoration: none;
        }

        .main-title {
            margin-top: 120px;
            text-align: center;
            font-size: 38px;
            font-weight: 700;
            color: #000;
        }

        .membership-section,
        .category-section,
        .live-section {
            margin: 50px auto;
            width: 90%;
        }

        .membership-section h2,
        .category-section h2,
        .live-section h2 {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .membership-slider,
        .category-videos,
        .live-videos {
            display: flex;
            gap: 15px;
            overflow-x: auto;
        }

        .membership-slider .card,
        .category-videos .card,
        .live-videos .card {
            width: 248px;
            height: 342px;
            background: #1A1A1A;
            border: 1px solid #262626;
            border-radius: 12px;
            flex-shrink: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .membership-slider .card img,
        .category-videos .card img,
        .live-videos .card img {
            width: 100%;
            height: 100%;
            border-radius: 12px;
            object-fit: cover;
        }

        .membership-banner {
            margin-top: 10px;
            text-align: right;
        }

        .membership-banner a {
            font-size: 18px;
            color: #000;
            text-decoration: none;
            background: #FFDD57;
            padding: 10px 20px;
            border-radius: 8px;
        }

        .footer {
            margin-top: 50px;
            background: #F1F1F1;
            padding: 20px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="logo">
            <img src="/resources/images/logo.png" alt="DEEPly">
        </div>
        <nav class="nav">
            <a href="#">커뮤니티</a>
            <a href="#">아티스트</a>
            <a href="#">SHOP</a>
            <a href="#">Nickname님</a>
            <a href="#">로그아웃</a>
        </nav>
    </header>

    <!-- Main Title -->
    <section class="main-title">
        <h1>뉴진스</h1>
    </section>

    <!-- Membership Section -->
    <section class="membership-section">
        <h2>멤버십 전용</h2>
        <div class="membership-slider">
            <div class="card"><img src="/resources/images/member1.jpg" alt="멤버1"></div>
            <div class="card"><img src="/resources/images/member2.jpg" alt="멤버2"></div>
            <div class="card"><img src="/resources/images/member3.jpg" alt="멤버3"></div>
        </div>
        <div class="membership-banner">
            <a href="#">멤버십 신청하기</a>
        </div>
    </section>

    <!-- Category Section -->
    <section class="category-section">
        <h2>뉴진스 카테고리 별 영상</h2>
        <div class="category-videos">
            <div class="card"><img src="/resources/images/video1.jpg" alt="비디오1"></div>
            <div class="card"><img src="/resources/images/video2.jpg" alt="비디오2"></div>
            <div class="card"><img src="/resources/images/video3.jpg" alt="비디오3"></div>
        </div>
    </section>

    <!-- Live Section -->
    <section class="live-section">
        <h2>실시간 방송</h2>
        <div class="live-videos">
            <div class="card"><img src="/resources/images/live1.jpg" alt="라이브1"></div>
            <div class="card"><img src="/resources/images/live2.jpg" alt="라이브2"></div>
            <div class="card"><img src="/resources/images/live3.jpg" alt="라이브3"></div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <p>&copy; DEEPly | 약관 | 개인정보처리방침</p>
    </footer>
</body>
</html>
