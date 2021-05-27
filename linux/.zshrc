setopt prompt_subst

export LANG=en_US.UTF-8

# define colors
C_DEFAULT=$(echo -e "\033[m")
C_WHITE=$(echo -e "\033[1m")
C_BLACK=$(echo -e "\033[30m")
C_RED=$(echo -e "\033[31m")
C_GREEN=$(echo -e "\033[32m")
C_YELLOW=$(echo -e "\033[33m")
C_BLUE=$(echo -e "\033[34m")
C_PURPLE=$(echo -e "\033[35m")
C_CYAN=$(echo -e "\033[36m")
C_LIGHTGRAY=$(echo -e "\033[37m")
C_DARKGRAY=$(echo -e "\033[1;30m")
C_LIGHTRED=$(echo -e "\033[1;31m")
C_LIGHTGREEN=$(echo -e "\033[1;32m")
C_LIGHTYELLOW=$(echo -e "\033[1;33m")
C_LIGHTBLUE=$(echo -e "\033[1;34m")
C_LIGHTPURPLE=$(echo -e "\033[1;35m")
C_LIGHTCYAN=$(echo -e "\033[1;36m")
C_BG_BLACK=$(echo -e "\033[40m")
C_BG_RED=$(echo -e "\033[41m")
C_BG_GREEN=$(echo -e "\033[42m")
C_BG_YELLOW=$(echo -e "\033[43m")
C_BG_BLUE=$(echo -e "\033[44m")
C_BG_PURPLE=$(echo -e "\033[45m")
C_BG_CYAN=$(echo -e "\033[46m")
C_BG_LIGHTGRAY=$(echo -e "\033[47m")

# ALIAS
case `uname` in
    Linux)
        # https://superuser.com/a/109546
        alias ls="ls --color -h --group-directories-first"
        alias ll="ls --color -h --group-directories-first"
        ;;
    Darwin)
        alias ls="ls -lG"
        alias ll="ls -lG"
        ;;
    *)
esac

# GIT
parse_git_branch() {
    BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | tr -d ' ')
    if [ ! -z $BRANCH ]; then
        echo "$BRANCH "
    fi
}

export PS1="$C_CYAN%~$C_DEFAULT $C_YELLOW\$(parse_git_branch)$C_DEFAULT$ "
