# 정적 라이브러리 / 공유 라이브러리
* 정적 라이브러리(Static Library) & 공유 라이브러리(Shared Library)
    * http://sens.tistory.com/33
* 동적 라이브러리(shared library)와 Linker/Loader 이해하기
    * https://www.lesstif.com/pages/viewpage.action?pageId=12943542

## 1. 정적 라이브러리
* 컴파일된 오브젝트 파일들이 하나의 파일로 묶여있는 형태
* 장점
    * 수행 속도가 약간은 더 빠름
    * 실행파일에 포함되기 때문에 배포시 라이브러리를 따로 배포하지 않아도 됨
* 단점
    * 실행파일에 정적 라이브러리가 포함되기 때문에 결과물 사이즈가 큼
    * 라이브러리를 패치하려면 다시 컴파일 해야함 (만약 시스템 전반적으로 사용하는 라이브러리가 정적 컴파일되었다면...전부 다 해줘야함)
        * 그러한(유지보수) 이유로 공유 라이브러리를 권장

### libexam.h
```c
void libexam(char* str);
```

### libexam.c
```c
#include <stdio.h>

#include "libexam.h"

void libexam(char* str) {
	printf("%s", str);
}
```

### main.c
```c
#include "libexam.h"

int main(void) {
	libexam("TEST!!");

	return 0;
}
```

### 정적 라이브러리 컴파일 및 링크
모든 소스가 다 있다면 아래와 같이 컴파일이 가능
```bash
$ gcc -o main main.c libexam.c
```

하지만 정적라이브러리를 생성하고 이를 재사용하여 링크하려면 아래와 같이 함
```bash
# 오브젝트 파일 컴파일
$ gcc -c libexam.c
# 정적 라이브러리로 묶음
$ ar rsv libexam.a libexam.o

# 위에서 만든 정적라이브러리를 링크하여 컴파일
$ gcc -o main_static_lib main.c -L./ -lexam
```


## 2. 공유 라이브러리
* 한 라이브러리를 여러 프로그램들이 공유하는 방식
* 장점
    * 실행파일에 포함되지 않기 때문에 사이즈가 줄어듬
    * 라이브러리에 문제가 생겨 교체해야하면 해당 라이브러리 파일만 교체하면 됨
* 단점
    * 바이너리 배포시 공유 라이브러리 의존성도 신경써야함
    * 살짝 느림 (큰 문제는 되지 않음)

### 공유 라이브러리 컴파일 및 링크
* 코드는 위의 `libexam.h`, `libexam.c`, `main.c` 코드를 그대로 사용
```bash
# 코드 위치에 상관없이 사용될 수 있는 오브젝트 파일로 컴파일 (-fPIC)
$ gcc -fPIC -c libexam.c
# 컴파일된 오브젝트 파일을 동적 라이브러리를 사용하도록 하여 링크
#    -shared : 동적 라이브러리를 사용
#    -soname : 공유라이브러리의 이름을 지정
$ gcc -shared -Wl,-soname,libexam.so.0 -o libexam.so.0.0.0 libexam.o

# 컴파일시 사용될 so 파일의 심볼릭 링크 생성 (컴파일러에서 사용)
$ ln -s libexam.so.0.0.0 libexam.so
# 컴파일된 파일이 실행시 찾을 so 파일의 심볼링 링크 생성 (실행파일에서 사용)
$ ln -s libexam.so.0.0.0 libexam.so.0

# 실행파일 컴파일
$ gcc -o main main.c -L./ -lexam

# 실행 (공유라이브러리 폴더를 임의로 지정)
$ LD_LIBRARY_PATH=./ ./main
```


## 정적 라이브러리 / 공유 라이브러리 실행파일 비교
```
TODO
ls -al ..
```
