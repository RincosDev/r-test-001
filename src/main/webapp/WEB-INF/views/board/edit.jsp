<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <style>
        .board-container {
            max-width: 900px;
            margin: 30px auto;
            padding: 20px;
        }
        .board-form {
            background: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-radius: 4px;
            padding: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .form-group textarea {
            min-height: 300px;
            resize: vertical;
            font-family: inherit;
        }
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #4CAF50;
        }
        .form-group input[readonly] {
            background: #f5f5f5;
            cursor: not-allowed;
        }
        .form-footer {
            text-align: center;
            margin-top: 30px;
        }
        .btn {
            padding: 12px 30px;
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
            background: #999;
            color: white;
        }
        .btn-secondary:hover {
            background: #888;
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
        <h1>게시글 수정</h1>
        
        <c:if test="${not empty error}">
            <div class="error-message"><c:out value="${error}"/></div>
        </c:if>
        
        <c:if test="${not empty board}">
            <div class="board-form">
                <form id="boardForm">
                    <input type="hidden" name="boardNo" value="${board.boardNo}">
                    
                    <div class="form-group">
                        <label for="title">제목 <span style="color: red;">*</span></label>
                        <input type="text" id="title" name="title" value="<c:out value='${board.title}'/>" required maxlength="500">
                    </div>
                    
                    <div class="form-group">
                        <label for="writer">작성자</label>
                        <input type="text" id="writer" value="<c:out value='${board.writer}'/>" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea id="content" name="content"><c:out value="${board.content}"/></textarea>
                    </div>
                    
                    <div class="form-footer">
                        <button type="submit" class="btn btn-primary">수정</button>
                        <button type="button" class="btn btn-secondary" onclick="goBack()">취소</button>
                    </div>
                </form>
            </div>
        </c:if>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        var boardNo = ${board.boardNo};
        
        $(document).ready(function() {
            $('#boardForm').submit(function(e) {
                e.preventDefault();
                
                var title = $('#title').val().trim();
                
                if(!title) {
                    alert('제목을 입력해주세요.');
                    $('#title').focus();
                    return false;
                }
                
                $.ajax({
                    url: '${pageContext.request.contextPath}/board/edit',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        if(response.success) {
                            alert(response.message);
                            location.href = '${pageContext.request.contextPath}/board/view?boardNo=' + boardNo;
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function() {
                        alert('수정 중 오류가 발생했습니다.');
                    }
                });
            });
        });
        
        function goBack() {
            location.href = '${pageContext.request.contextPath}/board/view?boardNo=' + boardNo;
        }
    </script>
</body>
</html>
