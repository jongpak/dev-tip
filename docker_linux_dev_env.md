# 도커를 이용한 리눅스 개발환경 세팅
* 아주 급히(간단히) 리눅스 환경이 필요할때
    * 다만, 상태 보존이 안됨. (volume 옵션 사용해야함)
    * 즉, 컨테이너 정지했다가 다시 실행하면 상태 초기화
    * 제대로 사용하려면 dockerfile 만들어서 세팅이 필요

```bash
docker run --rm -it ubuntu:16.04 /bin/bash
```

* gcc 이미지 : https://hub.docker.com/_/gcc/
