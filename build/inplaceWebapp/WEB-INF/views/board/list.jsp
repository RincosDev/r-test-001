<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        .board-container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
        }
        .board-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .board-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .board-table th {
            background: #4CAF50;
            color: white;
            padding: 12px;
            text-align: center;
            font-weight: bold;
        }
        .board-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        .board-table td.title {
            text-align: left;
            cursor: pointer;
        }
        .board-table td.title:hover {
            color: #4CAF50;
            text-decoration: underline;
        }
        .board-table tr:hover {
            background-color: #f5f5f5;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn-primary {
            background: #4CAF50;
            color: white;
        }
        .btn-primary:hover {
            background: #45a049;
        }
        .no-data {
            text-align: center;
            padding: 40px;
            color: #999;
        }
        .error-message {
            background: #ffebee;
            color: #c62828;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="board-container">
        <div class="board-header">
            <h1>게시판</h1>
            <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/writeForm'">글쓰기</button>
        </div>
        
        <c:if test="${not empty error}">
            <div class="error-message"><c:out value="${error}"/></div>
        </c:if>
        
        <table class="board-table">
            <thead>
                <tr>
                    <th style="width: 80px;">번호</th>
                    <th>제목</th>
                    <th style="width: 120px;">작성자</th>
                    <th style="width: 100px;">조회수</th>
                    <th style="width: 180px;">작성일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty boardList}">
                        <tr>
                            <td colspan="5" class="no-data">등록된 게시글이 없습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="board" items="${boardList}" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td class="title" onclick="viewBoard(${board.boardNo})"><c:out value="${board.title}"/></td>
                                <td><c:out value="${board.writer}"/></td>
                                <td>${board.viewCount}</td>
                                <td>${board.regDate}</td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        function viewBoard(boardNo) {
            location.href = '${pageContext.request.contextPath}/board/view?boardNo=' + boardNo;
        }
    </script>
</body>
</html>
