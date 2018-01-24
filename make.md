* Make 기반 빌드 시스템
  * http://developinghappiness.com/?page_id=222
* GNU Make 강좌
  * http://wiki.kldp.org/KoreanDoc/html/GNU-Make/GNU-Make.html
* gcc와 make 강좌
  * http://wiki.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make.html

## make 초간단 정리
* make 명령에서 규칙이름이 주어지지 않는다면 Makefile 에서 가장 처음있는 규칙을 사용함 (아래의 경우 all)
```make
CC = gcc
CFLAGS = -W -Wall
TARGET=test

all: $(TARGET)

$(TARGET) : test.o
	$(CC) $(CFLAGS) -o $@ $^

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o $(TARGET)
```

## 자동메크로
| 기호 | 설명 |
| --- | --- |
| $@  | 현재 타켓의 이름 |
| $?  | 현재 타겟보다 갱신된 의존성 목록 (확장자 규칙에서 사용불가) |
| $^  | 현재 타겟의 의존성 목록 (확장자 규칙에서 사용불가) |
| $<  | 현재 타겟보다 갱신된 의존성 목록 (확장자 규칙에서만 사용가능) |
| $*  | 현재 타겟의 의존성 목록 (확장자 규칙에서만 사용가능) |
| $%  | 현재 타겟이 라이브러리 모듈일때, .o 파일에 대응되는 이름 |
| $(@F) | 현재 타겟의 파일명 |
| $(@D) | 현재 타겟의 디렉토리 경로 부분 |
| $(<F) | 현재 타겟의 의존성의 파일명 |
| $(<D) | 현재 타겟의 의존성의 디렉토리 경로 부분 |

### 자동 메크로 예제
```make
test: 1.txt
	@echo "현재 타겟:" $@
	@echo "의존성 목록:" $?
	@echo "======================"
	@cat $?
 
1.txt:
	@echo "TEST" > $@
```
실행결과
```
현재 타겟: test
의존성 목록: 1.txt
======================
TEST
```

## 매크로 와일드카드 확장
```make
SRCS = $(whildcard *.c)
OBJS = $(SRCS:.c=.o)

all: test

test: $(OBJS)
	$(CC) -o $@ $^
```

## 명령어 사용 규칙
* 각각의 명령어들은 **새로운 쉘**에서 실행됨
따라서 아래처럼 사용하면 현재 디렉토리의 모든 파일이 삭제됨 (`cd` 명령 따로 `rm` 명령따로 서로 다른 쉘에서 실행되기 때문)
```make
del:
	cd ./backup
	rm -rf *
```
그래서 다음과 같이 `;` 사용하면 되길 되는데, 문제는 `cd ./backup` 명령이 실패할 경우(backup 폴더가 없을경우) 현재 디렉토리의 모든 파일이 삭제됨
```make
del:
	cd ./backup; rm -rf *
```
따라서 다음과 같이 `&&` 를 사용하면 됨
```make
del:
	cd ./backup && rm -rf *
```

## 명령어 출력 안하기
* 기본적으로 표준 출력으로 실행되는 명령어도 같이 출력되는데, 앞에 `@`를 붙이면 실행되는 명령어는 보이지 않음 (즉, 명령어 실행결과만 출력)
```make
echo:
	@echo "test!"
```

## 명령어 실패하더라도 무시하기
* make는 명령의 종료상태코드(Exit status code)가 0이 아니라면 이후 동작을 수행하지 않고 실패로 종료하게 되지만
* 앞에 `-` 를 붙이면 명령어가 실패하더라도 계속 진행함
```make
skipable:
	-cat temp.txt
```

## 재귀적 make 사용
각 폴더내의 Makefile
```make
OBJS   = $(patsubst %c, %o, $(wildcard *.c))
CFLAGS = -I../include

all: $(OBJS)
	cp -rf $^ ../

clean:
	rm -rf *.c
```

상위 디렉토리의 Makefile
* DIRS를 순회하며 재귀적 make
```make
DIRS   = lib1 lib2 main
OBJS   = lib1.o lib2.o main.o
TARGET = myapp

all: objects
	@for dir in $(DIRS); do \
	make -C $$dir || exit $?; \
	done
	
clean:
	@for dir in $(DIRS); do \
	make -C $$dir clean \
	done \
	-rm -rf *.o $(TARGET)
```
