# PERL: timestamp to date format
```perl
echo 1519643711 | perl -le 'use POSIX (strftime); printf (strftime ("%Y-%m-%d %H:%M:%S", localtime(<STDIN>)))'
  
# 2018-02-26 20:15:11
```
