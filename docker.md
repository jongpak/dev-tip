# 도커 운영
## 도커 설치
```
wget -o ./docker_install.sh https://get.docker.com/
chmod +x ./docker_install.sh
sh ./docker_install.sh
```


## 도커 실행
```
service docker start
```


## 이미지 다운로드
- https://hub.docker.com/ 에서 검색 후 이미지 선택 (official 이미지들이 있음)

```
docker pull mysql:latest
docker images					# 현재 호스트에 있는 이미지 목록 확인
```


## 이미지 목록 보기
```
docker images
```


## sudo 없이 도커 명령 수행하기
```
usermod -aG docker ${USER}
service docker restart
```
이후 로그아웃 또는 리부팅하면 됨


## 이미지 실행 (컨테이너 생성)
```
docker run -i -t --name mysql-local mysql /bin/bash
```
- 옵션 -i : interactive
- 옵션 -t : pseudo-tty
- 옵션 --name : 컨테이너 이름 설정 (설정 안하면 자동 생성)
- 옵션 -p IN_PORT:OUT_PORT 를 추가하면 컨테이너의 IN_PORT포트가 호스트의 OUT_PORT 로 매핑된다.


## 이미지와 컨테이너의 차이
- 이미지가 실행된 놈이 컨테이너다.
- 실행파일과 실행 중인 프로세스의 차이라고 생각하면 된다.


## 컨테이너 목록보기
```
docker ps
```
-a 옵션 붙이면 정지된 컨테이너 목록도 볼 수 있음.


## 이미지 재실행
```
docker start mysql-local
```


## 이미지 접속
```
docker attach mysql-local
```

## 이미지 중단 없이 쉘에서 빠져나오기
exit, Ctrl+D 를 누르면 컨테이너가 정지하며 (당연히 컨테이너가 정지되니) 빠져나오지만,
**Ctrl+P, Ctrl+Q 를 차례대로 입력하면 컨테이너 중지없이 빠져나온다.**


## 컨테이너 외부에서 컨터이너로 명령 실행하기
```
docker exec mysql-local echo "test"
```


## 컨테이너 정지
```
docker stop mysql-local
```


## 컨테이너 삭제
```
docker rm mysql-local
```


## 이미지 삭제
```
docker rmi mysql:latest
```


## 호스트 경로와 연동
docker run -i -t -p 3306:3306 -v ~/dev:/home/web/dev --name mysql-local mysql /bin/bash
- 옵선 -v HOST_PATH:CONTAINER_PATH: 호스트 경로와 컨테이너 경로를 연결한다


## 도커 네트워크 구조
- http://bluese05.tistory.com/15



# 도커 이미지 만들기

## Dockerfile 파일 작성

