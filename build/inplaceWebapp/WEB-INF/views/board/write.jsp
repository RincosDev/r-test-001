<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
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
    </style>
</head>
<body>
    <div class="board-container">
        <h1>게시글 작성</h1>
        
        <div class="board-form">
            <form id="boardForm">
                <div class="form-group">
                    <label for="title">제목 <span style="color: red;">*</span></label>
                    <input type="text" id="title" name="title" required maxlength="500">
                </div>
                
                <div class="form-group">
                    <label for="writer">작성자 <span style="color: red;">*</span></label>
                    <input type="text" id="writer" name="writer" required maxlength="100">
                </div>
                
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea id="content" name="content"></textarea>
                </div>
                
                <div class="form-footer">
                    <button type="submit" class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/list'">취소</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#boardForm').submit(function(e) {
                e.preventDefault();
                
                var title = $('#title').val().trim();
                var writer = $('#writer').val().trim();
                
                if(!title) {
                    alert('제목을 입력해주세요.');
                    $('#title').focus();
                    return false;
                }
                
                if(!writer) {
                    alert('작성자를 입력해주세요.');
                    $('#writer').focus();
                    return false;
                }
                
                $.ajax({
                    url: '${pageContext.request.contextPath}/board/write',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        if(response.success) {
                            alert(response.message);
                            location.href = '${pageContext.request.contextPath}/board/list';
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function() {
                        alert('등록 중 오류가 발생했습니다.');
                    }
                });
            });
        });
    </script>
</body>
</html>
