# 이미 존재하는 폴더에 Git 저장소 연결
```
git init
git remote add origin [저장소주소]
git branch --set-upstream-to=origin/master master
git pull
```
- 이때 저장소 주소를 https://[ID]@github.com/~ 형식으로 사용하면 푸시할때 매번 Username을 물어보지 않는다.

# Git 이메일 설정하기
- https://git-scm.com/book/ko/v1/%EC%8B%9C%EC%9E%91%ED%95%98%EA%B8%B0-Git-%EC%B5%9C%EC%B4%88-%EC%84%A4%EC%A0%95
```
git config --global user.name "이름"
git config --global user.email 이메일주소
```

# gitignore 파일 생성하기
- https://www.gitignore.io/

# 커밋 메시지 수정
```
git rebase -i HEAD~4

# 수정 하고자 하는 것 edit로 바꾸기
git commit --amend
# Author 를 바꾸고자 한다면
git commit --amend --author="jongpak <jplabs@jongpak.com>"

# 그이후에 아래 명령어로 계속 나아가면 됨
git rebase --continue
```
