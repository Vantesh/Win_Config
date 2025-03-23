if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

if test -f ~/.config/git/git-prompt.sh
then
	. ~/.config/git/git-prompt.sh
else
	PS1='\[\033]0;$TITLEPREFIX:$PWD\007\]' # set window title
	 PS1="$PS1"'\n'                 # new line
	PS1="$PS1"'\[\033[32m\]'       # change to green
	PS1='\[\e[38;5;49m\]\u on \[\e[0m\] ' # username with ON
	PS1="$PS1"'\[\033[36m\]\w\[\033[32m\]'  # current working directory in cyan, then change back to green
	if test -z "$WINELOADERNOEXEC"
	then
		GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
		COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
		COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
		COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
		if test -f "$COMPLETION_PATH/git-prompt.sh"
		then
			. "$COMPLETION_PATH/git-completion.bash"
			. "$COMPLETION_PATH/git-prompt.sh"
			PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")';PS1="$PS1"'\[\e[38;5;201m\]${PS1_CMD1}\[\e[0m\]'   # bash function
		fi
	fi
	# PS1="$PS1"'\[\033[0m\]'        # change color
	PS1="$PS1"'\[\033[32m\]'			 # change to green
	PS1="$PS1"'\n'                 # new line
	PS1="$PS1"' '                 # prompt: always $
	PS1="$PS1"'\[\033[0m\]'        # change color to white
fi

MSYS2_PS1="$PS1"               # for detection by MSYS2 SDK's bash.basrc

# Evaluate all user-specific Bash completion scripts (if any)
if test -z "$WINELOADERNOEXEC"
then
	for c in "$HOME"/bash_completion.d/*.bash
	do
		# Handle absence of any scripts (or the folder) gracefully
		test ! -f "$c" ||
		. "$c"
	done
fi
