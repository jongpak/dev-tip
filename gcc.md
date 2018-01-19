# GCC
* the GNU Compiler Collection


## C코드 컴파일과정
1. **cpp0 : 전처리기**
    * 전처리된 `.i` 파일 생성
2. **cc1 : C컴파일러**
    * 어셈블로 변환된 `.s` 파일 생성
3. **as : 어셈블러**
    * 오브젝트 `.o` 파일 생성
4. **ld / collect2 : 링커**
    * elf 실행파일 생성


## 간단한 컴파일
```
# gcc [options...] file
$ gcc -v -DDEBUG -Wall -W -O2 -I~/work/include -L~/work/lib -o test test.c
```


## 컴파일된 ELF 헤더확인
```
$ readelf --all test
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x400455
  Start of program headers:          64 (bytes into file)
  Start of section headers:          6592 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         9
  Size of section headers:           64 (bytes)
  Number of section headers:         30
  Section header string table index: 27
...
```


## gcc 옵션
* `-E`
    * 전처리 과정의 결과를 출력
    * `--save-temps` 옵션을 사용하여 `*.i` 파일을 보는 것이 좀 더 편함
* `-S`
    * `cc1`으로 전처리된 파일을 어셈블리 파일까지만 생성
    * 이 옵션을 주고 컴파일하면 어셈블리파일 `*.s` 파일이 생성
* `-c`
    * `as` 어셈블러에 의해 어셈블리 파일을 컴파일까지만 생성
    * 이 옵션을 주고 컴파일하면 오브젝트(목적)파일 `*.o` 파일이 생성
* `-v`
    * verbose
* `--save-temps`
    * 중간파일인 전처리파일(`*.i`)과 어셈블리파일(`*.s`)파일을 지우지 않음


## cpp0 (전처리기) 옵션
* `-I[경로]`
    * 헤더파일 탐색 디렉토리 추가
    * `-I/home/jongpak/dev/include`
* `-D[매크로]`
    * 전처리시 매크로를 define
    * `#define X` 를 한 효과
* `-D[매크로]=[값]`
    * 전처리시 매크로를 define
    * `#define X Y` 를 한 효과
* `-U[매크로]`
    * `-D`의 반대효과
    * `#undef X` 를 한 효과
* `-M`, `-MM`
    * 코드의 종속파일 목록을 보여줌 : Makefile 만들때 유용함
      ```
      $ gcc -M test.c
      test.o: test.c /usr/include/stdc-predef.h /usr/include/stdio.h \
       /usr/include/features.h /usr/include/sys/cdefs.h \
       /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
       /usr/include/gnu/stubs-64.h \
       /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stddef.h \
       /usr/include/bits/types.h /usr/include/bits/typesizes.h \
       /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
       /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdarg.h \
       /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
      $ gcc -MM test.c
      test.o: test.c
      ```
* `-nostdinc`
    * 디폴트 include 디렉토리(/usr/include 등)에서 헤더파일을 탐색하지 않음
    * `-I` 옵션으로 준 디렉토리에서만 탐색
* `-C`
    * 전처리 과정에서 주석을 남겨둠
* `-Wp,[옵션]`
    * gcc 옵션이 아닌 cpp0 옵션으로 전달


## cc1 (C컴파일러) 옵션
* `-std=[c89/c99/..]`
    * C 문법을 선택
*  `-W`, `-Wall`
    * `-Wall` : 모호한 문법에 대한 경고 출력
    * `-W` : 합법적이지만 모호한(?) 코드에 대한 부가정보 출력
    * 특정 경고를 출력하지 않으려면 `-Wno-unused-variable` 등과 같이 사용
    * 또는 특정 경고를 출력하려면 `-Wunused-variable` 등과 같이 사용
* `-w`
    * 모든 경고 출력 안함 (`-W`의 반대)
* `-Werror`
    * 경고를 에러처럼 취급 : 경고 발생시 에러로써 컴파일 중단
* `-O0`, `-O1`, `-O2`, `-O3`
    * `-O0` : 최적화 하지 않음
    * `-O1` : 1단계 최적화
    * `-O2` : 2단계 최적화 (가장 많이 사용하는 최적화 옵션)
    * `-O3` : 3단계 최적화 (잘 쓰지 않음)
    * `-Os` : 사이즈 최적화 (주로 임베디드)
* `-g`
    * 디버깅 정보 포함
    * 디버거에서 제공할 디버깅 심볼도 포함
    * `objdummp -S file` 로 코드심볼 확인 가능 (코드가 나옴)
* `-pg`
    * 프로파일링 코드 삽입
    * 이 옵션을 주고 컴파일된 파일을 실행하면 gmon.out이 생성됨.
    * gmon.out 파일은 gprof 로 확인하면 함수 호출시간 등 분석가능


## as (어셈블러) 옵션
* `-Wa,[옵션]`
    * gcc 옵션이 아닌 as 옵션으로 전달
    * `-al` : 어셈블된 instruction 출력
    * `-as` : 정의된 심볼 출력
    * `-I[경로]` : include 디렉토리 지정 (C파일이 아닌 어셈블 인클루드 파일)
    * `-march=[아키텍쳐]` : 해당 아키텍처로 어셈블리함


## collect2 / ld (링커) 옵션
* `-L[라이브러리 디렉토리]`
    * 라이브러리(`*.a`) 디렉토리를 지정
* `-l[라이브러리 이름]`
    * 같이 링크할 라이브러리 이름
    * libc 일 경우 c, libm 일 경우 m
* `-shared`
    * 공유 라이브러리와 정적 라이브러리가 있을 경우 공유 라이브러리를 우선시하여 링크 (기본값)
* `-static`
    * `-shared`의 반대
* `-nostdlib`
    * 표준 C 라이브러리를 사용하지 않음 (주로 OS/부트로더/디바이스 드라이버 컴파일할때 사용함)
* `-nostartfiles`
    * crt1.o 같은 스타트업 파일 링크하지 않음 (주로 OS/부트로더/디바이스 드라이버 컴파일할때 사용함)
* `-Wl,[링크옵션]`
    * gcc 옵션이 아니라 링커에게 옵션을 전달
    * `-s` : 실행파일에서 심볼 테이블 제거
    * `-M` : 심볼 정보를 자세하게 출력
