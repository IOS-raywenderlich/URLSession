# URLSession

- URLSession은 요청을 보내고 받는 주요 개체이다.
- URLSession은 HTTP 및 HTTPS 기반 요청을 처리하기 위한 클래스이자 클래스 모음이다.

## URLSession은 4가지 세션 타입을 가지고 있다.

- Shared Session
    - Default Configuraion + Completion Handler
    - 별도의 커스터마이징 없이 기본 설정을 사용하고 Completion Handler로 최종 결과를 전달 받는다.
    - 구현이 단순하지만, 백그라운드 전송 지원 X
- Default Session
    - Defalut Configuration / Custom Configuration + Completion Handler / Delegation + Response Caching(Disk & Memory)
    - 디스크 유지 글로벌 캐시, 자격 증명 및 쿠키 저장소 개체를 사용하는 기본 구성 개체를 만듭니다.
- Ephemeral Session
    - Defalut Configuration / Custom Configuration + Completion Handler / Delegation + Response Caching(Disk & **Memory only**)
- Background Session 
    - Defalut Configuration / Custom Configuration + Delegation + Background Transfer
    - 세션이 백그라운드에서 `업로드` 또는 `다운로드` Task를 수행할 수 있다.
    - 시스템에서 앱을 중단 또는 종료한 경우에도 전송이 계속된다.


위에 `Session`을 생성 했다면 `Task`를 생성해야한다.

## Task

Task는 URLSession을 통해 요청하는 개별 요청이다.
구체적인 session task 4 가지가 있다.