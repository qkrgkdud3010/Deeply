<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="artist-main background-black">
	<div class="a-mainpic">아티스트 이미지</div>
	<div class="artist-detail">
		<div class="vertical-center">
			<div class="width-80">
				<div class="a-fandom font-white bold-title vertical-center">아티스트 팬덤명</div>
				<div class="a-title font-white bold-title vertical-center">아티스트 이름</div>
			</div>
			<div class="width-20">
				<hr class="premium-hr">
				<div class="premium-btn font-white bold-title align-center">구독 중</div>
				<hr class="premium-hr">
			</div>
			
		</div>
		<div class="a-desc font-white vertical-center">아티스트 상세 글</div>
		<div class="detail-premium-container">
			<button class="premium-item ad-chat">채팅</button>
			<button class="premium-item ad-letter" onclick="location.href='${pageContext.request.contextPath}/letter/list'">편지</button>
			<button class="premium-item ad-book" onclick="location.href='${pageContext.request.contextPath}/booking/list?artist_num=51'">예매</button>
		</div>
		<div class="a-profile font-white bold-title vertical-center">PROFILE</div>
		<div class="member-container">
			<div class="member-list">
				<div class="member-item">
					<img class="member-profile-img">
					<div class="align-center font-white bold-title top-5">멤버 이름1</div>
				</div>
				<div class="member-item">
					<img class="member-profile-img">
					<div class="align-center font-white bold-title top-5">멤버 이름2</div>
				</div>
			</div>
			<div class="member-detail font-white">
				<hr>
				<ul>
					<li>
						<label>아티스트</label><span>멤버 이름</span>
					</li>
					<li>
						<label>데뷔일</label><span>xxxx.xx.xx</span>
					</li>
				</ul>
				<hr>
				<div class="member-desc font-white vertical-center left-3">멤버 소개글</div>
			</div>
			<div class="official-board-container">
				<div class="official-board-title font-white bold-title"><span class="vertical-center left-5">공지사항</span></div>
				<div class="official-board-list">
					<ul>
						<li class="official-board-item align-center font-white top-3">공지사항 1</li>
						<li class="official-board-item align-center font-white top-3">공지사항 2</li>
						<li class="official-board-item align-center font-white top-3">공지사항 3</li>
						<li class="official-board-item align-center font-white top-3">공지사항 4</li>
						<li class="official-board-item align-center font-white top-3">공지사항 5</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="artist-main">
	<div class="artist-contents-container">
		<div class="artist-contents-title bold-title">HIGHLIGHTS</div>
		<div class="artist-contents-list vertical-center">
			<div class="artist-contents-item">
				<img>
			</div>
			<div class="artist-contents-item">
				<img>
			</div>
			<div class="artist-contents-item">
				<img>
			</div>
			<div class="artist-contents-item">
				<img>
			</div>
		</div>
		<div class="artist-contents-more align-right vertical-center">->전체 영상</div>
	</div>
	<div class="artist-contents-container">
		<div class="artist-contents-title bold-title">SHOP</div>
		<div class="artist-contents-list vertical-center">
			<div class="artist-contents-item">
				<img>
			</div>
			<div class="artist-contents-item">
				<img>
			</div>
			<div class="artist-contents-item">
				<img>
			</div>
			<div class="artist-contents-item">
				<img>
			</div>
		</div>
		<div class="artist-contents-more align-right vertical-center">->전체 상품</div>
	</div>
</div>