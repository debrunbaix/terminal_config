# Theme based on kardan theme but with my color and rprompt.

function get_host {
	echo ' '$HOST
}

PROMPT='%F{#df4dde}> %f'
RPROMPT='%~$(git_prompt_info)$(get_host)'

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
