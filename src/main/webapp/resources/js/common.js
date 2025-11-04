$(document).ready(function() {
    console.log('R-TEST-001 Application Ready');
    
    // 공통 함수들
    window.RTest = {
        // Ajax 공통 처리
        ajax: function(url, data, success, error) {
            $.ajax({
                url: url,
                type: 'POST',
                data: data,
                success: success || function(response) {
                    console.log('Success:', response);
                },
                error: error || function(xhr, status, err) {
                    console.error('Error:', err);
                    alert('오류가 발생했습니다.');
                }
            });
        },
        
        // 확인 메시지
        confirm: function(message, callback) {
            if(confirm(message)) {
                callback();
            }
        }
    };
});
