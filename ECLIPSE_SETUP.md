# Eclipse 프로젝트 설정 가이드

## 1단계: Gradle 프로젝트 임포트

### 방법 A: Buildship 플러그인 사용 (권장)
1. Eclipse 실행
2. **File → Import → Gradle → Existing Gradle Project**
3. 프로젝트 루트 디렉토리 선택
4. **Next** → **Finish**

### 방법 B: Eclipse 프로젝트로 임포트
1. 터미널에서 실행:
   ```bash
   ./gradlew cleanEclipse eclipse
   ```
2. Eclipse에서:
   **File → Import → General → Existing Projects into Workspace**
3. 프로젝트 루트 디렉토리 선택
4. **Finish**

---

## 2단계: Dynamic Web Project 설정 확인

### Project Facets 확인
1. 프로젝트 우클릭 → **Properties**
2. **Project Facets** 선택
3. 다음 항목이 체크되어 있는지 확인:
   - ✅ **Dynamic Web Module** (3.1)
   - ✅ **Java** (1.8)

4. 체크되어 있지 않다면:
   - **Convert to faceted form...** 클릭
   - 위 항목들 체크
   - **Apply and Close**

### Deployment Assembly 확인
1. 프로젝트 우클릭 → **Properties**
2. **Deployment Assembly** 선택
3. 다음 항목들이 있는지 확인:
   - `src/main/java` → `WEB-INF/classes`
   - `src/main/resources` → `WEB-INF/classes`
   - `src/main/webapp` → `/`
   - Gradle Dependencies → `WEB-INF/lib`

4. 없다면 **Add** 버튼으로 추가

---

## 3단계: Tomcat 서버 런타임 설정

### Tomcat 런타임 추가
1. 프로젝트 우클릭 → **Properties**
2. **Targeted Runtimes** 선택
3. **Apache Tomcat v8.5** 체크
   - 없다면 **New** 클릭:
     - Tomcat 8.5 선택
     - Tomcat 설치 디렉토리 지정
     - **Finish**
4. **Apply and Close**

### Tomcat 서버에 프로젝트 추가
1. **Servers** 탭 열기 (없으면 **Window → Show View → Servers**)
2. 서버 더블클릭 또는 우클릭 → **Add and Remove**
3. **r-test-001** 프로젝트를 **Configured** 항목으로 이동
4. **Finish**

---

## 4단계: 서버 설정

### Server.xml 포트 확인
1. Servers 탭에서 Tomcat 서버 더블클릭
2. **Ports** 섹션 확인:
   - **HTTP/1.1**: 5000 (또는 8080)
3. 저장 (Ctrl+S)

### Context Root 확인
1. 프로젝트 우클릭 → **Properties**
2. **Web Project Settings** 선택
3. **Context root**: `/` (루트 경로)
4. **Apply and Close**

---

## 5단계: 서버 시작

### Tomcat 서버 실행
1. **Servers** 탭에서 Tomcat 서버 선택
2. 시작 버튼 클릭 (▶️) 또는 우클릭 → **Start**
3. **Console** 탭에서 로그 확인

### 웹 애플리케이션 접속
- URL: **http://localhost:5000** (또는 설정한 포트)
- 게시판: **http://localhost:5000/board/list**

---

## 문제 해결

### 프로젝트가 Tomcat에 안 보이는 경우
1. **Project Facets**에서 **Dynamic Web Module** 활성화 확인
2. **Targeted Runtimes**에 Tomcat 추가 확인
3. Eclipse 재시작 후 다시 시도

### 404 오류가 나는 경우
1. **Context root**가 `/`로 설정되어 있는지 확인
2. Tomcat 서버 우클릭 → **Clean**
3. 프로젝트 우클릭 → **Clean**
4. 서버 재시작

### ClassNotFoundException 오류
1. 프로젝트 우클릭 → **Gradle → Refresh Gradle Project**
2. 프로젝트 우클릭 → **Maven → Update Project** (해당되는 경우)
3. 서버 Clean 후 재시작

### 변경사항이 반영되지 않는 경우
1. 서버 설정에서 **Publishing** 확인:
   - **Automatically publish when resources change** 체크
2. 프로젝트 Clean
3. 서버 Restart

---

## Gradle 빌드 명령어

```bash
# 프로젝트 빌드
./gradlew clean build

# Eclipse 설정 파일 재생성
./gradlew cleanEclipse eclipse

# Tomcat 서버 실행 (독립 실행)
./gradlew appRun
```

---

## 참고사항

- **Java 버전**: JDK 1.8 사용
- **서버 포트**: 5000 (기본값)
- **Context Path**: `/` (루트)
- **WAR 파일 이름**: r-test-001.war
- **빌드 출력**: `build/libs/` 디렉토리

프로젝트 설정 완료 후 Eclipse에서 Tomcat을 통해 개발 및 디버깅이 가능합니다.
