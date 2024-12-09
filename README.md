# 프로젝트 소개 
오픈 API를 사용한 지도 및 현재위치 검색 어플 🧭
<br/><br/><br/>

<div align="center">
  <img src="https://github.com/user-attachments/assets/de764387-988e-4d93-823c-9a04b7cd3271" alt="기차 예매 서비스 예시 1" style="width: 80%; margin-bottom: 20px;" />
</div>

<br/><br/>

# 개발기간
2024.12.04~2024.12.09
<br/><br/>


# 개발환경
Flutter SDK: ^3.5.4
<br/><br/>


# 실행방법
flutter run
<br/><br/>


# 주요기능
### 기본
- Riverpod 라이브러리를 사용하여 MVVM 아키텍처 패턴을 적용
- AppBar의 title 속성 이용하여 TextField 위젯 배치 
- 네이버 오픈 API 이용하여 지역 검색 기능 구현
- flutter_inappwebview 라이브러리 사용하여 웹뷰 구현
- AppBar의 title 속성 이용해 TextField 위젯 배치한 이후, onSubmitted 속성에서 검색 기능을 호출

### 도전
- geolocator 패키지를 사용하아여 디바이스의 현재 좌표값 가져오기
- 가져온 현재 위도, 경도 값으로 Vworld 오픈 API에서 주소를 가져와 네이버 검색 API로 요청 


### 추가 
- 네이버 지도 API 사용하여 특정 주소 클릭 시 해당 좌표에 해당하는 곳 마커 표시 




  
  
