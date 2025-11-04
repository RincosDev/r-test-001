<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        .board-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }
        .board-view {
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 4px;
            overflow: hidden;
        }
        .board-header {
            background: #f5f5f5;
            padding: 20px;
            border-bottom: 2px solid #4CAF50;
        }
        .board-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .board-info {
            color: #666;
            font-size: 14px;
        }
        .board-info span {
            margin-right: 20px;
        }
        .board-content {
            padding: 30px 20px;
            min-height: 300px;
            line-height: 1.8;
        }
        .board-footer {
            padding: 20px;
            background: #f9f9f9;
            border-top: 1px solid #ddd;
            text-align: center;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            margin: 0 5px;
        }
        .btn-primary {
            background: #4CAF50;
            color: white;
        }
        .btn-primary:hover {
            background: #45a049;
        }
        .btn-secondary {
            background: #2196F3;
            color: white;
        }
        .btn-secondary:hover {
            background: #0b7dda;
        }
        .btn-danger {
            background: #f44336;
            color: white;
        }
        .btn-danger:hover {
            background: #da190b;
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
        <h1>게시글 상세</h1>
        
        <c:if test="${not empty error}">
            <div class="error-message"><c:out value="${error}"/></div>
        </c:if>
        
        <c:if test="${not empty board}">
            <div class="board-view">
                <div class="board-header">
                    <div class="board-title"><c:out value="${board.title}"/></div>
                    <div class="board-info">
                        <span>작성자: <c:out value="${board.writer}"/></span>
                        <span>작성일: ${board.regDate}</span>
                        <span>조회수: ${board.viewCount}</span>
                    </div>
                </div>
                <div class="board-content">
                    <c:out value="${board.content}"/>
                </div>
                <div class="board-footer">
                    <button class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/board/list'">목록</button>
                    <button class="btn btn-secondary" onclick="editBoard(${board.boardNo})">수정</button>
                    <button class="btn btn-danger" onclick="deleteBoard(${board.boardNo})">삭제</button>
                </div>
            </div>
        </c:if>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        function editBoard(boardNo) {
            location.href = '${pageContext.request.contextPath}/board/editForm?boardNo=' + boardNo;
        }
        
        function deleteBoard(boardNo) {
            if(confirm('정말 삭제하시겠습니까?')) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/board/delete',
                    type: 'POST',
                    data: { boardNo: boardNo },
                    success: function(response) {
                        if(response.success) {
                            alert(response.message);
                            location.href = '${pageContext.request.contextPath}/board/list';
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function() {
                        alert('삭제 중 오류가 발생했습니다.');
                    }
                });
            }
        }
    </script>
</body>
</html>
