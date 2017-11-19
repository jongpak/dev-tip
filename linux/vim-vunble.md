# Vundle.vim
* vim의 플러그인 매니저

## 설치
### Vundle.vim 설치
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

### .vimrc 수정
```bash
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
```

## 유용한 플러그인
```bash
# trailing-whitespace 빨간색으로 표시
Plugin 'trailing-whitespace'

# git diff를 라인넘버 옆에 +, -, ~ 로 보여줌
Plugin 'airblade/vim-gitgutter'

# 상태바 향상
Plugin 'bling/vim-airline'

# 상태바에 git 브랜치 정보 출력
Plugin 'tpope/vim-fugitive'
```
