# TCP keep-alive와 HTTP keep-alive

* HTTP Keep Alive and TCP keep alive
    * https://stackoverflow.com/questions/9334401/http-keep-alive-and-tcp-keep-alive
* TCP Keep-Alive 퀵 정리
    * https://beyondj2ee.wordpress.com/2014/01/27/tcp-keep-alive-%ED%80%B5-%EC%A0%95%EB%A6%AC/
* Wire Shake를 통해 본 Keep-Alive 처리 과정
    * http://mohwaproject.tistory.com/entry/Wire-Shake%EB%A5%BC-%ED%86%B5%ED%95%B4-%EB%B3%B8-KeepAlive-%EC%B2%98%EB%A6%AC-%EA%B3%BC%EC%A0%95
* tcp keepalive와 nginx keepalive
    * https://brunch.co.kr/@alden/9
* TCP Keepalive HOWTO
    * http://tldp.org/HOWTO/TCP-Keepalive-HOWTO/overview.html
* HTTP/1.x의 커넥션 관리
    * https://developer.mozilla.org/ko/docs/Web/HTTP/Connection_management_in_HTTP_1.x

## TCP keep-alive
* 두 단말간 TCP 커넥션이 맺여져있을때, **TCP단에서 (커널단이라고 봐도 괜찮을듯) 주기적으로 ping-pong 패킷을 날려서 상대방이 살아있는지 확인하는 것**
* 만약 상대방이 죽었다고 판단되면 TCP 커넥션을 정리함


## HTTP keep-alive
* **TCP keep-alive 와는 완전히 다름**
* 기본 HTTP의 동작은 요청-응답후에 TCP 커넥션을 close 하지만 HTTP keep-alive 를 사용하면 요청-응답 후에 바로 TCP 커넥션을 close 하지 않음
* 즉, 한 TCP 커넥션을 통해서 여러 요청-응답을 할수 있음
* **TCP 3-Way handshake 등 커넥션 비용을 줄이기 위한 목적**
