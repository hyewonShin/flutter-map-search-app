# 프로젝트 소개 
오픈 API를 사용한 현재 위치 및 지역 검색 어플입니다 🧭
<br/><br/><br/>

<div align="center">
  <img src="https://github.com/user-attachments/assets/e4393037-80c7-4a69-a867-1ffc45b3b4d6" alt="기차 예매 서비스 예시 1" style="width: 80%; margin-bottom: 20px;" />
</div>

<br/><br/>

# 개발기간
2024.12.04~2024.12.09
<br/><br/>

# 기술 스택
- Framework: Flutter(SDK: ^3.5.4)
- Language: Dart
- State Management: Riverpod
<br/><br/>

# 사용 라이브러리 
- flutter_riverpod
  - Flutter 앱에서 위젯의 상태 관리를 담당하는 라이브러리.
  - 선언적이고 테스트 가능한 상태 관리 방식 제공.   
- flutter_inappwebview
  - Flutter 앱에서 In-App WebView를 사용하도록 지원하는 라이브러리.
- dio
  - Flutter 앱에서 사용되는 HTTP 클라이언트 라이브러리.
  - REST API 통신, 요청 헤더 관리, JSON 직렬화 등 네트워킹 기능 제공.
- geolocator
  - Flutter 앱에 위치 기반 기능을 제공하는 라이브러리.
  - 현재 위치 추적, 거리 계산, GPS 기반 기능 구현 가능.
<br/><br/>


# 주요기능
### 필수
- Riverpod 라이브러리로 MVVM 아키텍처 적용
  - Riverpod을 활용해 MVVM 아키텍처를 적용하여 구조를 명확히 하고, 상태 관리 및 의존성 주입을 간소화하여 유지보수와 확장성을 향상시킴.
  - MVVM 패턴을 통해 비즈니스 로직과 UI 로직을 독립적으로 관리하고, Riverpod을 사용해 상태를 효율적으로 관리하며 UI를 자동으로 업데이트.

- 네이버 오픈 API로 지역 검색 기능 구현
  - 네이버 오픈 API를 이용하여 사용자가 입력한 지역 정보를 검색하고, 실시간으로 데이터를 UI에 표시함.

- flutter_inappwebview로 웹뷰 구현
  - flutter_inappwebview 라이브러리를 사용하여 특정 주소의 사이트를 웹 형식으로 표시할 수 있도록 웹뷰 기능을 구현.
    
### 도전
- Geolocator 패키지를 사용하여 디바이스의 현재 위도와 경도 값을 실시간으로 가져옴.   
- 가져온 좌표값(위도, 경도)을 Vworld 오픈 API에 전달해 주소를 조회하고, 이를 바탕으로 네이버 지역 검색 API로 추가 정보를 요청하여 표시. 


### 추가 
- 네이버 지도 API를 사용하여 특정 주소를 클릭하면 해당 좌표에 마커를 표시하여 사용자가 위치를 쉽게 확인할 수 있도록 구현.
<br/><br/>
  

# 👀 설치 및 실행
### 1. Flutter 설치
Flutter가 설치되어 있어야 해당 프로젝트를 실행할 수 있습니다. [Flutter 설치 가이드](https://docs.flutter.dev/get-started/install)를 참고하세요.

- 프로젝트 clone
```
git clone https://github.com/hyewonShin/flutter-map-search-app.git
```
- 의존성 설치
```
flutter pub get
```






  
  
