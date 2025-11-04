# R-TEST-001

Spring MVC + MyBatis + Oracle 웹 애플리케이션

## 기술 스택

- **Java 1.8** (GraalVM 22 환경)
- **Spring Framework 4.3.18**
- **MyBatis 3.4.6**
- **Oracle Database 11g**
- **Apache Tomcat 8.5**
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

## Eclipse IDE 설정

Eclipse에서 프로젝트를 임포트하고 Tomcat 서버 설정을 완료하려면 **[ECLIPSE_SETUP.md](ECLIPSE_SETUP.md)** 파일을 참조하세요.

### 빠른 시작 (Gradle 임포트 완료 시)
Gradle 프로젝트로 임포트했지만 Tomcat에서 프로젝트가 안 보이는 경우:

1. 프로젝트 우클릭 → **Properties**
2. **Project Facets** → **Convert to faceted form...**
3. 다음 항목 체크:
   - ✅ **Dynamic Web Module** (3.1)
   - ✅ **Java** (1.8)
4. **Targeted Runtimes** → **Apache Tomcat v8.5** 체크
5. **Apply and Close**

이제 Tomcat 서버 설정에서 프로젝트를 찾을 수 있습니다.

## 설정 파일

- **환경 설정**: `src/main/resources/properties.xml`
- **Spring 설정**: `src/main/webapp/WEB-INF/spring/`
- **MyBatis 설정**: `src/main/resources/mybatis/`

## 데이터베이스 설정

Oracle 11g 데이터베이스를 사용합니다.

**중요**: 실제 데이터베이스 연결 정보는 `src/main/resources/properties.xml` 파일에 설정합니다.
- 자세한 설정 방법은 [SETUP_GUIDE.md](SETUP_GUIDE.md)를 참조하세요.
- `properties.xml.template` 파일을 복사하여 사용하세요.
