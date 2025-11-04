<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>테스트 목록 - R-TEST-001</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>테스트 목록</h1>
            <a href="${pageContext.request.contextPath}/" class="btn-back">홈으로</a>
        </div>
        
        <div class="content">
            <c:if test="${not empty error}">
                <div class="error-box">
                    <p>${error}</p>
                </div>
            </c:if>
            
            <div class="form-section">
                <h3>새 항목 추가</h3>
                <form id="addForm">
                    <div class="form-group">
                        <label for="testId">ID:</label>
                        <input type="text" id="testId" name="testId" required>
                    </div>
                    <div class="form-group">
                        <label for="testName">이름:</label>
                        <input type="text" id="testName" name="testName" required>
                    </div>
                    <div class="form-group">
                        <label for="testDesc">설명:</label>
                        <textarea id="testDesc" name="testDesc" rows="3"></textarea>
                    </div>
                    <button type="submit" class="btn">추가</button>
                </form>
            </div>
            
            <div class="table-section">
                <h3>목록</h3>
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>이름</th>
                            <th>설명</th>
                            <th>등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty testList}">
                                <c:forEach var="test" items="${testList}">
                                    <tr>
                                        <td>${test.testId}</td>
                                        <td>${test.testName}</td>
                                        <td>${test.testDesc}</td>
                                        <td>${test.regDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="no-data">
                                        데이터가 없습니다. 
                                        <br><small>(테이블이 없거나 DB 연결을 확인해주세요)</small>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <script>
        $(document).ready(function() {
            $('#addForm').on('submit', function(e) {
                e.preventDefault();
                
                $.ajax({
                    url: '${pageContext.request.contextPath}/test/add',
                    type: 'POST',
                    data: $(this).serialize(),
                    success: function(response) {
                        var result = JSON.parse(response);
                        alert(result.message);
                        if(result.success) {
                            location.reload();
                        }
                    },
                    error: function() {
                        alert('오류가 발생했습니다.');
                    }
                });
            });
        });
    </script>
</body>
</html>
