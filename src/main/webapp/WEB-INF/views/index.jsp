<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>R-TEST-001</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>R-TEST-001 프로젝트</h1>
            <p class="subtitle">Spring MVC + MyBatis + Oracle</p>
        </div>
        
        <div class="content">
            <div class="welcome-box">
                <h2>${message}</h2>
                <p>Java 1.8 / Spring 4.3 / MyBatis 3.4 / Oracle 11g</p>
            </div>
            
            <div class="menu-section">
                <h3>메뉴</h3>
                <ul class="menu-list">
                    <li><a href="${pageContext.request.contextPath}/board/list" class="btn">게시판</a></li>
                    <li><a href="${pageContext.request.contextPath}/test/list" class="btn">테스트 목록</a></li>
                </ul>
            </div>
            
            <div class="info-box">
                <h3>시스템 정보</h3>
                <table class="info-table">
                    <tr>
                        <th>프로젝트명</th>
                        <td>R-TEST-001</td>
                    </tr>
                    <tr>
                        <th>버전</th>
                        <td>1.0.0</td>
                    </tr>
                    <tr>
                        <th>구조</th>
                        <td>MVC (Controller - Service - DAO - XML)</td>
                    </tr>
                    <tr>
                        <th>DB</th>
                        <td>Oracle 11g Enterprise Edition</td>
                    </tr>
                </table>
            </div>
        </div>
        
        <div class="footer">
            <p>&copy; 2025 R-TEST-001. All rights reserved.</p>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</body>
</html>
