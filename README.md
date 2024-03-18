### 사용 라이브러리

- json_serializable,freezed : json 직렬화를 위한 라이브러리
- annotation : 코드 생성을 위한 라이브러리 > json_serializable,freezed,riverpod
  처음 사용시 빌드를 해야함

```
flutter pub run build_runner build
flutter pub run build_runner watch
```

- riverpod : 상태관리를 위한 라이브러리
- dio : http 통신 편하게..
- go_router : 라T우팅 편하게..
- retrofit : http 통신을 편리하게 클래스화

### 폴더구조,패턴

mvvm 패턴을 기반으로 함
model,provider,view 형식

- common : 공통으로 사용되는 파일
    - 택시와 배달 공통으로 사용될 만한 파일
    - ex) user, router, 공통위젯
- model : 데이터 모델

### commit

#### type

- feat: 새로운 기능 추가
- fix: 버그 수정
- docs: 문서 수정
- design: CSS 등 사용자 UI 디자인 변경
- style: 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
- refactor: 코드 리펙토링
- test: 테스트 코드, 리펙토링 테스트 코드 추가
- chore: 빌드, 관리(페키지메니저 등)

#### 형식

```
<type><break or not>: <subject>
<BLANK LINE>
<body>
<BLANK LINE>
```

단 body를 적지 않아도 됨.

### 페이지 개발시

redirect, refreshListenable을 주석처리하시고,
Routes와 _routes에 경로 추가하시고 원하시는 페이지를 initialLocation으로 지정해서 개발하시면 됩니다!