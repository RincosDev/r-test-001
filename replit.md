# R-TEST-001 Project

## Overview
Spring MVC 웹 애플리케이션 프로젝트
- Java 기반의 엔터프라이즈 웹 애플리케이션
- MVC 패턴 구조 (Controller - Service - DAO - XML)
- Oracle 데이터베이스 연동

## 기술 스택

### Backend
- **Java**: GraalVM 22 (Java 1.8 호환)
- **Framework**: Spring Framework 4.3.18
- **ORM**: MyBatis 3.4.6
- **Database**: Oracle 11g Enterprise Edition
- **Server**: Apache Tomcat 7.0.47
- **Build Tool**: Maven

### Frontend
- **View**: JSP
- **Library**: jQuery 3.3.1
- **HTML/CSS/JavaScript**

## 프로젝트 구조

```
src/
├── main/
│   ├── java/com/rtest/
│   │   ├── controller/    # Spring MVC 컨트롤러
│   │   ├── service/       # 비즈니스 로직
│   │   ├── dao/          # 데이터 접근 계층
│   │   └── vo/           # Value Object
│   ├── resources/
│   │   ├── mybatis/
│   │   │   ├── mapper/   # MyBatis XML 매퍼
│   │   │   └── mybatis-config.xml
│   │   └── properties.xml # 환경 설정
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── spring/   # Spring 설정
│       │   ├── views/    # JSP 파일
│       │   └── web.xml
│       └── resources/    # 정적 리소스 (CSS, JS)
```

## 데이터베이스 연결 정보

**보안**: 데이터베이스 자격 증명은 `src/main/resources/properties.xml` 파일에 저장됩니다.
- 이 파일은 `.gitignore`에 추가되어 Git에 커밋되지 않습니다.
- `properties.xml.template` 파일을 복사하여 실제 값을 입력하세요.
- 자세한 설정 방법은 `SETUP_GUIDE.md`를 참조하세요.

**참고**: Oracle 11g Enterprise Edition 사용

## 실행 방법
프로젝트는 자동으로 Tomcat 서버에서 실행됩니다.
- URL: http://localhost:5000
- 서버 재시작: workflow를 다시 시작

## 주요 기능
- 홈 페이지 (`/`)
- 테스트 목록 조회 (`/test/list`)
- 데이터 추가 (`/test/add` - POST)

## Recent Changes
- **November 4, 2025**: 프로젝트 초기 설정 완료
  - Spring MVC + MyBatis + Oracle 구조 구축
  - Tomcat 7 서버 설정
  - 샘플 Controller, Service, DAO, Mapper 생성
  - JSP 뷰와 jQuery 통합

## User Preferences
- 설정 파일: properties.xml 사용
- MVC 구조: Controller → Service → DAO → XML Mapper
- View: JSP + HTML + jQuery (필요시 JavaScript)
- Server: Tomcat 7.0

## Environment
- Replit NixOS (stable-25_05 channel)
- GraalVM 22.3 with Java 모듈 시스템 호환성 설정
