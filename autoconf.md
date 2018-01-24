* 빌드 이식성을 위한 빌드 설정 자동화 도구
    * https://devmanual.gentoo.org/general-concepts/autotools/index.html
    * http://oopsoopskeke.tistory.com/entry/Autoconf%EC%99%80-Automake
```
$ ./configure
$ make
$ make install
```

## 개요
1. `configure.ac` 파일 작성
    * 필요한 빌드 설정들을 기술
    * 컴파일러 체크 / 라이브러리 체크 / 함수 체크 / 여러 환경 체크
    * configure 스크립트를 만들기 위한 재료
2. `Makefile.in` 파일 작성
    * `Makefile` 을 생성하기 위한 템플릿
3. `autoconf` 명령어를 수행하면 `configure` 스크립트 파일이 생성
4. `configure` 스크립트를 실행하면 `Makefile.in` 템플릿 파일로부터 `Makefile` 생성
