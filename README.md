# R-TEST-001

Spring MVC + MyBatis + Oracle 웹 애플리케이션

## 기술 스택

- **Java 1.8** (GraalVM 22 환경)
- **Spring Framework 4.3.18**
- **MyBatis 3.4.6**
- **Oracle Database 11g**
- **Apache Tomcat 7.0**
- **jQuery 3.3.1**

## 프로젝트 구조

```
MVC 패턴: Controller → Service → DAO → MyBatis XML Mapper
```

## 빌드 및 실행

```bash
./gradlew clean build
./gradlew appRun
```

서버: http://localhost:5000

## Eclipse IDE 임포트

### 방법 1: Buildship 플러그인 사용 (권장)
1. Eclipse IDE 실행
2. **File → Import → Gradle → Existing Gradle Project**
3. 프로젝트 루트 디렉토리 선택
4. Finish 클릭

### 방법 2: 생성된 프로젝트 파일 사용
1. Eclipse 프로젝트 파일 생성:
   ```bash
   ./gradlew eclipse
   ```
2. Eclipse IDE에서 임포트:
   **File → Import → General → Existing Projects into Workspace**
3. 프로젝트 루트 디렉토리 선택
4. Finish 클릭

**참고**: build.gradle 변경 후 Eclipse에서 **프로젝트 우클릭 → Gradle → Refresh Gradle Project** 실행

## 설정 파일

- **환경 설정**: `src/main/resources/properties.xml`
- **Spring 설정**: `src/main/webapp/WEB-INF/spring/`
- **MyBatis 설정**: `src/main/resources/mybatis/`

## 데이터베이스 설정

Oracle 11g 데이터베이스를 사용합니다.

**중요**: 실제 데이터베이스 연결 정보는 `src/main/resources/properties.xml` 파일에 설정합니다.
- 자세한 설정 방법은 [SETUP_GUIDE.md](SETUP_GUIDE.md)를 참조하세요.
- `properties.xml.template` 파일을 복사하여 사용하세요.
