<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
  /* 제공해주신 CSS 코드 */
  .post-container {
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 3px 14px rgba(0, 0, 0, 0.05);
    display: flex;
    width: 100%;
    flex-direction: column;
    align-items: start;
    padding: 20px 30px 149px;
    font-family: Noto Sans, sans-serif;
  }
  .reply-input {
    border-radius: 6px;
    border: 1px solid var(--gray-400, #d1d5db);
    align-self: stretch;
    display: flex;
    padding: 11px 0 0;
    flex-direction: column;
  }
  .reply-placeholder {
    color: var(--gray-600, #6b7280);
    font-size: 13px;
    font-weight: 400;
    margin: 0 0 0 18px;
  }
  .action-bar {
    border-radius: 0 0 6px 6px;
    background: var(--gray-200, #f3f4f6);
    display: flex;
    margin-top: 90px;
    width: 100%;
    flex-direction: column;
    font-size: 14px;
    color: #fff;
    font-weight: 700;
    padding: 0 12px 9px 80px;
  }
  .divider {
    background-color: #d1d5db;
    align-self: center;
    width: 600px;
    max-width: 100%;
    height: 1px;
    border: 1px solid rgba(209, 213, 219, 1);
  }
  .post-button {
    border-radius: 6px;
    background-color: #000;
    align-self: end;
    display: flex;
    margin-top: 8px;
    gap: 18px;
    padding: 7px 9px 7px 21px;
  }
  .post-icon {
    aspect-ratio: 1;
    object-fit: contain;
    width: 16px;
  }
  .separator {
    align-self: center;
    margin-top: 15px;
    width: 641px;
    max-width: 100%;
    height: 1px;
    border: 1px solid #e3e3e3;
  }
  .user-info {
    display: flex;
    width: 272px;
    max-width: 100%;
    gap: 20px;
    justify-content: space-between;
    margin: 20px 0 0 18px;
  }
  .user-meta {
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .avatar {
    aspect-ratio: 1;
    object-fit: contain;
    width: 32px;
    border-radius: 11px;
  }
  .username {
    color: var(--gray-800, #1f2937);
    font-size: 12px;
    font-weight: 600;
    margin: auto 0;
  }
  .timestamp {
    color: var(--gray-600, #6b7280);
    font-size: 10px;
    font-weight: 400;
    margin: auto 0;
  }
  .menu-icon {
    aspect-ratio: 5.68;
    object-fit: contain;
    width: 17px;
    stroke-width: 1px;
    stroke: var(--gray-700, #4b5563);
    margin-top: 20px;
  }
  .thread-container {
    display: flex;
    margin-left: 33px;
    gap: 19px;
    flex-wrap: wrap;
  }
  .thread-line {
    background-color: #e5e7eb;
    width: 2px;
    height: 174px;
    border: 2px solid rgba(229, 231, 235, 1);
  }
  .post-content {
    align-self: start;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    flex-basis: 0;
  }
  .post-text {
    color: var(--gray-800, #1f2937);
    font-size: 13px;
    font-weight: 400;
  }
  .interaction-bar {
    display: flex;
    gap: 20px;
    font-size: 12px;
    color: var(--gray-700, #4b5563);
    font-weight: 600;
    margin: 16px 0 -30px 80px;
  }
  .action-button {
    display: flex;
    gap: 6px;
    align-items: center;
  }
  @media (max-width: 991px) {
    .post-container {
      max-width: 100%;
      padding: 0 20px 100px;
    }
    .reply-input {
      max-width: 100%;
    }
    .reply-placeholder {
      margin-left: 10px;
    }
    .action-bar {
      max-width: 100%;
      padding-left: 20px;
    }
    .user-info {
      margin-left: 10px;
    }
    .post-text {
      max-width: 100%;
    }
    .interaction-bar {
      margin: 0 0 10px 10px;
    }
  }
</style>

<div class="post-container">
  <div class="reply-input" role="textbox" tabindex="0" aria-label="Reply to post">
    <div class="reply-placeholder">Answer something...</div>
    <div class="action-bar">
      <div class="divider"></div>
      <div class="post-button" role="button" tabindex="0">
        <div>POST</div>
        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/34589a6e18af93eeda25abd08e3bdb591479aeeac632ec925a6b974cb8722066?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450" class="post-icon" alt="" />
      </div>
    </div>
  </div>
  <div class="separator"></div>
  <div class="user-info">
    <div class="user-meta">
      <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/53eaa26f84ec76d03c516471430ad2cd3bcdad1e5edd32a44225a107e88f3a47?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450" class="avatar" alt="Benny Goodman's profile picture" />
      <div class="username">Benny Goodman</div>
      <div class="timestamp">10 min ago</div>
    </div>
    <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/969b6a12fe21c1d1769e8ed4b2ff5b28f481984b7f0b46d426588e1a95cdf523?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450" class="menu-icon" alt="" />
  </div>
  <div class="thread-container">
    <div class="thread-line"></div>
    <div class="post-content">
      <p class="post-text">A Love Supreme is an album by American jazz saxophonist John Coltrane. He recorded it in one session on December 9, 1964, at Van Gelder Studio in Englewood Cliffs.</p>
      <div class="interaction-bar">
        <div class="action-button" role="button" tabindex="0">Reply</div>
        <div class="action-button" role="button" tabindex="0">
          <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/a2792805d54f608f2ffd8a4e021264f6b7d2f11455a059cfab9a9e0183cf3782?placeholderIfAbsent=true&apiKey=ce4da87792964033bdb1e6f244668450" class="post-icon" alt="" />
          <div>Boost</div>
        </div>
        <div class="action-button" role="button" tabindex="0">Like</div>
        <div class="action-button" role="button" tabindex="0">More</div>
      </div>
    </div>
  </div>
</div>
