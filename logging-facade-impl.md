# 로깅 파사드와 로깅 구현체

## 로깅 파사드
* 실제 구현은 아니고 interface들만 제공
* 실코드에서는 파사드를 사용하는 것이 좋음
    * 그래야 나중에 로깅 구현체 교체가 편리
* 대표적인 놈들
    * Apache Commons-logging
    * slf4j


## 로깅 구현체
* 실제 로깅을 담당
* 대표적인 놈들
    * logj4 / log4j2
    * logback
