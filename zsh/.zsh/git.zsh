# Show the current branch when the working directory is in a Git repository.

setopt prompt_subst

GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"

git_prompt_string() {
  local directory="$PWD"
  while [[ "$directory" != "/" && ! -e "$directory/.git" ]]; do
    directory="${directory:h}"
  done
  [[ -e "$directory/.git" ]] || return

  local branch
  branch=$(command git -C "$directory" symbolic-ref --quiet --short HEAD 2>/dev/null)
  [[ -n "$branch" ]] || branch="git"
  print -r -- "$GIT_PROMPT_PREFIX%{$fg[white]%}$branch$GIT_PROMPT_SUFFIX"
}
