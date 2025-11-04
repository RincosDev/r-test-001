# R-TEST-001 프로젝트 설정 가이드

## 초기 설정

### 1. 데이터베이스 설정 파일 생성

보안을 위해 `properties.xml` 파일은 Git에 포함되지 않습니다. 
템플릿 파일을 복사하여 실제 값을 입력해주세요.

```bash
cp src/main/resources/properties.xml.template src/main/resources/properties.xml
```

### 2. 데이터베이스 정보 입력

`src/main/resources/properties.xml` 파일을 열어 다음 항목을 수정하세요:

```xml
<entry key="db.url">jdbc:oracle:thin:@실제호스트:실제포트:실제데이터베이스</entry>
<entry key="db.username">실제사용자명</entry>
<entry key="db.password">실제비밀번호</entry>
```

### 3. 게시판 테이블 생성

Oracle 데이터베이스(R-TEST 스키마)에 접속하여 다음 SQL을 실행하세요:

```sql
-- 게시판 시퀀스 생성
CREATE SEQUENCE SEQ_BOARD_NO
START WITH 1
INCREMENT BY 1
NOCACHE;

-- 게시판 테이블 생성
CREATE TABLE TB_BOARD (
    BOARD_NO NUMBER PRIMARY KEY,
    TITLE VARCHAR2(500) NOT NULL,
    CONTENT CLOB,
    WRITER VARCHAR2(100) NOT NULL,
    REG_DATE DATE DEFAULT SYSDATE,
    MOD_DATE DATE DEFAULT SYSDATE,
    VIEW_COUNT NUMBER DEFAULT 0
);

-- 인덱스 생성
CREATE INDEX IDX_BOARD_REGDATE ON TB_BOARD(REG_DATE DESC);

-- 테스트 테이블 (선택사항)
CREATE TABLE TB_TEST (
    TEST_ID VARCHAR2(50) PRIMARY KEY,
    TEST_NAME VARCHAR2(200),
    TEST_DESC VARCHAR2(1000),
    REG_DATE DATE DEFAULT SYSDATE
);
```

### 4. 프로젝트 빌드 및 실행

```bash
mvn clean install
mvn tomcat7:run
```

## 보안 주의사항

### 중요: properties.xml 파일 관리

- `properties.xml` 파일은 절대 Git에 커밋하지 마세요
- 이 파일에는 데이터베이스 자격 증명이 포함되어 있습니다
- `.gitignore`에 이미 추가되어 있습니다
- `properties.xml.template` 파일만 Git에 포함됩니다

### 프로덕션 환경

프로덕션 환경에서는 다음을 권장합니다:
1. 환경 변수를 통한 자격 증명 관리
2. 암호화된 설정 파일 사용
3. 시크릿 관리 서비스 (AWS Secrets Manager, HashiCorp Vault 등) 사용

## 문제 해결

### 1. Oracle JDBC 드라이버 오류
Maven이 Oracle JDBC 드라이버를 다운로드하지 못하는 경우:
- Maven Central에서 자동으로 다운로드되어야 합니다
- 문제가 있다면 ojdbc8.jar를 수동으로 다운로드하여 로컬 Maven 저장소에 설치하세요

### 2. Connection Pool 오류
데이터베이스 연결 문제가 있는 경우:
- `properties.xml`의 데이터베이스 정보가 정확한지 확인
- 방화벽에서 Oracle 포트(기본 1521)가 열려있는지 확인
- Oracle 서버가 실행 중인지 확인

### 3. Java 모듈 시스템 오류
`InaccessibleObjectException` 오류가 발생하는 경우:
- Workflow 명령에 `--add-opens` 플래그가 포함되어 있는지 확인
- 이미 설정되어 있어야 합니다
