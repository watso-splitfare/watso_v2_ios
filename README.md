### 사용 라이브러리

- json_serializable,freezed : json 직렬화를 위한 라이브러리
- annotation : 코드 생성을 위한 라이브러리 > json_serializable,freezed,riverpod
- riverpod : 상태관리를 위한 라이브러리
- dio : http 통신 편하게..
- go_router : 라우팅 편하게..
- retrofit : http 통신을 편리하게 클래스화

### 폴더구조,패턴

mvvm 패턴을 기반으로 함
model,provider,view 형식

- common : 공통으로 사용되는 파일
    - 택시와 배달 공통으로 사용될 만한 파일
    - ex) user, router, 공통위젯
- model : 데이터 모델