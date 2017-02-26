# 페도라 25 설정

## 설치 후 유틸리티
- gnome-tweak-tool
- Simple dock
- Workspace switcher popup thumbnails
- Coverflow alt-tab
- Pixel saver
- Taskbar
- Topicons plus: 트레이 아이콘

## 한/영키
- gnome-tweak-tool-[입력]-[한국어 한/영, 한자 키]-[오른쪽 Alt키를 한/영, 오른쪽 Ctrl키를 한자키로] 설정

## 테마
- GTK+: VimixLight-Laptop-Doder
- 아이콘: Vibrancy-NonMono-Light-Blue
- 쉘테마: VimixLight-Laptop-Doder



## 개발 도구

### 이클립스 호환성
wayland와 호환성 문제가 있어 다음과 같이 하면 잘됨.
```
export GDK_BACKEND=x11
./eclipse
```

## 팀뷰어
rpm 버전 설치하면 

## OpenJDK 설치
OpenJDK는 기본적으로 설치되어있는데, JRE만 설치가 되어있다. 다음 명령어로 JDK도 설치해주면 된다.
yum install java-1.8.0-openjdk-devel
