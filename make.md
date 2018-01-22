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
