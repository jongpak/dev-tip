# MySQL

## 사용자 생성
```sql
CREATE USER '아이디'@'호스트' IDENTIFIED BY '비밀번호';
```

## 권한부여
```sql
GRANT [ALL/SELECT/INSERT ...] PRIVILEGES ON [DB명].[테이블명] TO '아이디'@'호스트';
FLUSH PRIVILEGES;
```

## 사용자 확인
```sql
SELECT host, user FROM mysql.user;
```
