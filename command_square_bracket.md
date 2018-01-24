# [ 명령어
* 리눅스에는 `[` 명령어가 있다..

```
root@f3b70a2804df:~# which [
/usr/bin/[
root@f3b70a2804df:~# /usr/bin/[ -f test ]; echo $?
0
root@f3b70a2804df:~# /usr/bin/[ -f notfound ]; echo $?
1
```
