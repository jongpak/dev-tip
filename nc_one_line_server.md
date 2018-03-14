# nc 한줄 서버

```bash
while true ; do nc -l -p 1500 -c 'echo -e "HTTP/1.1 200 OK\n\n$(date)"'; done
```
