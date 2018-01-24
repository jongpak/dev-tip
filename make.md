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
